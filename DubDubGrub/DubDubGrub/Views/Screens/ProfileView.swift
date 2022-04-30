//
//  ProfileView.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var companyName = ""
    @State private var bio = ""
    @State private var avatar = PlaceholderImageManager.defaultAvatar
    @State private var isShowingPhotoPicker = false
    @State private var alertItem: AlertItem?
    
    var body: some View {
        VStack {
            ZStack {
                NameBackgroundView()
                
                HStack(spacing: 20) {
                    ZStack {
                        AvatarView(size: 84, image: avatar)
                        EditImage()
                    }
                    .padding(.leading, 12)
                    .onTapGesture {
                        isShowingPhotoPicker = true
                    }
                    
                    VStack(spacing: 1) {
                        TextField("First Name", text: $firstName)
                            .profileNameStyle()
                        
                        TextField("Last Name", text: $lastName)
                            .profileNameStyle()
                        
                        TextField("Company Name", text: $companyName)
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                    }
                    .padding(.trailing, 16)
                }
                .padding()
            }
            
            VStack(alignment: .leading) {
                CharactersRemainView(currentCount: bio.count)
                
                TextEditor(text: $bio)
                    .bioEditorStyle()
          
            }
            .padding(.horizontal, 16)
            
            Spacer()
            
            Button {
                createProfile()
            } label: {
                DDGButton(title: "Create Profile", backgroundColor: .brandPrimary)
            }
            .padding(.vertical)

        }
        .navigationTitle("Profile")
        .toolbar(content: {
            Button {
                dismissKeyboard()
            } label: {
                Image(systemName: "keyboard.chevron.compact.down")
            }
        })
        .alert(item: $alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .sheet(isPresented: $isShowingPhotoPicker) {
            PhotoPicker(image: $avatar)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
    }
}

struct NameBackgroundView: View {
    var body: some View {
        Color(UIColor.secondarySystemBackground)
            .frame(height: 130)
            .cornerRadius(12)
            .padding(.horizontal)
    }
}

struct EditImage: View {
    var body: some View {
        Image(systemName: "square.and.pencil")
            .resizable()
            .scaledToFit()
            .frame(width: 14, height: 14)
            .foregroundColor(.white)
            .offset(y: 30)
    }
}

struct CharactersRemainView: View {
    
    var currentCount: Int
    
    var body: some View {
        Text("Bio: ")
            .font(.callout)
            .foregroundColor(.secondary)
        +
        Text("\(100 - currentCount)")
            .bold()
            .font(.callout)
            .foregroundColor(currentCount <= 100 ? .brandPrimary : .red)
        +
        Text(" Charcter remain")
            .font(.callout)
            .foregroundColor(.secondary)
    }
}


// MARK: - extension for func
extension ProfileView {
    func createProfile() {
        guard isValidProfile() else {
            // show alert
            alertItem = AlertContext.invalidProfile
            
            return
        }
        
        // create our profile send it up to cloudkit
    }
    
    func isValidProfile() -> Bool {
        
        guard !firstName.isEmpty,
              !lastName.isEmpty,
              !companyName.isEmpty,
              !bio.isEmpty,
              avatar != PlaceholderImageManager.defaultAvatar,
              bio.count < 100 else  {
            return false
        }
        
        return true
    }
}
