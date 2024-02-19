//
//  SettingScreen.swift
//  SmartBookings
//
//  Created by apple on 08/11/2022.
//

import SwiftUI

struct SettingScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var minPrice: Float = 25
    @State var ArbCheck: Bool = false
    @State var EngCheck: Bool = false
    @State var notificationCheck: Bool = AppUtil.appSettings.notification ?? true
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Settings")
                ScrollView{
                    VStack{
//                        HStack{
//                            Text("Distance")
//                                .foregroundColor(Color("000000").opacity(0.8))
//                                .font(Font.custom("poppins", size: 14))
//                                .fontWeight(.regular)
//                                .multilineTextAlignment(.center)
//                            Text(String(minPrice))
//                                .foregroundColor(Color("000000").opacity(0.8))
//                                .font(Font.custom("poppins", size: 14))
//                                .fontWeight(.regular)
//                                .multilineTextAlignment(.center)
//                            Spacer()
//                        }
//                        Slider(value: $minPrice, in: 25...1000, step: 50)
//                            .accentColor(Color("FEBB12"))
                        
//                        HStack{
//
//                            Text("Language")
//                                .foregroundColor(Color("000000").opacity(0.8))
//                                .font(Font.custom("poppins", size: 14))
//                                .fontWeight(.regular)
//                                .multilineTextAlignment(.center)
//                            Spacer()
//                        }.padding(.top)
//                        HStack{
//
//                            Text("Language")
//                                .foregroundColor(Color("000000").opacity(0.8))
//                                .font(Font.custom("poppins", size: 16))
//                                .fontWeight(.medium)
//                                .multilineTextAlignment(.center)
//
//                            Spacer()
//                        }.padding(.horizontal,10)

                        VStack{
                            HStack{
                                Text("Language")
                                    .foregroundColor(Color("000000").opacity(0.8))
                                    .font(Font.custom("poppins", size: 16))
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                        }.padding(.top,10)
                            .padding(.horizontal, 10)
                        Spacer()

                        
                        HStack{
                            Circle()
                                .frame(width: 25, height: 25, alignment: .center)
                                .foregroundColor(Color(ArbCheck ?  "FEBB12" : "White"))
                                .shadow(radius: 1)
                                .onTapGesture {
                                    let defaults = UserDefaults.standard
                                    defaults.set("ar", forKey: Keys.language)

                                    
                                    if let token = defaults.value(forKey: Keys.language) as? String {
                                        print("defaults Token: \(token)")
                                    }
                                    ArbCheck = true
                                    EngCheck = false
                                }
                            
                            Text("Arabic")
                                .foregroundColor(Color("000000").opacity(0.7))
                                .font(Font.custom("poppins", size: 14))
                                .fontWeight(.medium)
                            
                            Spacer()
                            
                          
                            
                        }
                        
                        HStack{
                            Circle()
                                .frame(width: 25, height: 25, alignment: .center)
                                .foregroundColor(Color(EngCheck ? "FEBB12" : "White"))
                                .shadow(radius: 1)
                                .onTapGesture {
                                    let defaults = UserDefaults.standard
                                    defaults.set("en", forKey: Keys.language)
                                    
                                    if let token = defaults.value(forKey: Keys.language) as? String {
                                        print("defaults Token: \(token)")
                                    }
                                    EngCheck = true
                                    ArbCheck = false
                                }
                            
                            Text("English")
                                .foregroundColor(Color("000000").opacity(0.7))
                                .font(Font.custom("poppins", size: 14))
                                .fontWeight(.medium)
                            
                            Spacer()
                        }
                        
                        VStack{
                            HStack{
                                Toggle(isOn: $notificationCheck) {
                                    Text("Notification")
                                        .foregroundColor(Color("000000").opacity(0.7))
                                        .font(Font.custom("poppins", size: 15))
                                        .fontWeight(.medium)
                                        .multilineTextAlignment(.center)
                                }
                            }//.padding(.horizontal)
                        }.padding(.top)
                        Spacer()
                        LoginButton(title: "Update Settings",callback: {
                            var setObj = SettingsObject()
//                            var distanceObj = Distance()
//                            distanceObj.unit = "KM"
//                            distanceObj.maxDistance = Int(minPrice)
//                            setObj.distance = distanceObj
                            setObj.notification = notificationCheck
                            setObj.language = ArbCheck ? "العربية" : "English"
                            
                            UserApiUtil.updateSetting(body: setObj, success: { res in
                                AppUtil.appSettings = res
                                viewRouter.goBack()
                            }, failure: { _ in
                                viewRouter.goBack()
                            })
                            
                        }).padding(.vertical,20)
                        
                    }.padding(.horizontal)
                        .padding(.top)
                  
                }
            }
        }  .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            
            .background(Color("F2F5F9"))
            .onAppear(perform: {
                if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                    if language == "ar" {
                        ArbCheck = true
                        EngCheck = false
                    } else {
                        ArbCheck = false
                        EngCheck = true
                    }
                }
                
            })
            
    }
}

struct SettingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreen()
    }
}
