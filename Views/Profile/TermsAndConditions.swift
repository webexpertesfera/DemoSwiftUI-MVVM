//
//  TermsAndConditions.swift
//  SmartBookings
//
//  Created by Sheheryar on 09/06/2022.
//

import SwiftUI
import WebKit

struct TermsAndConditions: View {
    @State var termsConditionObject: TermsCondition = TermsCondition()
    var body: some View {
        ZStack{
            VStack {
                TopNavigation(titleText: "Terms condition")
                Spacer()
                if termsConditionObject.termsOfUse?.count ?? 0 > 0 {
                    if let language1 = UserDefaults.standard.value(forKey: Keys.language) as? String {
                        if language1 == "ar" {
                            ForEach(0 ..< (termsConditionObject.termsOfUse?.count ?? 0),id:\.self) { ind in
                                Text(termsConditionObject.termsOfUse?[ind].title_ar ?? "")
                                
                                HTMLStringView(htmlContent: termsConditionObject.termsOfUse?[ind].text_ar ?? "")
                            }
                        }else{
                            ForEach(0 ..< (termsConditionObject.termsOfUse?.count ?? 0),id:\.self) { ind in
                                Text(termsConditionObject.termsOfUse?[ind].title ?? "")
                                
                                HTMLStringView(htmlContent: termsConditionObject.termsOfUse?[ind].text ?? "")
                            }
                        }
                    }else{
                        ForEach(0 ..< (termsConditionObject.termsOfUse?.count ?? 0),id:\.self) { ind in
                            Text(termsConditionObject.termsOfUse?[ind].title ?? "")
                            
                            HTMLStringView(htmlContent: termsConditionObject.termsOfUse?[ind].text ?? "")
                        }
                    }
                }
                
                
            
                    
//                        if let language1 = UserDefaults.standard.value(forKey: Keys.language) as? String {
//                            if language1 == "ar" {
//
//                                    .foregroundColor(Color("000000").opacity(0.7))
//                                    .font(Font.custom("poppins", size: 18))
//                                //                                .fontWeight(.semibold)
//                            }else{
//                                HTMLStringView(htmlContent: termsConditionObject.termsOfUse?[ind].text ?? "")
//                                    .foregroundColor(Color("000000").opacity(0.7))
//                                    .font(Font.custom("poppins", size: 18))
//                                //                                .fontWeight(.semibold)
//                            }
//                        }else{
//                            HTMLStringView(htmlContent: termsConditionObject.termsOfUse?[ind].text ?? "")
//                                .foregroundColor(Color("000000").opacity(0.7))
//                                .font(Font.custom("poppins", size: 18))
//                            //                            .fontWeight(.semibold)
//                        }
//                    }
                Spacer()
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .task {
                UserApiUtil.getTermsConditions(success: { res in
                    termsConditionObject = res
                }, failure: { res in

                })
            }
    }
}

struct TermsAndConditions_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditions()
    }
}


//struct HTMLStringView: UIViewRepresentable {
//    let htmlContent: String
//
//    func makeUIView(context: Context) -> WKWebView {
//        return WKWebView()
//    }
//
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        uiView.loadHTMLString(htmlContent, baseURL: nil)
//    }
//}


//struct TermsAndConditions: View {
//    @State var termsConditionObject: TermsCondition = TermsCondition()
//    var body: some View {
//        ZStack{
//            VStack{
//                TopNavigation(titleText: "Terms of Use")
//                ScrollView(showsIndicators:false){
//                    VStack{
//                        if termsConditionObject.termsOfUse?.count ?? 0 > 0 {
//                            ForEach(0 ..< (termsConditionObject.termsOfUse?.count ?? 0),id:\.self) { ind in
//                                HStack{
//                                    Text(termsConditionObject.termsOfUse?[ind].title ?? "")
//                                        .foregroundColor(Color("000000").opacity(0.7))
//                                        .font(Font.custom("poppins", size: 18))
//                                        .fontWeight(.semibold)
//
//                                    Spacer()
//                                }.padding(.horizontal)
//                                    .padding(.vertical)
//
//                                VStack{
//                                    HStack{
//                                        Text(termsConditionObject.termsOfUse?[ind].text ?? "")
//                                            .foregroundColor(Color("000000").opacity(0.6))
//                                            .font(Font.custom("poppins", size: 15))
//                                            .fontWeight(.regular)
//                                            .multilineTextAlignment(.leading)
//
//                                        Spacer()
//                                    }
//
//
//                                }.padding(.horizontal)
//                                    .padding(.vertical,10)
//
//                            }
//                        }
//
//
//                        /*
//                        VStack{
//                            HStack{
//                                Text("Lorem ipsum dolor")
//                                    .foregroundColor(Color("000000").opacity(0.7))
//                                    .font(Font.custom("poppins", size: 18))
//                                    .fontWeight(.semibold)
//
//                                Spacer()
//                            }.padding(.horizontal)
//                            VStack{
//
//                                Text("Lorem ipsum dolor sit amet, consectetur adipis cing elit. Etiam odio est, laoreet vitae dictum ac, accumsan vitae erat. Nullam et hendrerit nulla, vel dapibus dolor. Aliquam malesuada at orci vitae dapibus. Fusce rutrum magna id lacus tristi que, sit amet efficitur ligula maximus.")
//                                    .foregroundColor(Color("000000").opacity(0.6))
//                                    .font(Font.custom("poppins", size: 15))
//                                    .fontWeight(.regular)
//                            }.padding(.horizontal)
//                                .padding(.top,10)
//                        }.padding(.top)
//
//                        VStack{
//                            HStack{
//                                Text("Lorem ipsum dolor")
//                                    .foregroundColor(Color("000000").opacity(0.7))
//                                    .font(Font.custom("poppins", size: 18))
//                                    .fontWeight(.semibold)
//
//                                Spacer()
//                            }.padding(.horizontal)
//                            VStack{
//
//                                Text("Lorem ipsum dolor sit amet, consectetur adipis cing elit. Etiam odio est, laoreet vitae dictum ac, accumsan vitae erat. Nullam et hendrerit nulla, vel dapibus dolor. Aliquam malesuada at orci vitae dapibus. Fusce rutrum magna id lacus tristi que, sit amet efficitur ligula maximus.")
//                                    .foregroundColor(Color("000000").opacity(0.6))
//                                    .font(Font.custom("poppins", size: 15))
//                                    .fontWeight(.regular)
//                            }.padding(.horizontal)
//                                .padding(.top,10)
//                        }.padding(.top)
//
//                        VStack{
//                            HStack{
//                                Text("Lorem ipsum dolor")
//                                    .foregroundColor(Color("000000").opacity(0.7))
//                                    .font(Font.custom("poppins", size: 18))
//                                    .fontWeight(.semibold)
//
//                                Spacer()
//                            }.padding(.horizontal)
//                            VStack{
//
//                                Text("Lorem ipsum dolor sit amet, consectetur adipis cing elit. Etiam odio est, laoreet vitae dictum ac, accumsan vitae erat. Nullam et hendrerit nulla, vel dapibus dolor. Aliquam malesuada at orci vitae dapibus. Fusce rutrum magna id lacus tristi que, sit amet efficitur ligula maximus.")
//                                    .foregroundColor(Color("000000").opacity(0.6))
//                                    .font(Font.custom("poppins", size: 15))
//                                    .fontWeight(.regular)
//                            }.padding(.horizontal)
//                                .padding(.top,10)
//                        }.padding(.top)
//                        */
//                    }
//                    .padding(.vertical)
//                }
//            }
//        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
//            .ignoresSafeArea(.all)
//            .background(Color("F2F5F9"))
//            .task {
//                UserApiUtil.getTermsConditions(success: { res in
//                    termsConditionObject = res
//                }, failure: { res in
//
//                })
//            }
//    }
//}
//
//struct TermsAndConditions_Previews: PreviewProvider {
//    static var previews: some View {
//        TermsAndConditions()
//    }
//}
