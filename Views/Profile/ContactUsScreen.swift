//
//  ContactUsScreen.swift
//  SmartBookings
//
//  Created by Esfera-Macmini on 10/05/23.
//

import SwiftUI
struct ContactUsScreen: View {
    @State var showPreloader: Bool = false
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Contact us")
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20){
                        HStack {
                            HStack{
                                Group{
                                    Image("ic_what_up")
                                        .scaledToFit()
                                        .padding(.leading, 60)
                                }.frame(width: 30, height: 30, alignment: .center)
                            }
                            Text("Whatsapp")
                                .font(Font.custom("poppins", size: 15))
                                .fontWeight(.regular)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width - 40 )
                                .onTapGesture {
                                    print("select Whatsapp")
                                    
                                    let phoneNumber =  AppUtil.getSettingsUrl.whatsAppNo ?? 0  // you need to change this number
                                    let appURL = URL(string: "https://api.whatsapp.com/send?phone=\(phoneNumber)")!
                                    if UIApplication.shared.canOpenURL(appURL) {
                                        if #available(iOS 10.0, *) {
                                            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
                                        }
                                        else {
                                            UIApplication.shared.openURL(appURL)
                                        }
                                    }
                                }
                            
                        }.frame(width: UIScreen.main.bounds.width - 40 )
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("WhatsApp"), lineWidth: 1.5).opacity(0.5))
                            .padding(.top, 20)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .frame(height: 55)
                        
                        HStack {
                            HStack{
                                Group{
                                    Image("ic_quick_conversation")
                                        .scaledToFit()
                                        .padding(.leading, 60)
                                }.frame(width: 20, height: 20, alignment: .center)
                            }
                            Text("Quick Conversation")
                                .font(Font.custom("poppins", size: 15))
                                .fontWeight(.regular)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width - 40 )
                                .onTapGesture {
                                    print("select Quick Conversation")
                                    
//                                    let sms = "sms:+" + AppUtil.getSettingsUrl.phoneNo ?? "" + "&body=Hello Abc How are You I am ios developer."
//                                        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//                                        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
                                    
                                    let phoneNumber = AppUtil.getSettingsUrl.phoneNo ?? 0
                                    let text = "Hello Manasik."

                                    guard let messageURL = URL(string: "sms:\(phoneNumber)&body=\(text)")
                                    else { return }
                                    if UIApplication.shared.canOpenURL(messageURL) {
                                        UIApplication.shared.openURL(messageURL)
                                    }
                                    
                                }
                            
                        }.frame(width: UIScreen.main.bounds.width - 40 )
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("QuickConversation"), lineWidth: 1.5).opacity(0.5))
                            .padding(.top, 20)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .frame(height: 55)
                        
                        
                        HStack {
                            HStack{
                                Group{
                                    Image("ic_telephone_conver")
                                        .scaledToFit()
                                        .padding(.leading, 60)
                                }.frame(width: 20, height: 20, alignment: .center)
                            }
                            Text("Telephone Conversation")
                                .font(Font.custom("poppins", size: 15))
                                .fontWeight(.regular)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width - 40 )
                                .onTapGesture {
                                    print(" select Telephone Conversation")
                                    
                                    let numberString = "\(AppUtil.getSettingsUrl.phoneNo ?? 0)"
                                    let telephone = "tel://"
                                        let formattedString = telephone + numberString
                                        guard let url = URL(string: formattedString) else { return }
                                        UIApplication.shared.open(url)
                                }
                            
                        }.frame(width: UIScreen.main.bounds.width - 40 )
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("TelephoneConversation"), lineWidth: 1.5).opacity(0.5))
                            .padding(.top, 20)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .frame(height: 55)
                        
                        HStack {
                            HStack{
                                Group{
                                    Image("ic_gmail_icon")
                                        .scaledToFit()
                                        .padding(.leading, 60)
                                }.frame(width: 20, height: 20, alignment: .center)
                            }
                            Text("Send Email")
                                .font(Font.custom("poppins", size: 15))
                                .fontWeight(.regular)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width - 40 )
                                .onTapGesture {
                                    print("select Send Email")

                                    let email = AppUtil.getSettingsUrl.email ?? ""
                                    if let url = URL(string: "mailto:\(email)") {
                                      if #available(iOS 10.0, *) {
                                        UIApplication.shared.open(url)
                                      } else {
                                        UIApplication.shared.openURL(url)
                                      }
                                    }
                                    
                                }
                            
                        }.frame(width: UIScreen.main.bounds.width - 40 )
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("SendEmail"), lineWidth: 1.5).opacity(0.5))
                            .padding(.top, 20)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .frame(height: 55)
                        
                    }
                    
//                @objc func dialNumber(number : String) {
//                     if let url = URL(string: "tel://\(number)"),
//                       UIApplication.shared.canOpenURL(url) {
//                          if #available(iOS 10, *) {
//                            UIApplication.shared.open(url, options: [:], completionHandler:nil)
//                           } else {
//                               UIApplication.shared.openURL(url)
//                           }
//                       } else {
//                                // add error message here
//                       }
//                    }
                    
                    
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .background(Color("F2F5F9"))
//            .ignoresSafeArea(.container, edges: .top)
//            .foregroundColor(.black)
    }
}

struct ContactUsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsScreen()
    }
}




