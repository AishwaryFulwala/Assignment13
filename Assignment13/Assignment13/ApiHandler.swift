//
//  ApiHandler.swift
//  Assignment13
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation

class ApiHandler {
    static let shared = ApiHandler()
  
    public var name = ""    
    
    private init() {}
  
    func getWeather () -> [Weather] {
        if let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=9d3f80f4bff84508b9d110237212412&q=surat&aqi=no") {
            do {
                let data = try Data(contentsOf: url)
                print(data)
                do {
                    let t = try JSONDecoder().decode(Weather.self, from: data)
                 
                    return [t]
                }
                catch {
                    print(error)
                }
            }
            catch {
                print(error)
            }
        }
        return [Weather]()
    }
}
