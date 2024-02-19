//
//  BookingDetailsScreen.swift
//  SmartBookings
//
//  Created by Sheheryar on 08/06/2022.
//

import SwiftUI

struct BookingDetailsScreen: View {
    @EnvironmentObject var serviceManager: ServiceManager
    @EnvironmentObject var viewRouter: ViewRouter
    @State var togglepopup: Bool = false
    @State var checkInText: String = "Check In"
    @State var checkInDetail: String = "Are you sure you want to Check In the User?"
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText:"Booking Details")
                HStack{
                    Text("See booking details")
                        .foregroundColor(Color("000000").opacity(0.8))
                        .font(Font.custom("poppins", size: 16))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                ScrollView(showsIndicators:false){
                    VStack{
                       
                        HStack{
                            Image("VendorProfileImage")
                                .resizable()
                                .scaledToFit()
                        }.frame(width: 87, height: 91, alignment: .center)
                   
                        Group{
                            HStack{
                                Text("Customer Name")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
//                                Text(serviceManager.bookingObject?.user?.firstName ?? "")
                                Text("\(serviceManager.bookingObject?.user?.firstName ?? "")" + " " + "\(serviceManager.bookingObject?.user?.lastName ?? "")")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Booking ID")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.bookingObject?._id ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Customer ID")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
//                                Text(serviceManager.bookingObject?.user?._id ?? "")
                                Text(String(serviceManager.bookingObject?.user?.userId ?? 0))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Vendor ID")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.bookingObject?.service?.vender ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Booking Date")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.bookingObject?.checkIn ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Booking Time")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.bookingObject?.bookingTime ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            
                        }.padding(.horizontal)
                            .padding(.top,5)
//
                        Group {
                            
                            HStack{
                                Text("Email")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.bookingObject?.user?.email ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Mobile Number")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(String(serviceManager.bookingObject?.user?.phone ?? 0))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Service Name")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.bookedService?.description?.nameInEnglish ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Location")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.bookedService?.address?.address ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Nights")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(String(serviceManager.bookingObject?.nights ?? 0))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Check-in Date")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.bookingObject?.checkIn ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                        }
                        .padding(.horizontal)
                            .padding(.top,5)
                       
                        Group{
                            HStack{
                                Text("Check-out Date")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.bookingObject?.checkOut ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Check-in Time")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text("11:00 AM")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Check-out Time")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text("12:00 PM")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Total Price")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(String(serviceManager.bookingObject?.amount ?? 0))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            if serviceManager.bookingObject?.status == "pending" {
                                RoundedRectangle(cornerRadius: 10)
                                     .foregroundColor(Color("FEBB12"))
                                     .frame(width: 150, height: 50, alignment: .center)
                                     .overlay(
                                                 Text("Check in")
                                                     .font(Font.custom("poppins", size: 15))
                                                     .foregroundColor(Color("04304B"))
                                                     .fontWeight(.semibold)
                                     ).onTapGesture {
                                         togglepopup.toggle()
                                     }
                            }
                            
                            if serviceManager.bookingObject?.status == "current" {
                                RoundedRectangle(cornerRadius: 10)
                                     .foregroundColor(Color("FEBB12"))
                                     .frame(width: 150, height: 50, alignment: .center)
                                     .overlay(
                                                 Text("Check Out")
                                                     .font(Font.custom("poppins", size: 15))
                                                     .foregroundColor(Color("04304B"))
                                                     .fontWeight(.semibold)
                                     ).onTapGesture {
                                         checkInText = "Check Out?"
                                         checkInDetail = "Are you sure you want to Check Out the User?"
                                         togglepopup.toggle()
                                     }
                            }
                          
                        }
                        .padding(.horizontal)
                            .padding(.top,5)
                    }
                }
                BottomNavigation()
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
                                
                                Text(checkInText)
                                    .foregroundColor(Color("000000"))
                                    .font(Font.custom("poppins", size: 20))
                                    .fontWeight(.bold)
                                
                                Text(checkInDetail)
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
                                                    Text("No")
                                                        .foregroundColor(Color("000000").opacity(0.4))
                                                        .font(Font.custom("poppins", size: 18))
                                                        .fontWeight(.regular)
                                            )
                                        
                                    }.frame(width: 60, height: 30, alignment: .center)
                                        .onTapGesture{
                                            togglepopup.toggle()
                                        }
                                    
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 70)
                                            .foregroundColor(Color("FEBB12"))
                                        
                                        RoundedRectangle(cornerRadius: 70)
                                            .stroke(Color("707070"),lineWidth: 1)
                                            .overlay(
                                                    Text("Yes")
                                                        .foregroundColor(Color("000000").opacity(0.4))
                                                        .font(Font.custom("poppins", size: 18))
                                                        .fontWeight(.regular)
                                            )
                                        
                                    }.frame(width: 60, height: 30, alignment: .center)
                                        .onTapGesture{
                                            if serviceManager.bookingObject?.status == "pending" {
                                                VendorApiUtil.checkInVendor(serviceManager.bookingObject?._id ?? "", success: { _ in
                                                    viewRouter.goBack()
                                                    
                                                }, failure: { _ in
                                                    viewRouter.goBack()
                                                    togglepopup.toggle()
                                                })
                                            } else {
                                                VendorApiUtil.checkOutVendor(serviceManager.bookingObject?._id ?? "", success: { _ in
                                                    viewRouter.goBack()
                                                    
                                                }, failure: { _ in
                                                    viewRouter.goBack()
                                                    togglepopup.toggle()
                                                })
                                            }
                                           
                                        }
                                    
                                   
                                }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .padding(.vertical)
                                    
                                
                            }
                        )

                }
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
    }
}



struct RequestedBookingDetailsScreen: View {
    @EnvironmentObject var serviceManager: ServiceManager
    @EnvironmentObject var viewRouter: ViewRouter
    @State var togglepopup: Bool = false
    @State var checkInText: String = "INFO"
    @State var checkInDetail: String = "Are you sure you want to Check In the User?"
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText:"Booking Details")
                HStack{
                    Text("See booking details")
                        .foregroundColor(Color("000000").opacity(0.8))
                        .font(Font.custom("poppins", size: 16))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                ScrollView(showsIndicators:false){
                    VStack{
                       
                        HStack{
                            Image("VendorProfileImage")
                                .resizable()
                                .scaledToFit()
                        }.frame(width: 87, height: 91, alignment: .center)
                   
                        Group{
                          
                            HStack{
                                Text("Customer Name")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
//                                Text(serviceManager.selectedBooking?.user?.firstName ?? "")
                                Text("\(serviceManager.selectedBooking?.user?.firstName ?? "")" + " " + "\(serviceManager.selectedBooking?.user?.lastName ?? "")")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Booking ID")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.selectedBooking?._id ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                           
                            HStack{
                                Text("Customer ID")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
//                                Text(serviceManager.selectedBooking?.user?._id ?? "")
                                Text(String(serviceManager.selectedBooking?.user?.userId ?? 0))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                           
                            HStack{
                                Text("Vendor ID")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.selectedBooking?.service?.name?.vender ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                           
                            HStack{
                                Text("Booking Date")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.selectedBooking?.checkIn ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                         
                            HStack{
                                Text("Booking Time")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.selectedBooking?.bookingTime ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                            }
                        
                        }.padding(.horizontal)
                            .padding(.top,5)
//
                      
                       
                        Group {
                            
                            HStack{
                                Text("Email")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.selectedBooking?.user?.email ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Mobile Number")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(String(serviceManager.selectedBooking?.user?.phone ?? 0))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack {
                                Text("Service Name")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.selectedBooking?.service?.name?.description?.nameInEnglish ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Location")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.selectedBooking?.service?.name?.address?.address ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Nights")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(String(serviceManager.selectedBooking?.nights ?? 0))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Check-in Date")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(AppUtil.getDateOnly(format: "", dateValue: serviceManager.selectedBooking?.checkIn ?? ""))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                        }
                        .padding(.horizontal)
                            .padding(.top,5)
                       
                        
                        Group{
                            HStack{
                                Text("Check-out Date")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(AppUtil.getDateOnly(format: "", dateValue: serviceManager.selectedBooking?.checkOut ?? ""))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                               }
                            
                            HStack{
                                Text("Check-in Time")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.selectedBooking?.service?.name?.check?.checkInTime ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                            }
                            
                            HStack{
                                Text("Check-out Time")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(serviceManager.selectedBooking?.service?.name?.check?.checkOutTime ?? "")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                }
                             
                            HStack{
                                Text("Total Price")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                
                                Spacer()
                                
                                Text(String(serviceManager.selectedBooking?.amount ?? 0))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                }
                          
                            if serviceManager.selectedBooking?.status == "waiting" {
                                
                                HStack{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10)
                                             .foregroundColor(Color("F2F5F9"))
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("393F45"),lineWidth: 1)
                                            .overlay(
                                                         Text("Reject")
                                                             .font(Font.custom("poppins", size: 15))
                                                             .foregroundColor(Color("04304B"))
                                                             .fontWeight(.semibold)
                                             ).onTapGesture {
                                                 checkInText = "Reject"
                                                 checkInDetail = "Are you sure you want to Reject the Booking?"
                                                 togglepopup.toggle()
                                             }
                                    } .frame(width: 150, height: 50, alignment: .center)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                         .foregroundColor(Color("FEBB12"))
                                         .frame(width: 150, height: 50, alignment: .center)
                                         .overlay(
                                                     Text("Approve")
                                                         .font(Font.custom("poppins", size: 15))
                                                         .foregroundColor(Color("04304B"))
                                                         .fontWeight(.semibold)
                                         ).onTapGesture {
                                             checkInText = "Approve"
                                             checkInDetail = "Are you sure you want to Accept the Booking?"
                                             togglepopup.toggle()
                                         }
                                    }
                                }
                            
                            if serviceManager.selectedBooking?.status == "current" {
                                RoundedRectangle(cornerRadius: 10)
                                     .foregroundColor(Color("FEBB12"))
                                     .frame(width: 150, height: 50, alignment: .center)
                                     .overlay(
                                                 Text("Check Out")
                                                     .font(Font.custom("poppins", size: 15))
                                                     .foregroundColor(Color("04304B"))
                                                     .fontWeight(.semibold)
                                     ).onTapGesture {
                                         checkInText = "Check Out?"
                                         checkInDetail = "Are you sure you want to Check Out the User?"
                                         togglepopup.toggle()
                                     }
                            }
                        }
                        .padding(.horizontal)
                            .padding(.top,5)
                      
                       
                    }
                }
                BottomNavigation()
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
                                
                                Text(checkInText)
                                    .foregroundColor(Color("000000"))
                                    .font(Font.custom("poppins", size: 20))
                                    .fontWeight(.bold)
                                
                                Text(checkInDetail)
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
                                                    Text("No")
                                                        .foregroundColor(Color("000000").opacity(0.4))
                                                        .font(Font.custom("poppins", size: 18))
                                                        .fontWeight(.regular)
                                            )
                                        
                                    }.frame(width: 60, height: 30, alignment: .center)
                                        .onTapGesture{
                                            togglepopup.toggle()
                                        }
                                    
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 70)
                                            .foregroundColor(Color("FEBB12"))
                                        
                                        RoundedRectangle(cornerRadius: 70)
                                            .stroke(Color("707070"),lineWidth: 1)
                                            .overlay(
                                                    Text("Yes")
                                                        .foregroundColor(Color("000000").opacity(0.4))
                                                        .font(Font.custom("poppins", size: 18))
                                                        .fontWeight(.regular)
                                            )
                                        
                                    }.frame(width: 60, height: 30, alignment: .center)
                                        .onTapGesture{
                                           approveReject(value: checkInText)
                                        }
                                   }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .padding(.vertical)
                                    
                                
                            }
                        )

                }
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
    }
    
    func approveReject(value: String) {
    
        VendorApiUtil.approveRejectBooking(bookingId: serviceManager.selectedBooking?._id ?? "", status: value, success: { _ in
            togglepopup.toggle()
            viewRouter.goBack()
        }, failure: { _ in
            togglepopup.toggle()
            viewRouter.goBack()
        })
    }
}

struct BookingDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        BookingDetailsScreen()
    }
}
