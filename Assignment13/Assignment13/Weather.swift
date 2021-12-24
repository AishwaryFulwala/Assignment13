//
//  Weather.swift
//  Assignment13
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation

class Weather : Decodable {
    var location : Location
    var current  : Current
}

class Location : Decodable {
    var name = ""
    var region = ""
    var country = ""
}

class Current : Decodable {
    var temp_c : Float
    var temp_f : Float
}
