//
//  main.swift
//  JsonWebinar
//
//  Created by Maxim V. Sidorov on 6/27/21.
//

import Foundation

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
    default:
      break
    }
  }

  guard let data = data else {
    print("Ivlid data")
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
