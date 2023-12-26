//
//  AccountViewModel.swift
//  Appetizer
//
//  Created by Mohit Tomer on 24/12/23.
//

import Foundation

final class AccountViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthDate = Date()
    @Published var extraNapkins = false
    @Published var frequentReffils = false
    @Published var alertItme: AlertItem?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItme = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItme = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
    }
}
