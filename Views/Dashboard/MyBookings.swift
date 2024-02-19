//
//  MyBookings.swift
//  manasik
//
//  Created by Sheheryar on 28/05/2022.
//

import SwiftUI

struct MyBookings: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @State var selected: String = "Upcoming"
    @State var requestedBooking: [Booking] = []
    @State var approvedbooking: [Booking] = []
    @State var upComingbookings: [Booking] = []
    @State var Completedbookings: [Booking] = []
    @State var cancelledBooking: [Booking] = []
    @State var showPreloader: Bool = false
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Bookings")
                VStack{
                    if AppUtil.userProfile?.role != "Guest" {
                        RoundedRectangle(cornerRadius: 7)
                            .foregroundColor(Color("White"))
                            .frame(width: UIScreen.main.bounds.width - 50, height: 60, alignment: .center)
                            .shadow(radius: 1)
                            .overlay(
                                HStack{
                                    
                                    Group{
                                        if selected == "Waiting" {
                                            RoundedRectangle(cornerRadius: 7)
                                                .foregroundColor(Color("FEBB12"))
                                                .overlay(
                                                    Text("Waiting")
                                                        .foregroundColor(Color("000000"))
                                                        .font(Font.custom("poppins", size: 10))
                                                        .fontWeight(.regular)
                                                    
                                                )
                                        } else {
                                            Text("Waiting")
                                                .foregroundColor(Color("000000").opacity(0.4))
                                                .font(Font.custom("poppins", size: 10))
                                                .fontWeight(.regular)
                                                .onTapGesture {
                                                    selected = "Waiting"
                                                }
                                        }
                                    }.frame(width: 60, height: 45, alignment: .center)
                                    Spacer()
                                    
                                    Group{
                                        if selected == "Approved" {
                                            RoundedRectangle(cornerRadius: 7)
                                                .foregroundColor(Color("FEBB12"))
                                                .overlay(
                                                    Text("Approved")
                                                        .foregroundColor(Color("000000"))
                                                        .font(Font.custom("poppins", size: 10))
                                                        .fontWeight(.regular)
                                                    
                                                )
                                        } else {
                                            Text("Approved")
                                                .foregroundColor(Color("000000").opacity(0.4))
                                                .font(Font.custom("poppins", size: 10))
                                                .fontWeight(.regular)
                                                .onTapGesture {
                                                    selected = "Approved"
                                                }
                                        }
                                    }.frame(width: 60, height: 45, alignment: .center)
                                    
                                    
                                    
                                    Spacer()
                                    
                                    Group {
                                        if selected == "Upcoming" {
                                            RoundedRectangle(cornerRadius: 7)
                                                .foregroundColor(Color("FEBB12"))
                                                .overlay(
                                                    Text("Upcoming")
                                                        .foregroundColor(Color("000000"))
                                                        .font(Font.custom("poppins", size: 10))
                                                        .fontWeight(.regular)
                                                    
                                                )
                                        } else {
                                            Text("Upcoming")
                                                .foregroundColor(Color("000000").opacity(0.4))
                                                .font(Font.custom("poppins", size: 10))
                                                .fontWeight(.regular)
                                                .onTapGesture {
                                                    selected = "Upcoming"
                                                }
                                        }
                                    }.frame(width: 60, height: 45, alignment: .center)

                                    Spacer()
                                    Group {
                                        if selected == "Completed" {
                                            RoundedRectangle(cornerRadius: 7)
                                                .foregroundColor(Color("FEBB12"))
                                            
                                                .overlay(
                                                    Text("Completed")
                                                        .foregroundColor(Color("000000"))
                                                        .font(Font.custom("poppins", size: 10))
                                                        .fontWeight(.regular)
                                                    
                                                    
                                                )
                                        } else {
                                            Text("Completed")
                                                .foregroundColor(Color("000000").opacity(0.4))
                                                .font(Font.custom("poppins", size: 10))
                                                .fontWeight(.regular)
                                                .onTapGesture {
                                                    selected = "Completed"
                                                }
                                        }
                                    }.frame(width: 60, height: 45, alignment: .center)
                                    
                                    
                                    Spacer()
                                    Group {
                                        if selected == "Cancelled" {
                                            RoundedRectangle(cornerRadius: 7)
                                                .foregroundColor(Color("FEBB12"))
                                                .overlay(
                                                    Text("Cancelled")
                                                        .foregroundColor(Color("000000"))
                                                        .font(Font.custom("poppins", size: 10))
                                                       
                                                        .fontWeight(.regular)
                                                    
                                                )
                                        } else {
                                            Text("Cancelled")
                                                .foregroundColor(Color("000000").opacity(0.4))
                                                .font(Font.custom("poppins", size: 10))
                                                .fontWeight(.regular)
                                                .onTapGesture {
                                                    selected = "Cancelled"
                                                }
                                            
                                        }
                                    }.frame(width: 60, height: 45, alignment: .center)
                                }.padding(.horizontal)
                            ).padding(.vertical,10)
                        
                        ScrollView{
                            
                            if selected == "Waiting" {
                                
                                if requestedBooking.isEmpty {
                                    Spacer()
                                    Text("No Data found...")
                                        .font(.title3)
                                        .padding(.horizontal)
                                        .padding(.vertical)
                                    Spacer()
                                } else {
                                    ForEach(0 ..< requestedBooking.count,id:\.self) { item in
//                                        requestedBooking[item].service?.name?.description?.images.count ?? 0 > 0 ? : ""
                                        BookingCard(
                                            
                                            ImageName: requestedBooking[item].service?.name?.description?.images[0] ?? "",
                                            addressBooking: requestedBooking[item].service?.name?.address?.address ?? "",
                                            bookingId: "\(requestedBooking[item].bookingId ?? 0)",
                                            checkInDate: AppUtil.getDateOnly(format: "", dateValue: requestedBooking[item].checkIn ?? ""),
                                            Checkout: AppUtil.getDateOnly(format: "", dateValue: requestedBooking[item].checkOut ?? ""),
                                            hotelName: requestedBooking[item].service?.name?.description?.nameInEnglish ?? "")
                                        
                                        .padding(5)
                                        .onTapGesture {
                                            serviceManager.bookedService =  requestedBooking[item].service?.name
                                            serviceManager.selectedBooking = requestedBooking[item]
                                            viewRouter.currentPage = "BookingInfoScreen"
                                        }
                                    }
                                }
                            }
                            
                            if selected == "Approved" {
                                if approvedbooking.isEmpty {
                                    Spacer()
                                    Text("No Data found...")
                                        .font(.title3)
                                        .padding(.horizontal)
                                        .padding(.vertical)
                                    Spacer()
                                }else{
                                    ForEach(0 ..< approvedbooking.count,id:\.self) { item in
//                                        approvedbooking[item].service?.name?.description?.images.count ?? 0 > 0 ?: ""
                                        
                                        BookingCard(ImageName: approvedbooking[item].service?.name?.description?.images[0] ?? "",
                                                    addressBooking: approvedbooking[item].service?.name?.address?.address ?? "",
                                            bookingId: "\(approvedbooking[item].bookingId ?? 0)",
                                            //  nights: String(requestedBooking[item].nights ?? 0),
                                            checkInDate: AppUtil.getDateOnly(format: "", dateValue: approvedbooking[item].checkIn ?? ""),
                                            Checkout: AppUtil.getDateOnly(format: "", dateValue: approvedbooking[item].checkOut ?? ""),
                                            hotelName: approvedbooking[item].service?.name?.description?.nameInEnglish ?? "")
                                        .padding(5)
                                        .onTapGesture {
                                            serviceManager.bookedService =  approvedbooking[item].service?.name
                                            serviceManager.selectedBooking = approvedbooking[item]
                                            viewRouter.currentPage = "BookingInfoScreen"
                                        }
                                    }
                                }
                            }
                            
                            if selected == "Upcoming" {
                                if upComingbookings.isEmpty {
                                    Spacer()
                                    Text("No Data found...")
                                        .font(.title3)
                                        .padding(.horizontal)
                                        .padding(.vertical)
                                    Spacer()
                                }else{
                                    ForEach(0 ..< upComingbookings.count,id:\.self) { item in
//                                        upComingbookings[item].service?.name?.description?.images.count ?? 0 > 0 ?
//                                        upComingbookings[item].service?.name?.description?.images[0] ?? "",
                                        
                                        BookingCard(ImageName: upComingbookings[item].service?.name?.description?.images.count ?? 0 > 0 ? upComingbookings[item].service?.name?.description?.images[0] ?? "" : "",
                                                    addressBooking: upComingbookings[item].service?.name?.address?.address ?? "",
                                                    bookingId:"\(upComingbookings[item].bookingId ?? 0)",
                                                    nights: String(upComingbookings[item].nights ?? 0),
                                                    checkInDate: AppUtil.getDateOnly(format: "", dateValue: upComingbookings[item].checkIn ?? ""),
                                                    Checkout: AppUtil.getDateOnly(format: "", dateValue: upComingbookings[item].checkOut ?? ""),
                                                    hotelName: upComingbookings[item].service?.name?.description?.nameInEnglish ?? "")
                                        .padding(5)
                                        .onTapGesture {
                                            serviceManager.bookedService =  upComingbookings[item].service?.name
                                            serviceManager.selectedBooking = upComingbookings[item]
                                            viewRouter.currentPage = "BookingInfoScreen"
                                        }
                                    }
                                }
                            }
                            
                            
                            if selected == "Completed"{
                                if Completedbookings.isEmpty {
                                    Spacer()
                                    Text("No Data found...")
                                        .font(.title3)
                                        .padding(.horizontal)
                                        .padding(.vertical)
                                    Spacer()
                                } else {
                                    ForEach(0 ..< Completedbookings.count,id:\.self) { item in
                                        BookingCard(ImageName: Completedbookings[item].service?.name?.description?.images.count ?? 0 > 0 ? Completedbookings[item].service?.name?.description?.images[0] ?? "" : "",
                                                    addressBooking: Completedbookings[item].service?.name?.address?.address ?? "",
                                                    bookingId: "\(Completedbookings[item].bookingId ?? 0)",
                                                    nights: String(Completedbookings[item].nights ?? 0),
                                                    checkInDate: AppUtil.getDateOnly(format: "", dateValue: Completedbookings[item].checkIn ?? ""),
                                                    Checkout: AppUtil.getDateOnly(format: "", dateValue: Completedbookings[item].checkOut ?? ""),
                                                    hotelName: Completedbookings[item].service?.name?.description?.nameInEnglish ?? "")
                                        .padding(5)
                                        .onTapGesture {
                                            serviceManager.bookedService =  Completedbookings[item].service?.name
                                            serviceManager.selectedBooking = Completedbookings[item]
                                            viewRouter.currentPage = "BookingInfoScreen"
                                        }
                                    }
                                }
                            }
                            
                            if selected == "Cancelled" {
                                if cancelledBooking.isEmpty {
                                    Text("No Data found...")
                                        .font(.title3)
                                        .padding(.horizontal)
                                        .padding(.vertical)
                                }else{
                                    ForEach(0 ..< cancelledBooking.count,id:\.self) { item in
                                        BookingCard(bookingId: "\(cancelledBooking[item].bookingId ?? 0)",
                                                    nights: String(cancelledBooking[item].nights ?? 0),
                                                    checkInDate: AppUtil.getDateOnly(format: "", dateValue: cancelledBooking[item].checkIn ?? ""),
                                                    Checkout: AppUtil.getDateOnly(format: "", dateValue: cancelledBooking[item].checkOut ?? ""),
                                                    hotelName: cancelledBooking[item].service?.name?.description?.nameInEnglish ?? "")
                                        
                                        .padding(5)
                                        .onTapGesture {
                                            print("Booking card response ", BookingCard())
                                            serviceManager.bookedService =  cancelledBooking[item].service?.name
                                            serviceManager.selectedBooking = cancelledBooking[item]
                                            viewRouter.currentPage = "BookingInfoScreen"
                                        }
                                    }
                                }
                            }
                        }
                        
                    } else {
                        Spacer()
                        LoginButton(title: "Login", callback: {
                            viewRouter.currentPage = "LoginScreen"
                        })
                        Spacer()
                    }
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
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .onAppear(perform: {
                showPreloader = true
                UserApiUtil.getBookings(success: { res in
                    print("Booking response ", res)
                    upComingbookings = res.upcoming
                    Completedbookings = res.completed
                    cancelledBooking = res.cancelled
                    showPreloader = false
                }, failure: { _ in
                    showPreloader = false
                })
                
                UserApiUtil.getRequestedBooking(success: { res in
                    
                    for i in res {
                        if i.status == "waiting" {
                            requestedBooking = i.bookngRequest ?? []
                        }
                        
                        if i.status == "approved" {
                            approvedbooking = i.bookngRequest ?? []
                        }
                    }
                    
                }, failure: { _ in
                    
                })
            })
    }
}

struct MyBookings_Previews: PreviewProvider {
    static var previews: some View {
        MyBookings()
    }
}
