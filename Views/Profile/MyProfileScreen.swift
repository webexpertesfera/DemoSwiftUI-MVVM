//
//  MyProfileScreen.swift
//  SmartBookings
//
//  Created by Sheheryar on 03/06/2022.
//

import SwiftUI

struct MyProfileScreen: View {
    var textColor: String = "000000"
    @State var firstName: String = AppUtil.userProfile?.firstName ?? ""
    @State var lastName: String = AppUtil.userProfile?.lastName ?? ""
    @State var mobileNo: String = String(AppUtil.userProfile?.phone ?? 0)
    @State var email: String = AppUtil.userProfile?.email ?? ""
    @State var verifyEmaill = AppUtil.userProfile?.verifyEmail
    @State var dob: String = ""
    @State var address: String = AppUtil.userProfile?.address ?? ""
    @State var nationality: String = AppUtil.userProfile?.nationality ?? ""
    @State var idNumber: String = AppUtil.userProfile?.commId ?? ""
    @EnvironmentObject var viewRouter: ViewRouter
    @State var dateOfBirth: Date =  AppUtil.getStringToDate(dateValue: AppUtil.userProfile?.dob ?? "")
    @State var showPreloader: Bool = false
    @State var showImagePicker: Bool = false
    @State var pickerResult: [UIImage] = []
    
    @ObservedObject var textFieldManager = TextFieldManager()
    @State var textNumber: String = ""
    @State var togglepopup: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "My Profile")
                VStack{
                    ScrollView(showsIndicators:false){
                        VStack {
                            ZStack {
                                //Image("VendorProfileImage")
                                if AppUtil.userProfile?.file != "" && pickerResult.count == 0 {
                                    AsyncImage(url: URL(string: AppUtil.userProfile?.file ?? "")) { image in
                                        image.resizable()
                                            .clipShape(Circle())
                                            .scaledToFit()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Spacer()
                                            Image("Uploadimage")
                                        }.onTapGesture {
                                            showImagePicker.toggle()
                                        }
                                    }
                                }
                                
                                if pickerResult.count > 0 {
                                    Image(uiImage: pickerResult[0])
                                        .resizable()
                                        .clipShape(Circle())
                                        .scaledToFit()
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Spacer()
                                            Image("Uploadimage")
                                        }.onTapGesture {
                                            showImagePicker.toggle()
                                        }
                                    }
                                }
                            }.frame(width: 130, height: 150, alignment: .center)
                            HStack{
                                Text("Joined: 08 Aug, 2022")
                                    .font(Font.custom("poppins", size: 14))
                                    .foregroundColor(Color(textColor).opacity(0.4))
                                    .fontWeight(.regular)
                                
                            }.padding(.top,5)
                            
                            HStack{
                                Text("Personal Information")
                                    .font(Font.custom("poppins", size: 14))
                                    .foregroundColor(Color(textColor).opacity(0.8))
                                    .fontWeight(.semibold)
                                Spacer()
                            }.padding(.vertical,10)
                                .padding(.horizontal)
                            VStack{
                                Group{
                                    ProfileTextfield(placeHolder: "First Name", textValue: $firstName, verified: false)
                                        .padding(.top,10)
                                    ProfileTextfield(placeHolder: "Last Name", textValue: $lastName, verified: false)
                                        .padding(.top,10)
                                    ProfileTextfield(placeHolder: "Mobile Number", textValue: $mobileNo, verified: false,keyboardType: .numberPad, disabled: true)
                                        .padding(.top,10)
                                        .disabled(true)
                                    ProfileTextfield(placeHolder: "Email", textValue: $email,verified: false, keyboardType: .emailAddress)
                                        .padding(.top,10)
                                    
//                                    TextField("Email", text: $email)
                                    
                                    if verifyEmaill == false{
                                        Text("Verify")
                                          .font(Font.custom("poppins", size: 13))
                                          .foregroundColor(Color("FEBB12"))
                                        .onTapGesture {
                                            showPreloader = true
                                            let object = emailVerifyProfile()
                                            object.email =  email
                                            print("login verify status ",object.email ?? "")
                                            UserApiUtil.emailVerifyApi(body: object, success: { result in
                                                viewRouter.currentPage = "EmailVerifyScreen"
                                            }, failure: { f  in
                                                showPreloader = false
                                            })
                                        }
                                    } else if verifyEmaill == true {
                                        Text("Verified")
                                        .disabled(true)
                                       .font(Font.custom("poppins", size: 12))
                                       .foregroundColor(Color("57B142"))
                                    }
                                 }
                                Group {
                                    RoundedRectangle(cornerRadius: 97)
                                        .frame(width: UIScreen.main.bounds.width - 50, height: 70, alignment: .center)
                                        .foregroundColor(Color("White"))
                                        .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 2)
                                        .overlay(
                                            ZStack{
                                                DatePicker("label", selection: $dateOfBirth, displayedComponents: [.date])
                                                               .datePickerStyle(CompactDatePickerStyle())
                                                               .environment(\.locale, .init(identifier:"en"))
                                                               .labelsHidden()
                                               
                                                    HStack{
                                                        Text(AppUtil.getprofileDate(dateOfBirth))
                                                            .font(Font.custom("poppins", size: 15))
                                                            .foregroundColor(Color("000000").opacity(0.5))
                                                            .fontWeight(.regular)
                                                        Spacer()
                                                    }.userInteractionDisabled()
                                                    .padding(.horizontal,30)
                                            }
                                            
                                        )
                                    
                                    ProfileTextfield( placeHolder: "Address",textValue: $address, verified: false,keyboardType: .default)
                                        .padding(.top,10)
                                    ProfileTextfield( placeHolder: "Nationality",textValue: $nationality, verified: false, keyboardType: .default)
                                        .padding(.top,10)
                                    ProfileTextfield( placeHolder: "ID Number",textValue: $idNumber,verified: false,keyboardType: .default)
                                        .padding(.top,10)
                                }
                                
                                LoginButton(title: "Update", callback: {
                                    showPreloader = true
                                    AppUtil.emailTypeSave = email
                                    AppUtil.userProfile?.firstName = firstName
                                    AppUtil.userProfile?.lastName = lastName
                                    AppUtil.userProfile?.phone = Int(mobileNo)
                                    AppUtil.userProfile?.nationality = nationality
                                    AppUtil.userProfile?.email = email
                                    AppUtil.userProfile?.address = address
                                    AppUtil.userProfile?.commId = idNumber
                                    AppUtil.userProfile?.nationality = nationality
                                    AppUtil.userProfile?.dob = AppUtil.getprofileDate(dateOfBirth)
                                    
                                    if pickerResult.count > 0 {
                                        UserApiUtil.uploadImageForService(paramName: "images", fileName: "hotel1",
                                                                          image: pickerResult,success: { res in
                                            let image = res[0]
                                            print("dfhgudfg", image)
                                            AppUtil.userProfile?.file = image
                                            print("dfhgudfg", AppUtil.userProfile?.file ?? "")
                                            UserApiUtil.updateProfile(body: AppUtil.userProfile ?? ProfileObject(), success: { res in
                                                AppUtil.emailVerify = AppUtil.userProfile?.verifyEmail
//                                                AppUtil.emailVerify = false
                                                 
                                                print("Email verify", AppUtil.userProfile?.verifyEmail ?? 0)
                                                if viewRouter.previousPage == "VerificationScreen" {
                                                    AppUtil.userProfile = res
                                                    showPreloader = false
                                                    viewRouter.currentPage = "VerificationComplete"
                                                } else {
                                                    AppUtil.userProfile = res
                                                    showPreloader = false
                                                    viewRouter.goBack()
                                                }
                                              
                                            }, failure: { _ in
                                                showPreloader = false
                                            })
                                            
                                        }, failure: { _ in
                                            
                                        })
                                    } else {
                                        UserApiUtil.updateProfile(body: AppUtil.userProfile ?? ProfileObject(), success: { res in
                                            AppUtil.emailVerify = AppUtil.userProfile?.verifyEmail
                                            print("Email verify", AppUtil.userProfile?.verifyEmail ?? 0)
//                                            AppUtil.emailVerify = false
                                            if viewRouter.previousPage == "VerificationScreen" {
                                                AppUtil.userProfile = res
                                                showPreloader = false
                                                viewRouter.currentPage = "VerificationComplete"
                                            } else {
                                                AppUtil.userProfile = res
                                                showPreloader = false
                                                viewRouter.goBack()
                                            }
                                          
                                        }, failure: { _ in
                                            showPreloader = false
                                        })
                                    }
                                })
                            }
                            
                            
                        }
                        
                    }
                }
                .keyboardAdaptive()
                
                BottomNavigation()
            }
            .sheet(isPresented: $showImagePicker) {
                PhotoPicker(images: $pickerResult, selectionLimit: 1)
                
            }
            
            if showPreloader {
                VStack {}
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("707070"))
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.6)

                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("FEBB12")))
                    .scaleEffect(x: 4, y: 4, anchor: .center)
            }
        }
        
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
       
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .keyboardAdaptive()
           
    }
}

struct MyProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileScreen()
    }
}
