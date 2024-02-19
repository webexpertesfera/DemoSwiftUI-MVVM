//
//  RequestDetailScreen.swift
//  SmartBookings
//
//  Created by apple on 28/11/2022.
//

import SwiftUI

struct RequestDetailScreen: View {
    @EnvironmentObject var serviceManager: ServiceManager
    @EnvironmentObject var viewRouter: ViewRouter
    @State var showPreloader: Bool = false
    @State var bookings: [ServiceBooking] = []
    @State var backup: [ServiceBooking] = []
    @State var searchText: String = ""
    @State var selected: String = "Waiting"
    @State var pendingBookings: [Booking] = []
    @State var pendingbackup: [Booking] = []
    @State var currentBookings: [Booking] = []
    @State var currentbackups: [Booking] = []
   
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Service Bookings")

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
                            }.frame(width: 80, height: 50, alignment: .center)
                            
                            Group {
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
                            }.frame(width: 80, height: 50, alignment: .center)
                            
                        }.padding(.horizontal)
                    ).padding(.vertical,10)
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: UIScreen.main.bounds.width - 50, height: 60, alignment: .center)
                    .foregroundColor(Color("White"))
                    .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 2)
                    .overlay(
                        VStack{
                            HStack{
                                TextField("Search", text: $searchText)
                                    .font(Font.custom("poppins", size: 15))
                                    .foregroundColor(Color("000000"))
                                    .onChange(of: searchText) { text in
                                        filterContent()
                                    }
                                
                                
                                
                                
                            }.padding(.horizontal,30)
                        }
                    )
                
                HStack{
                    Text(serviceManager.bookedServiceObject?.description?.nameInEnglish ?? "")
                        .foregroundColor(Color("000000").opacity(0.8))
                        .font(Font.custom("poppins", size: 16))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                
                
                ScrollView(showsIndicators:false){
                    VStack{
                        if selected == "Waiting" {
                            if pendingBookings.count > 0 {
                                ForEach(0 ..< pendingBookings.count,id:\.self) { ind in
                                    
                                    serviceBookingDetailCard(
                                        title:  pendingBookings[ind].user?.firstName ?? "" +  (pendingBookings[ind].user?.lastName ?? ""),
                                        city: pendingBookings[ind].service?.name?.address?.address ?? "",
                                        hotelName: pendingBookings[ind].service?.name?.description?.nameInEnglish ?? "",
                                        totalNights: String( pendingBookings[ind].nights ?? 0),
                                        callback: {
                                            let numberString = String(pendingBookings[ind].user?.phone ?? 0)
                                            let telephone = "tel://"
                                            let formattedString = telephone + numberString
                                            guard let url = URL(string: formattedString) else { return }
                                            UIApplication.shared.open(url)
                                        })
                                    .onTapGesture{
                                        serviceManager.selectedBooking = pendingBookings[ind]
                                        viewRouter.currentPage = "RequestedBookingDetailsScreen"
                                    }
                                }
                            }
                        }
                        
                        if selected == "Approved" {
                            if currentBookings.count > 0 {
                                ForEach(0 ..< currentBookings.count,id:\.self) { ind in
                                    
                                    serviceBookingDetailCard(
                                        title:  currentBookings[ind].user?.firstName ?? "" +  (currentBookings[ind].user?.lastName ?? ""),
                                        city: serviceManager.bookedServiceObject?.address?.address ?? "",
                                        hotelName: serviceManager.bookedServiceObject?.description?.nameInEnglish ?? "",
                                        totalNights: String( currentBookings[ind].nights ?? 0),
                                        callback: {
                                            let numberString = String(currentBookings[ind].user?.phone ?? 0)
                                            let telephone = "tel://"
                                            let formattedString = telephone + numberString
                                            guard let url = URL(string: formattedString) else { return }
                                            UIApplication.shared.open(url)
                                        })
                                    .onTapGesture{
//                                        serviceManager.bookingObject = currentBookings[ind] ?? ""
//                                        viewRouter.currentPage = "BookingDetailsScreen"
                                    }
                                }
                            }
                        }
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
            .task {
                showPreloader = true
                VendorApiUtil.getBookingRequest(serviceId: serviceManager.bookingserviceId ?? "", success: {
                    res in
                    for i in res {
                        if i.status == "approved" {
                            currentBookings = i.booking ?? []
                        }
                        if i.status == "waiting" {
                            pendingBookings = i.booking ?? []
                        }
                        
                    }
                    showPreloader = false
                }, failure: { _ in
                    showPreloader = false
                })
            }
    }
    
    func filterContent() {
        
        /*
        
        let lowercasedSearchText = searchText.lowercased()
  
        if selected == "Upcoming" {
             
            if searchText.count > 1 {
                var matchingCoffees: [ServiceBooking] = []

                pendingBookings.forEach { coffee in
                    let searchContent = String(coffee.user?.phone ?? 0)
                    if searchContent.lowercased().range(of: lowercasedSearchText, options: .regularExpression) != nil {
                        matchingCoffees.append(coffee)
                    }
                }

                pendingBookings = matchingCoffees

            } else {
                pendingBookings = pendingbackup
            }
        }
        
        if selected == "Current" {
             
            if searchText.count > 1 {
                var matchingCoffees: [ServiceBooking] = []

                currentBookings.forEach { coffee in
                    let searchContent = String(coffee.user?.phone ?? 0)
                    if searchContent.lowercased().range(of: lowercasedSearchText, options: .regularExpression) != nil {
                        matchingCoffees.append(coffee)
                    }
                }

                currentBookings = matchingCoffees

            } else {
                currentBookings = currentbackups
            }
        }
         */
     }
}

struct RequestDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        RequestDetailScreen()
    }
}
