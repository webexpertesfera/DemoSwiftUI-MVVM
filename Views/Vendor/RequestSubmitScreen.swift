//
//  RequestSubmitScreen.swift
//  SmartBookings
//
//  Created by Sheheryar on 09/06/2022.
//

import SwiftUI

struct RequestSubmitScreen: View {
    private var noDataText: String = "This is a very serious warning. You were warned."
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Become Vendor")
                ZStack{
                    Image("Group 8231")
                        .resizable()
                        .scaledToFit()
                    Image("Group 8233")
                        .resizable()
                        .frame(width: 140, height: 140, alignment: .center)

                }.frame(width: 175, height: 175, alignment: .center)
                HStack{
                    Text("Request Submitted Successfully!")
                        .foregroundColor(Color("000000").opacity(0.7))
                        .font(Font.custom("poppins", size: 20))
                        .fontWeight(.medium)
                }
                
                HStack{
                    
//                    Text("Your request for become Vendor have been sent successfully. Once it approved you will get the notification.")
                    Text("Your vendor host request has been approved, Please logout and login again.")
                        .foregroundColor(Color("000000").opacity(0.7))
                        .font(Font.custom("poppins", size: 16))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                       
                }.padding(.horizontal)
                    .padding(.top)
                
                LoginButton(title: "Done", callback: {
                        UserApiUtil.removeToken(success: { _ in
                            AppUtil.userProfile = ProfileObject()
                            let defaults = UserDefaults.standard
                            defaults.set("", forKey: Keys.token)
                            defaults.set("", forKey: Keys.userID)
                            UserDefaults.standard.removeObject(forKey: Keys.token)
                            viewRouter.currentPage = "LoginScreen"
                        }, failure: { _ in
                            AppUtil.userProfile = ProfileObject()
                            let defaults = UserDefaults.standard
                            defaults.set("", forKey: Keys.token)
                            UserDefaults.standard.removeObject(forKey: Keys.token)
                            viewRouter.currentPage = "LoginScreen"
                        })
                
//                 viewRouter.currentPage = "LoginScreen"
//                 viewRouter.currentPage = "profile"
                }).padding(.top)
                Spacer()
            }
            
//            HStack {
//                Image("Dotted_login")
//                Text("Your vendor host request has been approved, Please logout and login again.")
//                .frame(width: 350, height: 100, alignment: .center)
//            }
//             .padding(25)
//             .background(Color("FFFFFF"))
//             .foregroundColor(Color("000000").opacity(0.7))
//             .cornerRadius(10)
            
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
    }
}

struct ServiceSubmitScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Service")
                ZStack{
                    Image("Group 8231")
                        .resizable()
                        .scaledToFit()
                    Image("Group 8233")
                        .resizable()
                        .frame(width: 140, height: 140, alignment: .center)

                }.frame(width: 175, height: 175, alignment: .center)
                HStack{
                    Text("Request Submitted Successfully!")
                        .foregroundColor(Color("000000").opacity(0.7))
                        .font(Font.custom("poppins", size: 20))
                        .fontWeight(.medium)
                }
                
                HStack{
                    Text("Your service has been submitted. Once it approved you will get the notification.")
                        .foregroundColor(Color("000000").opacity(0.7))
                        .font(Font.custom("poppins", size: 14))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                    
                }.padding(.horizontal)
                    .padding(.top)
                
                LoginButton(title: "Done", callback: {
                    viewRouter.currentPage = "MyServiceScreen"
                }).padding(.top)
                
                Spacer()
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
    }
}

struct RequestSubmitScreen_Previews: PreviewProvider {
    static var previews: some View {
        RequestSubmitScreen()
    }
}


struct EditServiceSubmitScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Service")
                ZStack{
                    Image("Group 8231")
                        .resizable()
                        .scaledToFit()
                    Image("Group 8233")
                        .resizable()
                        .frame(width: 140, height: 140, alignment: .center)

                }.frame(width: 175, height: 175, alignment: .center)
                HStack{
                    Text("Service edit Successfully!")
                        .foregroundColor(Color("000000").opacity(0.7))
                        .font(Font.custom("poppins", size: 20))
                        .fontWeight(.medium)
                }
                
                HStack{
                    Text("Your service has been edited. Once it approved by admin you will get the notification.")
                        .foregroundColor(Color("000000").opacity(0.7))
                        .font(Font.custom("poppins", size: 14))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                    
                }.padding(.horizontal)
                    .padding(.top)
                
                LoginButton(title: "Done", callback: {
                    viewRouter.currentPage = "MyServiceScreen"
                }).padding(.top)
                
                Spacer()
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
    }
}

struct EditServiceSubmitScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditServiceSubmitScreen()
    }
}
