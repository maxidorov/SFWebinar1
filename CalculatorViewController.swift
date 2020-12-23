import UIKit

class ViewController: UIViewController {
    enum Operation {
        case plus
        case minus
        case divide
        case multiply
    }

    var operation: Operation? = nil
    var operand1: Int = 0
    var operand2: Int?

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        makeCornerRadiusOnButtons()
    }


    @IBAction func numberButtonAction(_ sender: UIButton) {
        let number = Int(sender.titleLabel!.text!)!
        print(number)

        if resultLabel.text == "0" {
            resultLabel.text = sender.titleLabel?.text
        } else {
            resultLabel.text = resultLabel.text! + (sender.titleLabel?.text)!
        }
    }

    private func makeCornerRadiusOnButtons() {
        for subview in stackView.subviews {
            guard let stackView = subview as? UIStackView else { return }
            for subview in stackView.arrangedSubviews {
                guard let button = subview as? UIButton else { return }
                button.layer.masksToBounds = true
                button.layer.cornerRadius = button.frame.height / 2
            }
        }
    }
}
