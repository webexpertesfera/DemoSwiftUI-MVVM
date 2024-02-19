//
//  BecomeVendor.swift
//  SmartBookings
//
//  Created by Sheheryar on 09/06/2022.
//

import SwiftUI

struct BecomeVendor: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Become Vendor")
                VStack{
                    HStack{
                        Text("Please select an option")
                            .foregroundColor(Color("000000").opacity(0.7))
                            .font(Font.custom("poppins", size: 18))
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }.padding(.horizontal)
                    ScrollView(showsIndicators:false){
                        HStack{
                            RoundedRectangle(cornerRadius: 22)
                                .frame(width: 170, height: 140, alignment: .center)
                                .foregroundColor(Color("White"))
                                .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
                                .overlay(
                                    VStack{
                                        Text("I represent the")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.regular)
                                        
                                        Text("Company")
                                            .foregroundColor(Color("FEBB12"))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.regular)
                                    }
                                ).onTapGesture{
                                    viewRouter.currentPage = "CompanyProfile"
                                }
                            
                            
                            RoundedRectangle(cornerRadius: 22)
                                .frame(width: 170, height: 140, alignment: .center)
                                .foregroundColor(Color("White"))
                                .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
                                .overlay(
                                    VStack{
                                        Text("I am a personal")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.regular)
                                        
                                        Text("Host")
                                            .foregroundColor(Color("FEBB12"))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.regular)
                                    }
                                ).onTapGesture{
                                    viewRouter.currentPage = "HostProfile"
                                }
                        }.padding()
                    }
                }
                .keyboardAdaptive()
                BottomNavigation();
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .onTapGesture {
                hideKeyboard()
            }
    }
}

struct BecomeVendor_Previews: PreviewProvider {
    static var previews: some View {
        BecomeVendor()
    }
}
