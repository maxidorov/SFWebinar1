//
//  Response.swift
//  JsonWebinar
//
//  Created by Maxim V. Sidorov on 6/27/21.
//

import Foundation

struct Forecast: Decodable {
  let latitude: Double
  let longitude: Double
  let timezone: String
}
