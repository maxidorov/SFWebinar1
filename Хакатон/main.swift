//
//  main.swift
//  Хакатон
//
//  Created by Maxim Sidorov on 08.11.2020.
//

import Foundation

// Представление пользовательских данных

protocol UserData {
  var userName: String { get }              // Имя пользователя
  var userCardId: String { get }            // Номер карты
  var userCardPin: Int { get }              // Пин-код
  var userCash: Float { get set}            // Наличные пользователя
  var userBankDeposit: Float { get set}     // Банковский депозит
  var userPhone: String { get }             // Номер телефона
  var userPhoneBalance: Float { get set}    // Баланс телефона
}

// Тексты ошибок
enum TextErrors: String {
    case CARD_NUMBER_OR_PIN_INCORRECT = "Данные карты введены неверно"
    case ENTERED_INCORRECT_PHONE = "Введен неверный номер телефона"
    case YOU_DONT_HAVE_ENOUGH_CASH = "У вас недостаточно наличных"
    case YOU_DONT_HAVE_ENOUGH_FINDS_DEPOSIT = "У вас недостаточно средств на депозите"
}

// Виды операций, выбранных пользователем (подтверждение выбора)
enum DescriptionTypesAvailableOperations: String {
    case balance = "Вы выбрали операцию запросить баланс"
    case phone = "Вы выбрали операцию пополнить баланс телефона"
    case withdrawal = "Вы выбрали операцию снятия средств с депозита"
    case topUp = "Вы выбрали операцию пополнения депозита"
}

// Действия, которые пользователь может выбирать в банкомате (имитация кнопок)
enum UserActions {
    case userPressedBalanceBtn // запросить баланс
    case userPressedTopUpAccount(topUp: Float) // положить деньги на депозит
    case userPressedWithdrawCashAccount(withdrawCash: Float) // снять деньги с депозита
    case userPressedPayPhone(phone: String) // оплатить телефон
}

// Способ оплаты/пополнения наличными или через депозит
enum PaymentMethod {
    case cash(cash: Float)
    case deposit(deposit: Float)
}

class ATM {
    private let userCardId: String
    private let userCardPin: Int
    private var someBank: BankApi
    private let action: UserActions
    private let paymentMethod: PaymentMethod?
    
    init(userCardId: String, userCardPin: Int, someBank: BankApi, action: UserActions, paymentMethod: PaymentMethod? = nil) {
        
        self.userCardId = userCardId
        self.userCardPin = userCardPin
        self.someBank = someBank
        self.action = action
        self.paymentMethod = paymentMethod
        
        sendUserDataToBank(userCardId: userCardId, userCardPin: userCardPin, actions: action, payment: paymentMethod)
    }
    
    
    public final func sendUserDataToBank(userCardId: String, userCardPin: Int, actions: UserActions, payment: PaymentMethod?) {
        let isUserExist = someBank.checkCurrentUser(userCardId: userCardId, userCardPin: userCardPin)
        if isUserExist {
            switch actions {
            case .userPressedBalanceBtn:
                someBank.showUserBalance()
            case let .userPressedPayPhone(phone):
                if someBank.checkUserPhone(phone: phone) {
                    if let payment = payment {
                        switch payment {
                        case let .cash(cash: payment):
                            if someBank.checkMaxUserCash(cash: payment) {
                                someBank.topUpPhoneBalanceCash(pay: payment)
                                someBank.showUserToppedUpMobilePhoneCash(cash: payment)
                            } else {
                                someBank.showError(error: .YOU_DONT_HAVE_ENOUGH_CASH)
                            }
                        case let .deposit(deposit: payment):
                            if someBank.checkMaxAccountDeposit(withdraw: payment) {
                                someBank.topUpPhoneBalanceDeposit(pay: payment)
                                someBank.showUserToppedUpMobilePhoneDeposit(deposit: payment)
                            } else {
                                someBank.showError(error: .YOU_DONT_HAVE_ENOUGH_FINDS_DEPOSIT)
                            }
                        }
                    }
                } else {
                    someBank.showError(error:.ENTERED_INCORRECT_PHONE)
                }
            case let .userPressedTopUpAccount(topUp: payment):
                if someBank.checkMaxUserCash(cash: payment) {
                    someBank.putCashDeposit(topUp: payment)
                    someBank.showTopUpAccount(cash: payment)
                } else {
                    someBank.showError(error: .YOU_DONT_HAVE_ENOUGH_CASH)
                }
            case let .userPressedWithdrawCashAccount(withdrawCash):
                if someBank.checkMaxAccountDeposit(withdraw: withdrawCash) {
                    someBank.getCashFromDeposit(cash: withdrawCash)
                    someBank.showWithdrawalDeposit(cash: withdrawCash)
                } else {
                    someBank.showError(error: .YOU_DONT_HAVE_ENOUGH_FINDS_DEPOSIT)
                }
            }
        } else {
            someBank.showError(error: .CARD_NUMBER_OR_PIN_INCORRECT)
        }
    }
}

// Протокол по работе с банком предоставляет доступ к данным пользователя зарегистрированного в банке
protocol BankApi {
  func showUserBalance()
  func showUserToppedUpMobilePhoneCash(cash: Float)
  func showUserToppedUpMobilePhoneDeposit(deposit: Float)
  func showWithdrawalDeposit(cash: Float)
  func showTopUpAccount(cash: Float)
  func showError(error: TextErrors)
 
  func checkUserPhone(phone: String) -> Bool
  func checkMaxUserCash(cash: Float) -> Bool
  func checkMaxAccountDeposit(withdraw: Float) -> Bool
  func checkCurrentUser(userCardId: String, userCardPin: Int) -> Bool
 
  mutating func topUpPhoneBalanceCash(pay: Float)
  mutating func topUpPhoneBalanceDeposit(pay: Float)
  mutating func getCashFromDeposit(cash: Float)
  mutating func putCashDeposit(topUp: Float)
}

struct BankServer: BankApi {
  private var user: UserData
  
  init(user: UserData) {
    self.user = user
  }
  
  public func showUserBalance() {
    let report = """
    Здравствуйте, \(user.userName)
    \(DescriptionTypesAvailableOperations.balance.rawValue)
    Ваш баланс депозита составляет: \(user.userBankDeposit) рублей
    Хорошего дня!
    """
    print(report)
  }
  
  public func showUserToppedUpMobilePhoneCash(cash: Float){
    let report = """
    Здравствуйте, \(user.userName)
    \(DescriptionTypesAvailableOperations.phone.rawValue)
    Вы пополнили баланс наличными на сумму: \(cash)
    У вас осталось \(user.userCash) рублей наличными
    Баланс вашего телефона составляет: \(user.userPhoneBalance) рублей
    Хорошего дня!
    """
    print(report)
  }
  
  public func showUserToppedUpMobilePhoneDeposit(deposit: Float){
    let report = """
    Здравствуйте, \(user.userName)
    \(DescriptionTypesAvailableOperations.phone.rawValue)
    Вы пополнили баланс с депозитных средств на сумму: \(deposit)
    У вас осталось на депозите: \(user.userBankDeposit)
    Баланс вашего телефона составляет: \(user.userPhoneBalance) рублей
    Хорошего дня!
    """
    print(report)
  }
  
  func showWithdrawalDeposit(cash: Float) {
    let report = """
    Здравствуйте, \(user.userName)
    \(DescriptionTypesAvailableOperations.withdrawal.rawValue)
    Вы сняли с депозита средства на сумму: \(cash)
    У вас осталось на депозите: \(user.userBankDeposit) рублей
    У вас осталось наличных: \(user.userCash) рублей
    Хорошего дня!
    """
    print(report)
  }
  
  func showTopUpAccount(cash: Float) {
    let report = """
    Здравствуйте, \(user.userName)
    \(DescriptionTypesAvailableOperations.topUp.rawValue)
    Вы пополнили депозит на сумму: \(cash)
    Сумма депозита составляет : \(user.userBankDeposit) рублей
    У вас осталось наличных: \(user.userCash) рублей
    Хорошего дня!
    """
    print(report)
  }
  
  func showError(error: TextErrors) {
    let error = """
    Здравствуйте, \(user.userName)
    Ошибка: \(error.rawValue)
    Хорошего дня!
    """
    print(error)
  }
  
  public mutating func putCashDeposit(topUp: Float) {
    user.userBankDeposit += topUp
    user.userCash -= topUp
  }
  
  public mutating func getCashFromDeposit(cash: Float) {
    user.userBankDeposit -= cash
    user.userCash += cash
  }
  
  public mutating func topUpPhoneBalanceCash(pay: Float) {
    user.userPhoneBalance += pay
    user.userCash -= pay
  }
  
  public mutating func topUpPhoneBalanceDeposit(pay: Float) {
    user.userPhoneBalance += pay
    user.userBankDeposit -= pay
  }
  
  public func checkMaxAccountDeposit(withdraw: Float) -> Bool {
    if withdraw <= user.userBankDeposit {
      return true
    }
    return false
  }
  
  public func checkMaxUserCash(cash: Float) -> Bool{
    if cash <= user.userCash {
      return true
    }
    return false
  }
  
  public func checkUserPhone(phone: String) -> Bool {
    if phone == user.userPhone {
      return true
    }
    return false
  }
  
  public func checkCurrentUser(userCardId: String, userCardPin: Int) -> Bool {
    let isCorrectId = checkId(id: userCardId, user: user)
    let isCorrectPin = checkPin(pin: userCardPin, user: user)
    
    if isCorrectId && isCorrectPin {
      return true
    }
    return false
  }
  
  private func checkPin(pin: Int, user: UserData) -> Bool {
    if pin == user.userCardPin {
      return true
    }
    return false
  }
  
  private func checkId(id: String, user: UserData) -> Bool {
    if id == user.userCardId {
      return true
    }
    return false
  }
}

struct User: UserData {
  var userName: String
  var userCardId: String
  var userCardPin: Int
  var userCash: Float
  var userBankDeposit: Float
  var userPhone: String
  var userPhoneBalance: Float
}

// Пользовательские данные, которые хранятся на сервере банка (данные были внесены, когда пользователь зарегистрировался в банке)
let egor_pupkin: UserData = User(userName: "Egor Pupkin", userCardId: "3339 0039 3312 2222", userCardPin: 1234, userCash: 2234.34, userBankDeposit: 5994.4, userPhone: "+7(889)-393-43-44", userPhoneBalance: -34.44)

// Какой-то банк, в котором зарегистрирован пользователь (в этом банке хранятся данные пользователя)
let bankClient = BankServer(user: egor_pupkin)

// Текущий банкомат, с которым мы работаем в данный момент / пользователь вводит данные и пытается выполнить некую операцию.
let atm443 = ATM(
    userCardId: "3339 0039 3312 2222",
    userCardPin: 1234,
    someBank: bankClient,
    action: .userPressedPayPhone(phone: "+7(889)-393-43-44"),
    paymentMethod: .cash(cash: 1000)
)
