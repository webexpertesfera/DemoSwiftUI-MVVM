//
//  MyServiceScreen.swift
//  SmartBookings
//
//  Created by Sheheryar on 08/06/2022.
//

import SwiftUI

struct MyServiceScreen: View {
    @State var togglepopup: Bool = false
    @State var myServices:[ServiceObject] = []
    @State var showPreloader: Bool = false
    @State var selectedId: String = ""
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "My Services")
                HStack {
                    Text("Your added services")
                        .foregroundColor(Color("000000").opacity(0.8))
                        .font(Font.custom("poppins", size: 20))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    Spacer()
                }.padding(.horizontal,15)
                
                HStack {
                    Text("You can View, Edit and delete your services")
                        .foregroundColor(Color("000000").opacity(0.6))
                        .font(Font.custom("poppins", size: 12))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                    Spacer()
                }.padding(.horizontal,15)
                    .padding(.top,2)
                ScrollView(showsIndicators: false) {
                    VStack {
                    ForEach(0 ..< myServices.count,id:\.self) { item in
                        if myServices[item].category?.type == "Stadium"{
                            MyServiceCardHours(ImageName: myServices[item].description?.images.count ?? 0 > 0 ? myServices[item].description?.images[0] ?? "" : "",
    //                                      myServices[item].description?.images[0] ?? "",
                                          title: myServices[item].description?.nameInEnglish ?? "",
//                                          location: "\(myServices[item].address?.address ?? "")" + " " + "\(myServices[item].address?.area ?? "")",
                                          location: "\(myServices[item].address?.address ?? "")",
                                          Rooms: "\(myServices[item].roomsGuest?.dressingRooms ?? 0)",
                                          bathroom: "\(myServices[item].roomsGuest?.bathrooms ?? 0)",
                                          dayPrice: "\(myServices[item].price?.hourPrice ?? 0)",
                                          status: myServices[item].status ?? "",
                                               typebooking: myServices[item].bookingSetting?.bookingType ?? "",
                                          callback: {
                                            selectedId = myServices[item]._id ?? ""
                                            togglepopup.toggle()
                                       })
                                    .onTapGesture {
                                        serviceManager.selectedService = myServices[item]
                                        viewRouter.currentPage = "ServiceReview"
                                        
//                                        viewRouter.currentPage = "PriceDetailScreen"
                                    }
                        } else {
                            MyServiceCard(ImageName: myServices[item].description?.images.count ?? 0 > 0 ? myServices[item].description?.images[0] ?? "" : "",
    //                                    myServices[item].description?.images[0] ?? "",
                                          title: myServices[item].description?.nameInEnglish ?? "",
//                                          location: "\(myServices[item].address?.city ?? "")" + " " + "\(myServices[item].address?.area ?? "")",
                                          location: "\(myServices[item].address?.address ?? "")",
                                          Rooms: "\(myServices[item].roomsGuest?.bedrooms ?? 0)",
                                          bathroom: "\(myServices[item].roomsGuest?.bathrooms ?? 0)",
                                          dayPrice: "\(myServices[item].price?.dayPrice ?? 0)",
                                          status: myServices[item].status ?? "",
                                            typebooking: myServices[item].bookingSetting?.bookingType ?? "",
                                          callback: {
                                            selectedId = myServices[item]._id ?? ""
                                            togglepopup.toggle()
                                       }
                                    )
                                    .onTapGesture {
                                        serviceManager.selectedService = myServices[item]
//                                        viewRouter.currentPage = "PriceDetailScreen"
                                        viewRouter.currentPage = "ServiceReview"
                                    }
                                }
                            }
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
                    
                    RoundedRectangle(cornerRadius: 20)
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
                                
                                Text("Delete?")
                                    .foregroundColor(Color("000000"))
                                    .font(Font.custom("poppins", size: 20))
                                    .fontWeight(.bold)
                                
                                Text("Are you sure you want to delete?")
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
                                        
                                    }.frame(width: 120, height: 35, alignment: .center)
                                        .onTapGesture{
                                            togglepopup.toggle()
                                        }
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 70)
                                            .foregroundColor(Color("FEBB12"))
                                            .overlay(
                                                    Text("Yes")
                                                        .foregroundColor(Color("000000"))
                                                        .font(Font.custom("poppins", size: 18))
                                                        .fontWeight(.regular)
                                            )
                                        
                                    }.frame(width: 120, height: 35, alignment: .center)
                                        .onTapGesture{
                                            VendorApiUtil.deleteService(serviceId: selectedId, success: { _ in
                                                togglepopup.toggle()
                                                showPreloader = true
                                                VendorApiUtil.getMyServices(success: { result in
                                                    showPreloader = false
                                                    myServices = result
                                                    if result.count > 0 {
                                                        print("ghgyhggghjhhgjhg")
                                        //                myServices = result[0].service
                                                    }
                                                }, failure: { _ in
                                                    showPreloader = false
                                                })
                                              
                                            }, failure: { _ in
                                                togglepopup.toggle()
                                            })
                                           
                                        }
                                }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .padding(.vertical)
                            }
                        )
                }
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
                VendorApiUtil.getMyServices(success: { result in
                    showPreloader = false
                    myServices = result
                    if result.count > 0 {
                        print("sdfbdhbfsuffsd")
        //                myServices = result[0].service
                    }
                }, failure: { _ in
                    showPreloader = false
                })
            })
    }
}


struct MyServiceScreen_Previews: PreviewProvider {
    static var previews: some View {
        MyServiceScreen()
    }
}
