//
//  HostProfile.swift
//  SmartBookings
//
//  Created by Sheheryar on 03/08/2022.
//

import SwiftUI

struct HostProfile: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var firstName: String = AppUtil.userProfile?.firstName ?? ""
    @State var lastName: String = AppUtil.userProfile?.lastName ?? ""
    @State var mobileNo: String = String(AppUtil.userProfile?.phone ?? 0)
    @State var email: String = AppUtil.userProfile?.email ?? ""
    @State var dob: String = ""
    @State var address: String = AppUtil.userProfile?.address ?? ""
    @State var nationality: String = AppUtil.userProfile?.nationality ?? ""
    @State var idNumber: String = AppUtil.userProfile?.commId ?? ""
    @State var showPreloader: Bool = false
    @State var showImagePicker: Bool = false
    @State var pickerResult: [UIImage] = []
    
    var body: some View {
        ZStack {
            VStack {
                TopNavigation(titleText: "Become Vendor")
                VStack{
                    HStack{
                        Text("I am a personal")
                            .foregroundColor(Color("000000").opacity(0.9))
                            .font(Font.custom("poppins", size: 20))
                            .fontWeight(.semibold)
                        
                        Text("Host")
                            .foregroundColor(Color("FEBB12"))
                            .font(Font.custom("poppins", size: 20))
                            .fontWeight(.semibold)
                            
                    }.padding(.vertical)
                    
                        HStack{
                            Text("Please enter the details")
                                .foregroundColor(Color("FEBB12"))
                                .font(Font.custom("poppins", size: 18))
                                .fontWeight(.regular)
                            Spacer()
                        }.padding(.horizontal)
                        ScrollView(showsIndicators:false) {
                        Group {
                        
                            VStack(alignment: .leading) {
                                Text("First Name")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))

                                ProfileTextfield(placeHolder: "First Name", textValue: $firstName)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Last Name")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                ProfileTextfield(placeHolder: "Last Name", textValue: $lastName)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Mobile Number")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                ProfileTextfield(placeHolder: "Mobile Number", textValue: $mobileNo,verified: true,keyboardType: .numberPad)
                            }
                                                       
                            VStack(alignment: .leading) {
                                Text("Email")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                ProfileTextfield(placeHolder: "Email", textValue: $email,verified: true,keyboardType: .emailAddress)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Address")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                ProfileTextfield(placeHolder: "Address", textValue: $address)
                            }
                              
                            VStack(alignment: .leading) {
                                Text("Nationality")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                ProfileTextfield(placeHolder: "Nationality", textValue: $nationality)
                            }

                            VStack(alignment: .leading) {
                                Text("ID Number")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                ProfileTextfield(placeHolder: "ID Number", textValue: $idNumber)
                             }
                    }.padding(.vertical,5)
                    
                    HStack {
                        Text("Upload ID Photo")
                            .font(.headline)
                            .font(Font.custom("poppins", size: 16))
                            .foregroundColor(Color("000000").opacity(0.7))
                        
                        Spacer()
                    }.padding(.horizontal)
                    HStack {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 150, height: 50, alignment: .center)
                            .foregroundColor(Color("White"))
                            .shadow(radius: 1)
                            .overlay(
                              Text("Upload photo")
                                .foregroundColor(Color("FEBB12"))
                                .font(Font.custom("poppins", size: 16))
                                .fontWeight(.regular)
                            ).onTapGesture {
                                showImagePicker.toggle()
                            }
                       }
                    
                        if pickerResult.count > 0 {
                            Image(uiImage: pickerResult[0])
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                                .frame(width: 200, height: 150, alignment: .center)
                        }
                        
                    

                    LoginButton(title: "Done", callback: {
                        showPreloader = true
                        AppUtil.userProfile?.firstName = firstName
                        AppUtil.userProfile?.lastName = lastName
                        AppUtil.userProfile?.phone = Int(mobileNo)
                        AppUtil.userProfile?.nationality = nationality
                        AppUtil.userProfile?.email = email
                        AppUtil.userProfile?.address = address
                        AppUtil.userProfile?.commId = idNumber
                        
                        let requestObject = HostRequest()
                        requestObject.firstName = firstName
                        requestObject.lastName = lastName
                        requestObject.phone = mobileNo
                        requestObject.email = email
                        requestObject.address = address
                        requestObject.idNumber = idNumber
                        requestObject.nationality = nationality
                                                
                        if pickerResult.count > 0 {
                            print("pickerResult.count", pickerResult.count)
                            UserApiUtil.hostuploadService(paramName: "image", fileName: "hotel1",
                                                          image: pickerResult,success: { res in
                                print("res sfsjfsdfsf", res)
                                let image = res[0]
                                requestObject.uploadIdPhoto = image
                                VendorApiUtil.becomeVendorHost(body: requestObject, success: { res in
                                AppUtil.hostProfileCompleteMsg = requestObject.msg ?? ""
                                viewRouter.currentPage = "RequestSubmitScreen"
                                }, failure: { _ in
                                    showPreloader = false
                                   print("sdffdf*******")
                                })
                                
                            }, failure: { _ in
                                showPreloader = false
                                print("fsdfdffsdf*******")
                            })
                        } else {
                            showPreloader = true
                            VendorApiUtil.becomeVendorHost(body: requestObject, success: { _ in
                                AppUtil.hostProfileCompleteMsg = requestObject.msg ?? ""
                                viewRouter.currentPage = "RequestSubmitScreen"
                            }, failure: { _ in
                                showPreloader = false
                                print("fsdfdffsdf*******")
                            })
                        }
    
                    }).padding(.vertical)
                  }
                }
                .keyboardAdaptive()
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

        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .onTapGesture {
                hideKeyboard()
            }
        
        
    }
}

struct HostProfile_Previews: PreviewProvider {
    static var previews: some View {
        HostProfile()
    }
}
