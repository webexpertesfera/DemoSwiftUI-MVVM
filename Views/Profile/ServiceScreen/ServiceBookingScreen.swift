//
//  ServiceBookingScreen.swift
//  SmartBookings
//
//  Created by Sheheryar on 08/06/2022.
//
import SwiftUI

struct ServiceBookingScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @State var bookings: [VenderBookedService] = []
  
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Service Bookings")
                HStack{
                    Text("See your service bookings")
                        .foregroundColor(Color("000000").opacity(0.8))
                        .font(Font.custom("poppins", size: 16))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    Spacer()
                }.padding(.horizontal,10)
                
                ScrollView(showsIndicators:false){
                    VStack {
                        if bookings.count > 0 {
                            ForEach(0 ..< bookings.count,id:\.self) { ind in
                                ServiceBookingCard(
                                    ImageName: bookings[ind].service.description?.images.count ?? 0 > 0 ?          bookings[ind].service.description?.images[0] ?? "" : "",
                                    bookingCount: String(bookings[ind].bookings ?? 0),
                                    title: bookings[ind].service.description?.nameInEnglish ?? "",
                                    city: bookings[ind].service.address?.address ?? "")
                                .onTapGesture{
                                    serviceManager.bookingserviceId = bookings[ind].service._id ?? ""
                                    serviceManager.bookedServiceObject = bookings[ind].service
                                    viewRouter.currentPage = "ServiceBookingDetail"
                                }
                            }
                        }
                    }
                }
               BottomNavigation()
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .onAppear(perform: {
                VendorApiUtil.vendorBooking(success: { res in
                    bookings = res
                }, failure: { _ in
                    
                })
            })
    }
}

struct ServiceBookingScreen_Previews: PreviewProvider {
    static var previews: some View {
        // ServiceBookingScreen()
        ServiceBookingDetail()
    }
}

struct ServiceBookingDetail: View {
    @EnvironmentObject var serviceManager: ServiceManager
    @EnvironmentObject var viewRouter: ViewRouter
    @State var showPreloader: Bool = false
    @State var bookings: [ServiceBooking] = []
    @State var backup: [ServiceBooking] = []
    @State var searchText: String = ""
    @State var selected: String = "Upcoming"
    @State var pendingBookings: [ServiceBooking] = []
    @State var pendingbackup: [ServiceBooking] = []
    @State var currentBookings: [ServiceBooking] = []
    @State var currentbackups: [ServiceBooking] = []
    @State var cancelledBookings: [ServiceBooking] = []
    @State var cancelledbackup: [ServiceBooking] = []
    @State var completedBookings: [ServiceBooking] = []
    @State var completedbackup: [ServiceBooking] = []
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
                            }.frame(width: 80, height: 50, alignment: .center)
                            
                            Group {
                                if selected == "Current" {
                                    RoundedRectangle(cornerRadius: 7)
                                        .foregroundColor(Color("FEBB12"))
                                        .overlay(
                                            Text("Current")
                                                .foregroundColor(Color("000000"))
                                                .font(Font.custom("poppins", size: 10))
                                                .fontWeight(.regular)
                                            
                                        )
                                } else {
                                    Text("Current")
                                        .foregroundColor(Color("000000").opacity(0.4))
                                        .font(Font.custom("poppins", size: 10))
                                        .fontWeight(.regular)
                                        .onTapGesture {
                                            selected = "Current"
                                        }
                                    
                                }
                            }.frame(width: 80, height: 50, alignment: .center)
                            
                            
                            
                            //Spacer()
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
                            }.frame(width: 80, height: 50, alignment: .center)
                            
                            
                            //Spacer()
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
                        if selected == "Upcoming" {
                            if pendingBookings.count > 0 {
                                ForEach(0 ..< pendingBookings.count,id:\.self) { ind in
                                    
                                    serviceBookingDetailCard(
                                        title: pendingBookings[ind].user?.firstName ?? "" + (pendingBookings[ind].user?.lastName ?? ""),
                                        city: serviceManager.bookedServiceObject?.address?.address ?? "",
                                        hotelName: serviceManager.bookedServiceObject?.description?.nameInEnglish ?? "",
                                        totalNights: String( pendingBookings[ind].nights ?? 0),
                                        callback: {
                                            let numberString = String(pendingBookings[ind].user?.phone ?? 0)
                                            let telephone = "tel://"
                                            let formattedString = telephone + numberString
                                            guard let url = URL(string: formattedString) else { return }
                                            UIApplication.shared.open(url)
                                        })
                                    .onTapGesture {
                                        serviceManager.bookingObject = pendingBookings[ind]
                                        viewRouter.currentPage = "BookingDetailsScreen"
                                    }
                                }
                            }
                        }
                        
                        if selected == "Current" {
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
                                        serviceManager.bookingObject = currentBookings[ind]
                                        viewRouter.currentPage = "BookingDetailsScreen"
                                    }
                                }
                            }
                        }
                        
                        if selected == "Completed" {
                            if completedBookings.count > 0 {
                                ForEach(0 ..< completedBookings.count,id:\.self) { ind in
                                    
                                    serviceBookingDetailCard(
                                        title: completedBookings[ind].user?.firstName ?? "" + (completedBookings[ind].user?.lastName ?? ""),
                                        city: serviceManager.bookedServiceObject?.address?.address ?? "",
                                        hotelName: serviceManager.bookedServiceObject?.description?.nameInEnglish ?? "",
                                        totalNights: String( completedBookings[ind].nights ?? 0),
                                        callback: {
                                            let numberString = String(completedBookings[ind].user?.phone ?? 0)
                                            let telephone = "tel://"
                                            let formattedString = telephone + numberString
                                            guard let url = URL(string: formattedString) else { return }
                                            UIApplication.shared.open(url)
                                        })
                                    .onTapGesture{
                                        
                                        
                                        serviceManager.bookingObject = completedBookings[ind]
                                        viewRouter.currentPage = "BookingDetailsScreen"
                                        
                                    }
                                }
                            }
                        }
                        
                        if selected == "Cancelled" {
                            if cancelledBookings.count > 0 {
                                ForEach(0 ..< cancelledBookings.count,id:\.self) { ind in
                                    
                                    serviceBookingDetailCard(
                                        title:  cancelledBookings[ind].user?.firstName ?? "" +  (cancelledBookings[ind].user?.lastName ?? ""),
                                        city: serviceManager.bookedServiceObject?.address?.address ?? "",
                                        hotelName: serviceManager.bookedServiceObject?.description?.nameInEnglish ?? "",
                                        totalNights: String( cancelledBookings[ind].nights ?? 0),
                                        callback: {
                                            let numberString = String(cancelledBookings[ind].user?.phone ?? 0)
                                            let telephone = "tel://"
                                            let formattedString = telephone + numberString
                                            guard let url = URL(string: formattedString) else { return }
                                            UIApplication.shared.open(url)
                                        })
                                    .onTapGesture{
                                        serviceManager.bookingObject = cancelledBookings[ind]
                                        viewRouter.currentPage = "BookingDetailsScreen"
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
                VendorApiUtil.vendorbookedservices( serviceManager.bookingserviceId ?? "",success: { res in
                    if res.result.count > 0 {
//                        bookings = res.result[0].booking ?? []
//                        backup = res.result[0].booking ?? []
                        for i in res.result {
                            if i.status == "pending" {
                                pendingBookings = i.booking ?? []
                                pendingbackup = i.booking ?? []
                            }
                            
                            if i.status == "current" {
                                currentBookings =  i.booking ?? []
                                currentbackups =  i.booking ?? []
                            }
                            
                            if i.status == "cancelled" {
                                cancelledBookings = i.booking ?? []
                                cancelledbackup = i.booking ?? []
                            }
                            if i.status == "completed" {
                                completedBookings = i.booking ?? []
                                completedbackup = i.booking ?? []
                            }
                           
                        }
                    }
                    
                    showPreloader = false
                   
                   
                },failure: { _ in
                    showPreloader = false
                })
            }
    }
    
    func filterContent() {
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
        
        if selected == "Cancelled" {
             
            if searchText.count > 1 {
                var matchingCoffees: [ServiceBooking] = []

                cancelledBookings.forEach { coffee in
                    let searchContent = String(coffee.user?.phone ?? 0)
                    if searchContent.lowercased().range(of: lowercasedSearchText, options: .regularExpression) != nil {
                        matchingCoffees.append(coffee)
                    }
                }
                cancelledBookings = matchingCoffees
            } else {
                cancelledBookings = cancelledbackup
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
        
        if selected == "Completed" {
             
            if searchText.count > 1 {
                var matchingCoffees: [ServiceBooking] = []

                completedBookings.forEach { coffee in
                    let searchContent = String(coffee.user?.phone ?? 0)
                    if searchContent.lowercased().range(of: lowercasedSearchText, options: .regularExpression) != nil {
                        matchingCoffees.append(coffee)
                    }
                }

                completedBookings = matchingCoffees

            } else {
                completedBookings = completedbackup
            }
        }
        
       
    }
}
