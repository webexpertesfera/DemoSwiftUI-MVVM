//
//  SearchResults.swift
//  manasik
//
//  Created by Sheheryar on 24/05/2022.
//

import SwiftUI
import GoogleMaps
import CoreLocation

struct SearchResults: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    
    var body: some View {
        ZStack{
            
    VStack{
        TopNavigationWithFilter(titleText: "Search Results")
        ZStack{
            ScrollView(showsIndicators: false){
                HStack{
                    Text("Showing")
                        .foregroundColor(Color("000000").opacity(0.6))
                        .font(Font.custom("poppins", size: 14))
                        .fontWeight(.regular)
                    Text(" " + String(serviceManager.camps.count) + " ")
                        .foregroundColor(Color("000000").opacity(0.6))
                        .font(Font.custom("poppins", size: 14))
                        .fontWeight(.regular)
                    Text("results")
                        .foregroundColor(Color("000000").opacity(0.6))
                        .font(Font.custom("poppins", size: 14))
                        .fontWeight(.regular)
                    
                    Spacer()
                }.padding(.horizontal,30)
                if serviceManager.selectedType == "Stadium"{
                    ForEach(0 ..< serviceManager.camps.count,id:\.self) { item in
                        
                        SearchResultCardhours(ImageName: serviceManager.camps[item].description?.images.count ?? 0 > 0 ? serviceManager.camps[item].description?.images[0] ?? "" : "",
                                              Name: serviceManager.camps[item].description?.nameInEnglish ?? "",
                                              address: serviceManager.camps[item].address?.address ?? "",
                                              price: String(serviceManager.camps[item].price?.hourPrice ?? 0),
                                              favCheck: .constant(false),
                                              reviewCount: String( serviceManager.camps[item].reviews.count),
//                                              typebooking: (serviceManager.camps[item].bookingSetting.bookingType ?? ""),
                                              ratingNumber : serviceManager.camps[item].rating ?? 0.0 ,
                                              callback:{
                            
                        })
                        .padding(5)
                        .onTapGesture {
                            serviceManager.selectedCamp = serviceManager.camps[item]
                            viewRouter.currentPage = "SearchedDetail"
                        }
                    }
                } else {
                    ForEach(0 ..< serviceManager.camps.count,id:\.self) { item in
                        SearchResultCard(ImageName: serviceManager.camps[item].description?.images.count ?? 0 > 0 ? serviceManager.camps[item].description?.images[0] ?? "" : "",
                                         Name: serviceManager.camps[item].description?.nameInEnglish ?? "",
                                         address: serviceManager.camps[item].address?.address ?? "",
                                         price: String(serviceManager.camps[item].price?.dayPrice ?? 0),
                                         favCheck: .constant(false),
                                         reviewCount:   String( serviceManager.camps[item].reviews.count),
                                         //                                                            typebooking: serviceManager.camps[item].bookingSetting?.bookingType ?? "",
                                         ratingNumber : serviceManager.camps[item].rating ?? 0.0 ,
                                         
                                         callback:{
                            
                        } )
                        .padding(5)
                        .onTapGesture {
                            serviceManager.selectedCamp = serviceManager.camps[item]
                            viewRouter.currentPage = "SearchedDetail"
                        }
                    }
                }
            }
            
            VStack{
                Spacer()
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 160, height: 40, alignment: .center)
                    .foregroundColor(Color("FEBB12"))
                    .overlay(
                        HStack{
                            Image("Group 3809")
                                .resizable()
                                .frame(width: 25, height: 26, alignment: .center)
                            
                            Text("View on Map")
                                .foregroundColor(Color("White"))
                                .font(Font.custom("poppins", size: 14))
                                .fontWeight(.regular)
                        }
                    ).padding()
                    .onTapGesture{
                        for i in serviceManager.camps {
                            let city =  City(name: i.description?.nameInEnglish ?? "",
                                             coordinate: CLLocationCoordinate2D(latitude: i.location?.coordinates?[0] ?? 0.0,
                                                                                longitude: i.location?.coordinates?[1] ?? 0.0))
                            AppUtil.serviceLocations.append(city)
                        }
                        viewRouter.currentPage = "ViewonMapScreen"
                    }
                
            }
            
        }
        
        BottomNavigation()
    }


    }
    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
    .ignoresSafeArea(.all)
    .background(Color("F2F5F9"))
}
}

struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        SearchResults()
    }
}

