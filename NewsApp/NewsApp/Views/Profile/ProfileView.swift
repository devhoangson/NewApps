//
//  ProfileView.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var message: String = ""

    private var viewModel = ProfileViewModel()
    init(_ viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField(LocalizedStringKey("profile_enter_your_name_text"), text: self.$userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                SecureField(LocalizedStringKey("profile_enter_pass_word_text"), text: self.$password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Text(self.message)
                    .padding()
                    .font(.title)
                    .foregroundColor(.red)
                    .animation(.easeInOut(duration: 0.75))
                Button(action: {
                    let isValid = self.viewModel.validateInputs(self.userName, self.password)
                    if isValid{
                        if !self.viewModel.isExisedUser(self.userName) {
                            self.viewModel.saveUser(self.userName, self.password)
                            self.message = NSLocalizedString("save_user_success_message", comment: "")
                            self.resetInputs()
                        }else {
                            self.message = NSLocalizedString("error_existed_user_message", comment: "")
                            self.resetInputs()
                        }
                    }else {
                        //TODO: HANDLE VALIDATE INPUTS 
                    }
                }, label: {
                    return Text(LocalizedStringKey("profile_register_text"))
                        .modifier(CustomButtonViewModifier((!self.userName.isEmpty && !self.password.isEmpty) ? .blue : .gray))
                }).disabled(self.userName.isEmpty && self.password.isEmpty)
                .navigationBarTitle(LocalizedStringKey("profile_title"))
                Spacer()
            }
        }
    }
    
    private func resetInputs() {
        self.userName = ""
        self.password = ""
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(ProfileViewModel())
    }
}


struct CustomButtonViewModifier: ViewModifier {
    private(set) var backgroundColor: Color = .red
    
    init(_ color: Color) {
        self.backgroundColor = color
    }
    
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 16))
            .padding(10)
            .foregroundColor(.white)
            .background(self.backgroundColor)
            .cornerRadius(5)
            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: 0, y: 0)
    }
}
