import Foundation

struct Forecast: Codable {
  struct Currently: Codable {
    let summary: String
  }

  let latitude: Double
  let longitude: Double
  let timezone: String
  let currently: Currently
}

let urlString = "https://api.darksky.net/forecast/f47f68d4a0a79164568b12afc04b7fd8/37.8267,-122.4233"

guard let url = URL(string: urlString) else {
  print("Invalid URL")
  fatalError()
}

URLSession.shared.dataTask(with: url) { (data, response, error) in
  if let error = error {
    print(error.localizedDescription)
    return
  }

  if let httpResponse = response as? HTTPURLResponse {
    let code = httpResponse.statusCode
    switch code {
    case (300...599):
      print("Invalid response code: \(code)")
      return
    default:
      break
    }
  }

  guard let data = data else {
    print("Invalid data")
    return
  }

  do {
    let decoder = JSONDecoder()
    let forecast = try decoder.decode(Forecast.self, from: data)
    print(forecast)
  } catch {
    print(error.localizedDescription)
    return
  }
}.resume()

enum CustomError: Error {
  case internalError
  case invalidHttpCode
  case invalidData
  case invalidDecoding
  case invalidEncoding
}

class Manager {

  let decoder = JSONDecoder()
  let encoder = JSONEncoder()

  func makeResponse<T: Decodable>(
    url: URL,
    type: T.Type,
    completion: @escaping (Result<T, CustomError>) -> Void
  ) throws {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let _ = error {
        completion(.failure(.internalError))
        return
      }

      if let httpResponse = response as? HTTPURLResponse {
        let code = httpResponse.statusCode
        switch code {
        case (300...599):
          completion(.failure(.invalidHttpCode))
          return
        default:
          break
        }
      }

      guard let data = data else {
        completion(.failure(.invalidData))
        return
      }

      do {
        let forecast = try self.decoder.decode(T.self, from: data)
        completion(.success(forecast))
        return
      } catch {
        completion(.failure(.invalidDecoding))
        return
      }
    }.resume()
  }

  func encode<T: Encodable>(
    value: T,
    completion: @escaping(Result<String, CustomError>) -> Void
  ) throws {
    do {
      let data = try encoder.encode(value)
      guard let string = String(data: data, encoding: .utf8) else {
        completion(.failure(.invalidData))
        return
      }
      completion(.success(string))
    } catch {
      completion(.failure(.invalidEncoding))
    }
  }
}

let manager = Manager()

do {
  try manager.makeResponse(
    url: url,
    type: Forecast.self,
    completion: { result in
      switch result {
      case .success(let forecast):
        do {
          try manager.encode(value: forecast, completion: { result in
            print(forecast.currently.summary)
            switch result {
            case .success(let string):
              print(string)
            case .failure(let error):
              print(error)
            }
          })
        } catch {
          print(error.localizedDescription)
        }
      case .failure(let error):
        print(error)
      }
    })
} catch {
  print(error.localizedDescription)
}
