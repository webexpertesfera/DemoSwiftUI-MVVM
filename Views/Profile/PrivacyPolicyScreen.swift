//
//  PrivacyPolicyScreen.swift
//  SmartBookings
//
//  Created by Sheheryar on 09/06/2022.
//

import SwiftUI
import WebKit

struct PrivacyPolicyScreen: View {
    @State var privacyPolicyObjc: PrivacyPolicy = PrivacyPolicy()
    var body: some View {
        ZStack{
            VStack {
                TopNavigation(titleText: "Privacy Policy")
                Spacer()
                if privacyPolicyObjc.privacyPolicy?.count ?? 0 > 0 {
                    ForEach(0 ..< (privacyPolicyObjc.privacyPolicy?.count ?? 0),id:\.self) { ind in
                        if let language1 = UserDefaults.standard.value(forKey: Keys.language) as? String {
                            if language1 == "ar" {
                                HTMLStringView(htmlContent: privacyPolicyObjc.privacyPolicy?[ind].text_ar ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 18))
                                //                                .fontWeight(.semibold)
                            }else{
                                HTMLStringView(htmlContent: privacyPolicyObjc.privacyPolicy?[ind].text ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 18))
                                //                                .fontWeight(.semibold)
                            }
                        }else{
                            HTMLStringView(htmlContent: privacyPolicyObjc.privacyPolicy?[ind].text ?? "")
                                .foregroundColor(Color("000000").opacity(0.7))
                                .font(Font.custom("poppins", size: 18))
                            //                            .fontWeight(.semibold)
                        }
                        
                        
                        
                    }
                }
                Spacer()
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .task {
                UserApiUtil.getPrivacyPolicy(success: { res in
                    privacyPolicyObjc = res
                    print("Privacy policy hit ")
                }, failure: { res in
                    print("Privacy policy notttt tttt hit ")
                })
            }
    }
}

struct PrivacyPolicyScreen_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyScreen()
    }
}



struct HTMLStringView: UIViewRepresentable {
    let htmlContent: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlContent, baseURL: nil)
    }
}


//struct PrivacyPolicyScreen: View {
//    @State var privacyPolicyObjc: PrivacyPolicy = PrivacyPolicy()
//    var body: some View {
//        ZStack{
//            VStack{
//                TopNavigation(titleText: "Privacy Policy")
//                ScrollView(showsIndicators:false){
//                    VStack{
//                        if privacyPolicyObjc.privacyPolicy?.count ?? 0 > 0 {
//                            ForEach(0 ..< (privacyPolicyObjc.privacyPolicy?.count ?? 0),id:\.self) { ind in
//
////                                if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
////                                    if language == "ar" {
//                                        HStack{
//                                            Text(privacyPolicyObjc.privacyPolicy?[ind].title ?? "")
//                                                .foregroundColor(Color("000000").opacity(0.7))
//                                                .font(Font.custom("poppins", size: 18))
//                                                .fontWeight(.semibold)
//
//                                            Spacer()
//                                        }.padding(.horizontal)
//                                            .padding(.vertical)
//
////                                    } else {
////                                        HStack{
////                                            Text(privacyPolicyObjc.privacyPolicy?[ind].title?.htmlToString() ?? "")
////                                                .foregroundColor(Color("000000").opacity(0.7))
////                                                .font(Font.custom("poppins", size: 18))
////                                                .fontWeight(.semibold)
////
////                                            Spacer()
////                                        }.padding(.horizontal)
////                                            .padding(.vertical)
////                                    }
////                                } else {
////                                    HStack{
////                                        Text(privacyPolicyObjc.privacyPolicy?[ind].title?.htmlToString() ?? "")
////                                            .foregroundColor(Color("000000").opacity(0.7))
////                                            .font(Font.custom("poppins", size: 18))
////                                            .fontWeight(.semibold)
////
////                                        Spacer()
////                                    }.padding(.horizontal)
////                                        .padding(.vertical)
////                                }
//
//                                VStack{
//                                    HStack{
//                                        if let language1 = UserDefaults.standard.value(forKey: Keys.language) as? String {
//                                            if language1 == "ar" {
//                                                HStack{
//                                                    Text(NSAttributedString(htmlString: privacyPolicyObjc.privacyPolicy?[ind].text ?? ""))
////                                                    Text(privacyPolicyObjc.privacyPolicy?[ind].text_ar ?? "")
//                                                        .foregroundColor(Color("000000").opacity(0.6))
//                                                        .font(Font.custom("poppins", size: 15))
//                                                        .fontWeight(.regular)
//                                                        .multilineTextAlignment(.leading)
//
//                                                    Spacer()
//                                                }
//                                            } else {
//                                                HStack{
//                                                    Text(NSAttributedString(htmlString: privacyPolicyObjc.privacyPolicy?[ind].text ?? ""))
////                                                    Text(privacyPolicyObjc.privacyPolicy?[ind].text ?? "")
//                                                        .foregroundColor(Color("000000").opacity(0.6))
//                                                        .font(Font.custom("poppins", size: 15))
//                                                        .fontWeight(.regular)
//                                                        .multilineTextAlignment(.leading)
//
//                                                    Spacer()
//                                                }
//                                            }
//                                        }else{
//                                            HStack{
//
//                                                Text(NSAttributedString(htmlString: privacyPolicyObjc.privacyPolicy?[ind].text ?? ""))
////                                                Text(privacyPolicyObjc.privacyPolicy?[ind].text ?? "")
//                                                    .foregroundColor(Color("000000").opacity(0.6))
//                                                    .font(Font.custom("poppins", size: 15))
//                                                    .fontWeight(.regular)
//                                                    .multilineTextAlignment(.leading)
//
//                                                Spacer()
//                                            }
//                                        }
//
//                                    }
//
//                                }.padding(.horizontal)
//                                    .padding(.vertical,10)
//
//                            }
//                        }
//                    }
//                    .padding(.vertical)
//                }
//            }
//        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
//            .ignoresSafeArea(.all)
//            .background(Color("F2F5F9"))
//            .task {
//                UserApiUtil.getPrivacyPolicy(success: { res in
//                    privacyPolicyObjc = res
//                    print("Privacy policy hit ")
//                }, failure: { res in
//                    print("Privacy policy notttt tttt hit ")
//                })
//            }
//    }
//}

//struct PrivacyPolicyScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        PrivacyPolicyScreen()
//    }
//}


