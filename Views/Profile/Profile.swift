//
//  Profile.swift
//  SmartBookings
//
//  Created by Sheheryar on 03/06/2022.
//

import SwiftUI

struct Profile: View {
    var textColor: String = "000000"
    var textColorYellow: String = "FEBB12"
    @State var name: String = "Lorem ipsum"
    @State var showPreloader: Bool = false
    @State var togglepopup: Bool = false
    @State var DeleteAccountPopUp: Bool = false
    
    @State var deleteAccountloader: Bool = false
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "More")
                ScrollView(showsIndicators: false){
                    VStack{
                        Group {
                            HStack{
                                Text("Welcome")
                                    .font(Font.custom("poppins", size: 15))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(textColor).opacity(0.6))
                                
                                Spacer()
                            }
                            HStack{
                                Text(name)
                                    .font(Font.custom("poppins", size: 22))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(textColor))
                                
                                Spacer()
                            }
                        }
                        
                        if AppUtil.userProfile?.role != "Guest"{
                            VStack{
                                HStack{
                                    Text("My Account")
                                        .font(Font.custom("poppins", size: 18))
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(textColorYellow))
                                    
                                    Spacer()
                                }
                                HStack{
                                    HStack{
                                        Group{
                                            Image("bellicon")
                                                .scaledToFit()
                                        }.frame(width: 30, height: 22, alignment: .center)
                                        
                                        Text("My Profile")
                                            .font(Font.custom("poppins", size: 14))
                                            .fontWeight(.regular)
                                            .foregroundColor(Color(textColor).opacity(0.6))
                                            .padding(.leading,5)
                                    }.onTapGesture{
                                        viewRouter.currentPage = "MyProfileScreen"
                                    }
                                    
                                    
                                    Spacer()
                                }.padding(.top,5)
                                HStack{
                                    Group{
                                        Group{
                                            Image("messageProfile")
                                                .scaledToFit()
                                        }.frame(width: 30, height: 22, alignment: .center)
                                        
                                        Text("Messages")
                                            .font(Font.custom("poppins", size: 14))
                                            .fontWeight(.regular)
                                            .foregroundColor(Color(textColor).opacity(0.6))
                                            .padding(.leading,5)
                                    }.onTapGesture{
                                        viewRouter.currentPage = "Messages"
                                    }
                                    
                                    
                                    Spacer()
                                }.padding(.top,5)
                                
                                HStack{
                                    Group{
                                        Image("balanceProfile")
                                            .scaledToFit()
                                    }.frame(width: 30, height: 22, alignment: .center)
                                    
                                    Text("Balance")
                                        .font(Font.custom("poppins", size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(textColor).opacity(0.6))
                                        .padding(.leading,5)
                                    
                                    Spacer()
                                    Text(String(AppUtil.userProfile?.balance ?? 0))
                                        .font(Font.custom("poppins", size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(textColor).opacity(0.6))
                                    
                                    }
                                .padding(.top,5)
                                
                                if AppUtil.userProfile?.role == "General_User" && AppUtil.userProfile?.role != "Guest"  {
                                    HStack {
                                        Group {
                                            Group {
                                                Image("vendorIcon")
                                                    .scaledToFit()
                                            }.frame(width: 30, height: 22, alignment: .center)
                                            
                                            Text("Become Vendor")
                                                .font(Font.custom("poppins", size: 14))
                                                .fontWeight(.regular)
                                                .foregroundColor(Color(textColorYellow))
                                                .padding(.leading,5)
                                        } .onTapGesture{
                                            viewRouter.currentPage = "BecomeVendor"
                                        }
                                        Spacer()
                                    }.padding(.top,5)
                                }
                                if AppUtil.userProfile?.role != "General_User" && AppUtil.userProfile?.role != "Guest" {
                                    Divider()
                                        .padding(.vertical,10)
                                    
                                        HStack{
                                            Text("Manage services")
                                                .font(Font.custom("poppins", size: 15))
                                                .fontWeight(.regular)
                                                .foregroundColor(Color(textColorYellow))
                                            Spacer()
                                        }
                                    
                                    HStack{
                                        Group{
                                            Group{
                                                Image("AddIMage")
                                                    .scaledToFit()
                                            }.frame(width: 30, height: 22, alignment: .center)
                                            
                                            Text("Add Services")
                                                .font(Font.custom("poppins", size: 14))
                                                .fontWeight(.regular)
                                                .foregroundColor(Color(textColor).opacity(0.6))
                                                .padding(.leading,5)
                                        } .onTapGesture{
                                            let addserviceobj = Hotel()
                                            AppUtil.addserviceObject = addserviceobj
                                            AppUtil.addserviceObject?.description = nil
                                            AppUtil.pickerResult = []
                                            serviceManager.addService = addserviceobj
                                            AppUtil.addserviceSafety = Safty()
                                            AppUtil.addServiceRules = Rules()
                                            AppUtil.addServiceLeisure = Leisuree()
                                            AppUtil.addServiceDescription = Description()
                                            AppUtil.selectedBookingFor = ""
                                            AppUtil.selectedCategory = ""
                                            serviceManager.selectedCancellationType = ""
                                            viewRouter.currentPage = "AddService"
                                            
                                        }
                                        Spacer()
                                        
                                        
                                    }.padding(.top,5)
                                    
                                    HStack{
                                        Group{
                                            Group{
                                                Image("MyService")
                                                    .scaledToFit()
                                            }.frame(width: 30, height: 22, alignment: .center)
                                            
                                            Text("My Services")
                                                .font(Font.custom("poppins", size: 14))
                                                .fontWeight(.regular)
                                                .foregroundColor(Color(textColor).opacity(0.6))
                                                .padding(.leading,5)
                                        } .onTapGesture{
//                                            viewRouter.currentPage = "ServiceLocation"
                                            viewRouter.currentPage = "MyServiceScreen"
                                        }
                                        Spacer()
                                        
                                        
                                    }.padding(.top,5)
                                    
                                    HStack{
                                        Group{
                                            Group{
                                                Image("serviceBooking")
                                                    .scaledToFit()
                                            }.frame(width: 30, height: 22, alignment: .center)
                                            
                                            Text("Service Bookings")
                                                .font(Font.custom("poppins", size: 14))
                                                .fontWeight(.regular)
                                                .foregroundColor(Color(textColor).opacity(0.6))
                                                .padding(.leading,5)
                                        } .onTapGesture{
                                            viewRouter.currentPage = "ServiceBookingScreen"
                                        }
                                        Spacer()
                                        
                                        
                                    }.padding(.top,5)
                                    
                                    HStack{
                                        Group{
                                            Group{
                                                Image("serviceBooking")
                                                    .scaledToFit()
                                            }.frame(width: 30, height: 22, alignment: .center)
                                            
                                            Text("Booking Request")
                                                .font(Font.custom("poppins", size: 14))
                                                .fontWeight(.regular)
                                                .foregroundColor(Color(textColor).opacity(0.6))
                                                .padding(.leading,5)
                                        } .onTapGesture{
                                            viewRouter.currentPage = "BookingRequestScreens"
                                        }
                                        Spacer()
                                        
                                        
                                    }.padding(.top,5)
                                }
                            }.padding(.top,10)
                        }
                        else {
                            VStack{
                                HStack{
                                    Text("My Account")
                                        .font(Font.custom("poppins", size: 15))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(textColorYellow))
                                    Spacer()
                                }
                                HStack{
                                    HStack{
                                        Group{
                                            Image("LOGOUT")
                                                .scaledToFit()
                                        }.frame(width: 30, height: 22, alignment: .center)
                                        Text("Login Now")
                                            .font(Font.custom("poppins", size: 14))
                                            .fontWeight(.regular)
                                            .foregroundColor(Color(textColor).opacity(0.6))
                                            .padding(.leading,5)
                                    }.onTapGesture{
                                        viewRouter.currentPage = "LoginScreen"
                                    }
                                    Spacer()
                                }.padding(.top,5)
                            }
                        }
                        Divider()
                            .padding(.vertical,10)
                        
                        VStack{
                            HStack{
                                Text("Settings")
                                    .font(Font.custom("poppins", size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(textColorYellow))
                                Spacer()
                            }
                            HStack{
                                Group{
                                    Image("language")
                                        .scaledToFit()
                                }.frame(width: 30, height: 30, alignment: .center)
                                
                                Text("Language")
                                    .font(Font.custom("poppins", size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(textColor).opacity(0.6))
                                    .padding(.leading,5)
                                
                                Spacer()
                                Text(AppUtil.appSettings.language ?? "")
                                    .font(Font.custom("poppins", size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(textColor).opacity(0.6))
                            }.padding(.top,5)
                                .onTapGesture{
                                    viewRouter.currentPage = "SettingScreen"
                                }

                            //                            HStack{
    //                                Group{
    //                                    Image("priceticket")
    //                                        .scaledToFit()
    //                                }.frame(width: 30, height: 30, alignment: .center)
                            //
    //                                Text("Price Display")
    //                                    .font(Font.custom("poppins", size: 12))
    //                                    .fontWeight(.regular)
    //                                    .foregroundColor(Color(textColor).opacity(0.6))
    //                                    .padding(.leading,5)
                            //
    //                                Spacer()
    //                                Text("SAR")
    //                                    .font(Font.custom("poppins", size: 12))
    //                                    .fontWeight(.regular)
    //                                    .foregroundColor(Color(textColor).opacity(0.6))
    //                            }.padding(.top,5)
                            
                            HStack{
                                Group{
                                    Image("Distance")
                                        .scaledToFit()
                                }.frame(width: 30, height: 30, alignment: .center)
                                
                                Text("Distance")
                                    .font(Font.custom("poppins", size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(textColor).opacity(0.6))
                                    .padding(.leading,5)
                                
                                Spacer()
                                Text(String(AppUtil.appSettings.distance?.maxDistance ?? 0) + " KM")
                                    .font(Font.custom("poppins", size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(textColor).opacity(0.6))
                            }.padding(.top,5)
                                .onTapGesture{
                                    viewRouter.currentPage = "DistanceScreen"
                                }
                            
                            HStack{
                                Group{
                                    Image("bellnotify")
                                        .scaledToFit()
                                }.frame(width: 30, height: 30, alignment: .center)
                                
                                Text("Notifications")
                                    .font(Font.custom("poppins", size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(textColor).opacity(0.6))
                                    .padding(.leading,5)
                                
                                Spacer()
                                
                            }.padding(.top,5)
                                .onTapGesture{
                                    viewRouter.currentPage = "NotificationScreen"
                                }
                        }
                        Divider()
                            .padding(.vertical,10)
                        VStack{
                            HStack{
                                Text("Information")
                                    .font(Font.custom("poppins", size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(textColorYellow))
                                
                                Spacer()
                            }
                            
                            HStack{
                                HStack{
                                    Group{
                                        Image("contact_mail")
                                            .scaledToFit()
                                    }.frame(width: 30, height: 30, alignment: .center)
                                    
                                    Text("Contact us")
                                        .font(Font.custom("poppins", size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(textColor).opacity(0.6))
                                        .padding(.leading,5)
                                }.onTapGesture{
                                    viewRouter.currentPage = "ContactUsScreen"
                                }
                                Spacer()
                            }.padding(.top,5)
                            
                            
                            HStack{
                                HStack{
                                    Group{
                                        Image("privacyPolic")
                                            .scaledToFit()
                                    }.frame(width: 30, height: 30, alignment: .center)
                                    
                                    Text("Privacy Policy")
                                        .font(Font.custom("poppins", size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(textColor).opacity(0.6))
                                        .padding(.leading,5)
                                }.onTapGesture{
                                    viewRouter.currentPage = "PrivacyPolicyScreen"
                                }
                                
                                
                                Spacer()
                                
                            }.padding(.top,5)
                            
                            
                            HStack{
                                HStack{
                                    Group{
                                        Image("FAQ")
                                            .scaledToFit()
                                    }.frame(width: 30, height: 30, alignment: .center)
                                    
                                    Text("FAQ's")
                                        .font(Font.custom("poppins", size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(textColor).opacity(0.6))
                                        .padding(.leading,5)
                                }.onTapGesture{
                                    viewRouter.currentPage = "FAQs"
                                }
                                
                                
                                Spacer()
                                
                            }.padding(.top,5)
                            
                            HStack{
                                HStack{
                                    Group{
                                        Image("TOU")
                                            .scaledToFit()
                                    }.frame(width: 30, height: 30, alignment: .center)
                                    
                                    Text("Terms of Use")
                                        .font(Font.custom("poppins", size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(textColor).opacity(0.6))
                                        .padding(.leading,5)
                                }.onTapGesture{
                                    viewRouter.currentPage = "TermsAndConditions"
                                }
                                Spacer()
                                
                            }.padding(.top,5)
                            
                            HStack{
                                HStack{
                                    Group{
                                        Image("Delete_account")
                                            .scaledToFit()
                                    }.frame(width: 30, height: 30, alignment: .center)
                                    
                                    Text("Delete Account")
                                        .font(Font.custom("poppins", size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(textColor).opacity(0.6))
                                        .padding(.leading,5)
                                }.onTapGesture {
                                    DeleteAccountPopUp.toggle()
//                                    viewRouter.currentPage = "ContactUsScreen"
                                }
                                Spacer()
                            }.padding(.top,5)
                            
                        }
                        
                       
                        
//                        Divider()
//                            .padding(.vertical,10)
                        if AppUtil.userProfile?.role != "Guest" {
                            HStack{
                                Group{
                                    Image("LOGOUT")
                                        .scaledToFit()
                                }.frame(width: 30, height: 30, alignment: .center)
                                
                                Text("Logout")
                                    .font(Font.custom("poppins", size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(textColor).opacity(0.6))
                                    .padding(.leading,5)
                                    .onTapGesture{
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
                                    }
                                Spacer()
                            }.padding(.top,5)
                        }
                        Divider()
                            .padding(.vertical,10)

                        
                        VStack{
                            HStack{
                                Text("Social Media")
                                    .font(Font.custom("poppins", size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(textColorYellow))
                                
                                Spacer()
                            }
                            
                            HStack(spacing: 20){
                                    HStack {
                                        Group{
                                            Image("ic_twitter_sharing")
                                                .scaledToFit()
                                        }.frame(width: 30, height: 30, alignment: .center)
                                        
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .cornerRadius(10)
                                            .background(Color("FFFFFF"))
                                            .onTapGesture {
                                                print("select twitter")
                                                let twUrl = URL(string: AppUtil.getSettingsUrl.twitterLink ?? "")!
                                                let twUrlWeb = URL(string: "https://www.twitter.com/wixvii")!
                                                if UIApplication.shared.canOpenURL(twUrl){
                                                   UIApplication.shared.open(twUrl, options: [:],completionHandler: nil)
                                                }else{
                                                   UIApplication.shared.open(twUrlWeb, options: [:], completionHandler: nil)
                                                }

                                            }
                                    }.padding(.leading, 20)
                                    
                                    HStack {
                                        Group{
                                            Image("ic_facebook_share")
                                                .scaledToFit()
                                        }.frame(width: 30, height: 30, alignment: .center)
                                        
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .cornerRadius(10)
                                            .background(Color("FFFFFF"))
                                            .onTapGesture {
                                                print("select facebook")
                                                var url = URL(string: AppUtil.getSettingsUrl.facebookLink ?? "")!

                                                if UIApplication.shared.canOpenURL(url) {
                                                    UIApplication.shared.open(url, options: [:],completionHandler: nil)
                                                }
                                            }
                                        }
                                    
                                    HStack {
                                        Group{
                                            Image("ic_camera_share")
                                                .scaledToFit()
                                        }.frame(width: 30, height: 30, alignment: .center)
                                        
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .cornerRadius(10)
                                            .background(Color("FFFFFF"))
                                            .onTapGesture {
                                                print("select instagram")
                                                var instagram = URL(string: AppUtil.getSettingsUrl.instagramLink ?? "")!

                                                    if UIApplication.shared.canOpenURL(instagram) {
                                                        UIApplication.shared.open(instagram, options: [:], completionHandler: nil)
                                                        } else {
                                                            print("Instagram not installed")
                                                    }
                                            }
                                        }
                                    
                                    HStack {
                                        Group{
                                            Image("ic_you_tube")
                                                .scaledToFit()
                                        }.frame(width: 30, height: 30, alignment: .center)
                                            .cornerRadius(10)
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .background(Color("FFFFFF"))
                                            .onTapGesture {
                                                print("select youtube")
                                                var url = URL(string:AppUtil.getSettingsUrl.youTubeLink ?? "")!
                                                if UIApplication.shared.canOpenURL(url) {
                                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                                    } else {
                                                        print("youtube not installed")
                                                }
                                            }
                                        }
                                    }
                                
                                Spacer()
                        }
                                             
                    }.frame(width: UIScreen.main.bounds.width - 40)
                }
                BottomNavigation()
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
            
            if DeleteAccountPopUp {
                ZStack{
                    
                    VStack {}
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("000000"))
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.6)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 330, alignment: .center)
                        .foregroundColor(Color("White"))
                        .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
                        .overlay(
                            VStack{
                                VStack{
                                    Image("informationIcon")
                                        .scaledToFit()
                                }
                                .frame(width: 108, height: 110, alignment: .center)
                                .padding(.top)
                                
                                Text("Info?")
                                    .foregroundColor(Color("000000"))
                                    .font(Font.custom("poppins", size: 20))
                                    .fontWeight(.bold)
                                
                                Text("Are you sure you want to delete your account?")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 16))
                                    .fontWeight(.regular)
                                    .padding(.top,1)
                                
                                HStack{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 70)
                                            .foregroundColor(Color("White"))

                                        RoundedRectangle(cornerRadius: 70)
                                            .stroke(Color("707070"),lineWidth: 1)
                                            .overlay(
                                                Text("No")
                                                    .foregroundColor(Color("000000"))
                                                    .font(Font.custom("poppins", size: 18))
                                                    .fontWeight(.medium)
                                            )
                                        
                                    }.frame(width: 120, height: 35, alignment: .center)
                                        .onTapGesture{
                                            print("No")
                                            DeleteAccountPopUp.toggle()
//                                            viewRouter.currentPage = "LoginScreen"
                                        }
                                    
                                    ZStack {
                                        
                                        RoundedRectangle(cornerRadius: 70)
                                            .foregroundColor(Color("White"))
                                        
                                        RoundedRectangle(cornerRadius: 70)
                                            .stroke(Color("707070"),lineWidth: 1)
                                            .overlay(
                                                Text("YES")
                                                    .foregroundColor(Color("000000"))
                                                    .font(Font.custom("poppins", size: 18))
                                                    .fontWeight(.medium)
                                            )
                                        
                                    }.frame(width: 120, height: 35, alignment: .center)
                                        .onTapGesture {
                                            print("YES")
                                            
                                            if AppUtil.userProfile?.role == "General_User"{
                                                if !deleteAccountloader {
                                                    deleteAccountloader = true
                                                    let requestObject = ProfileObject()
                                                    VendorApiUtil.deleteAccountApi(id:AppUtil.userProfile?._id ?? "" , body: requestObject, success: { _ in
                                                        deleteAccountloader = true
                                                        AppUtil.userProfile = ProfileObject()
                                                        let defaults = UserDefaults.standard
                                                        defaults.set("", forKey: Keys.token)
                                                        defaults.set("", forKey: Keys.userID)
                                                        UserDefaults.standard.removeObject(forKey: Keys.token)
                                                        viewRouter.currentPage = "LoginScreen"
                                                    }, failure: { _ in
                                                        deleteAccountloader = false
                                                        AppUtil.userProfile = ProfileObject()
                                                        let defaults = UserDefaults.standard
                                                        defaults.set("", forKey: Keys.token)
                                                        UserDefaults.standard.removeObject(forKey: Keys.token)
                                                        viewRouter.currentPage = "LoginScreen"
                                                    })
                                                }
                                            }else{
                                                if !deleteAccountloader {
                                                    deleteAccountloader = true
                                                    let requestObject = ProfileObject()
                                                    
                                                    VendorApiUtil.deleteAccountApi(id: AppUtil.userProfile?._id ?? "", body: requestObject, success: { _ in
                                                        deleteAccountloader = true
                                                        AppUtil.userProfile = ProfileObject()
                                                        let defaults = UserDefaults.standard
                                                        defaults.set("", forKey: Keys.token)
                                                        defaults.set("", forKey: Keys.userID)
                                                        UserDefaults.standard.removeObject(forKey: Keys.token)
                                                        viewRouter.currentPage = "LoginScreen"
                                                    }, failure: { _ in
                                                        deleteAccountloader = false
                                                        AppUtil.userProfile = ProfileObject()
                                                        let defaults = UserDefaults.standard
                                                        defaults.set("", forKey: Keys.token)
                                                        UserDefaults.standard.removeObject(forKey: Keys.token)
                                                        viewRouter.currentPage = "LoginScreen"
                                                    })
                                                }
                                            }
                                            

                                        }
                                    }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .padding(.vertical)
                            }
                        )
                }
            }
            
            if deleteAccountloader {
                VStack {}
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("707070"))
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.6)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("FEBB12")))
                    .scaleEffect(x: 4, y: 4, anchor: .center)
            }
            
            
            if togglepopup {
                ZStack{
                    
                    VStack {}
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("000000"))
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.6)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 330, alignment: .center)
                        .foregroundColor(Color("White"))
                        .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
                        .overlay(
                            VStack{
                                VStack{
                                    Image("informationIcon")
                                        .scaledToFit()
                                }
                                .frame(width: 108, height: 110, alignment: .center)
                                .padding(.top)
                                
                                Text("Info?")
                                    .foregroundColor(Color("000000"))
                                    .font(Font.custom("poppins", size: 20))
                                    .fontWeight(.bold)
                                
                                Text("You are not logged In")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                    .padding(.top,1)
                                
                                HStack{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 70)
                                            .foregroundColor(Color("White"))
                                        
                                        RoundedRectangle(cornerRadius: 70)
                                            .stroke(Color("707070"),lineWidth: 1)
                                            .overlay(
                                                Text("Login Now")
                                                    .foregroundColor(Color("000000").opacity(0.4))
                                                    .font(Font.custom("poppins", size: 18))
                                                    .fontWeight(.regular)
                                            )
                                        
                                    }.frame(width: 120, height: 35, alignment: .center)
                                        .onTapGesture{
                                            viewRouter.currentPage = "LoginScreen"
                                        }
                                }
                                
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .padding(.vertical)
                                
                                HStack{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 70)
                                            .foregroundColor(Color("White"))
                                        
                                        RoundedRectangle(cornerRadius: 70)
                                            .stroke(Color("707070"),lineWidth: 1)
                                            .overlay(
                                                Text("Go Back")
                                                    .foregroundColor(Color("000000").opacity(0.4))
                                                    .font(Font.custom("poppins", size: 18))
                                                    .fontWeight(.regular)
                                            )
                                        
                                    }.frame(width: 120, height: 35, alignment: .center)
                                        .onTapGesture{
                                            viewRouter.goBack()
                                        }
                                    
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .padding(.vertical)
                                
                                
                            }
                        )
                    
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        .ignoresSafeArea(.all)
        
        .background(Color("F2F5F9"))
        
        .onAppear(perform: {
            showPreloader = true
            UserApiUtil.getProfile(success: { res in
                AppUtil.userProfile = res
                name = AppUtil.userProfile?.firstName ?? ""
                name += " "
                name += AppUtil.userProfile?.lastName ?? ""
                showPreloader = false
                if AppUtil.appSettings.distance?.maxDistance == nil {
                    UserApiUtil.getSettings(success: { res in
                        AppUtil.appSettings = res
                    }, failure: { _ in
                        
                    })
                }
                
                UserApiUtil.getSettingsApi(success: { res in
                    AppUtil.getSettingsUrl = res
                    print("response setting", res)
                    print("success full response")
                }, failure: { _ in
                    print("failure response")
                })
                
            }, failure: { _ in
                showPreloader = false
            })
        })
        

        
//        .actionSheet(isPresented: .constant(true), content: {
//            ActionSheet(title: Text("Settings"),
//                        message: Text("Choose your language"),
//                        buttons: [
//                            .default(Text("English")) {
//                                print("Tapped on pick from library")
//                            },
//                            .default(Text("SAR")) {
//                                print("Tapped on take a photo")
//                            },
//                            .cancel()
//                        ])
//        })
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
