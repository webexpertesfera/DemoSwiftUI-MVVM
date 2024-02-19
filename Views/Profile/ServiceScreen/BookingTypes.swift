//
//  BookingTypes.swift
//  SmartBookings
//
//  Created by Sheheryar on 08/06/2022.
//

import SwiftUI

struct BookingTypes: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText:"Booking Type")
                HStack{
                    Text("Booking Type")
                        .foregroundColor(Color("000000").opacity(0.8))
                        .font(Font.custom("poppins", size: 16))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                HStack{
                    Text("Please select the booking type")
                        .foregroundColor(Color("000000").opacity(0.6))
                        .font(Font.custom("poppins", size: 12))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                    .padding(.top,5)
                
                VStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 132, alignment: .center)
                        .foregroundColor(Color("White"))
                        .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
                        .overlay(
                           
                                HStack{
                                    Circle()
                                        .frame(width: 78, height: 78, alignment: .center)
                                        .foregroundColor(Color("White"))
                                        .shadow(radius: 1)
                                        .overlay(
                                            Image("instantBook")
                                                .resizable()
                                                .frame(width: 31, height: 48, alignment: .center)
                                        )
                                    
                                    VStack{
                                        HStack{
                                            Text("Instant Booking")
                                                .foregroundColor(Color("000000").opacity(0.8))
                                                .font(Font.custom("poppins", size: 15))
                                                .fontWeight(.medium)
                                            Spacer()
                                        }
                                        HStack {
                                            Text("")
                                                .foregroundColor(Color("000000").opacity(0.4))
                                                .font(Font.custom("poppins", size: 9))
                                            .fontWeight(.regular)
                                            
                                            Spacer()
                                        }
                                    }
                                    
                                    Circle()
                                        .frame(width: 25, height: 25, alignment: .center)
                                        .foregroundColor(Color( serviceManager.selectedBookingType == serviceBookingType.instant.rawValue ? "FEBB12" : "White"))
                                        .shadow(radius: 1)
                                    
                                }.padding(.horizontal)
                            
                        )
                        .onTapGesture {
                            serviceManager.selectedBookingType = serviceBookingType.instant.rawValue
                        }
                    
                    
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 132, alignment: .center)
                        .foregroundColor(Color("White"))
                        .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
                        .overlay(
                           
                                HStack{
                                    Circle()
                                        .frame(width: 78, height: 78, alignment: .center)
                                        .foregroundColor(Color("White"))
                                        .shadow(radius: 1)
                                        .overlay(
                                            Image("24hourReq")
                                                .resizable()
                                                .frame(width: 34, height: 34, alignment: .center)
                                        )
                                    
                                    VStack{
                                        HStack{
                                            Text("24-Hour Request")
                                                .foregroundColor(Color("000000").opacity(0.8))
                                                .font(Font.custom("poppins", size: 15))
                                                .fontWeight(.medium)
                                            
                                           
                                            
                                            Spacer()
                                        }
                                        HStack {
                                            Text("")
                                                .foregroundColor(Color("000000").opacity(0.4))
                                                .font(Font.custom("poppins", size: 9))
                                            .fontWeight(.regular)
                                            
                                            Spacer()
                                        }
                                    }
                                    
                                    Circle()
                                        .frame(width: 25, height: 25, alignment: .center)
                                        .foregroundColor(Color(serviceManager.selectedBookingType == "24-Hour" ? "FEBB12" : "White"))
                                        .shadow(radius: 1)
                                }.padding(.horizontal)
                            
                        )
                        .onTapGesture {
                            serviceManager.selectedBookingType = "24-Hour"
                        }
                    Spacer()
                    LoginButton(title: "Done", callback: {
                        viewRouter.goBack()
                    }).padding(.bottom,30)
                }
                
                
                //BottomNavigation()
                
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
    }
}

struct BookingTypes_Previews: PreviewProvider {
    static var previews: some View {
        BookingTypes()
    }
}
