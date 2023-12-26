//
//  AccountView.swift
//  Appetizer
//
//  Created by Mohit Tomer on 22/12/23.
//

import SwiftUI

struct AccountView: View {
    
   
    
    var body: some View {
        NavigationStack {
            Form {
                Section("PERSONAL INFO") {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    DatePicker("BirthDate", selection: $birthDate, displayedComponents: .date)
                    Button {
                        print("Save")
                    }label: {
                        Text("Save Changes")
                    }
                }
                Section("REQUESTS") {
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                    Toggle("Frequent Refills", isOn: $frequentReffils)
                }
                //.toggleStyle(SwitchToggleStyle.init(tint: .brandPrimary))
            }
                .navigationTitle("℀ Account")
        }
    }
}

#Preview {
    AccountView()
}
