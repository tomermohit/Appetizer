//
//  User.swift
//  Appetizer
//
//  Created by Mohit Tomer on 24/12/23.
//

import Foundation


struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthDate       = Date()
    var extraNapkins    = false
    var frequentReffils = false
}
