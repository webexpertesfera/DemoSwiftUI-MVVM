//
//  ViewonMapScreen.swift
//  manasik
//
//  Created by Sheheryar on 10/08/2022.
//

import SwiftUI
import GoogleMaps
import CoreLocation

struct ViewonMapScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @State var serviceLocations: [City] = []
    
    static let cities = [
      City(name: "San Francisco", coordinate: CLLocationCoordinate2D(latitude: 37.7576, longitude: -122.4194)),
      City(name: "Seattle", coordinate: CLLocationCoordinate2D(latitude: 47.6131742, longitude: -122.4824903)),
      City(name: "Singapore", coordinate: CLLocationCoordinate2D(latitude: 1.3440852, longitude: 103.6836164)),
      City(name: "Sydney", coordinate: CLLocationCoordinate2D(latitude: -33.8473552, longitude: 150.6511076)),
      City(name: "Tokyo", coordinate: CLLocationCoordinate2D(latitude: 35.6684411, longitude: 139.6004407))
    ]

    @State var markers: [GMSMarker] =
    AppUtil.serviceLocations.map {
      let marker = GMSMarker(position: $0.coordinate)
      marker.title = $0.name
      marker.icon = UIImage(named: "Group 8274")
      return marker
    }

    @State var zoomInCenter: Bool = false
    @State var expandList: Bool = false
    @State var selectedMarker: GMSMarker?
    @State var yDragTranslation: CGFloat = 0
    @State var statechanged: Bool = false
    
    var body: some View {
        ZStack{
            MapViewControllerBridge(markers: $markers, selectedMarker: $selectedMarker, cityname: .constant(""), locationSearchService: LocationSearchService(), hotelsCheck: .constant(true), onAnimationEnded: {
                
            },onDragStop: {
                
            }, mapViewWillMove: { (isGesture) in
                  guard isGesture else {
                      return
                  }
            })
            
            VStack{
                HStack{
                    Circle()
                        .frame(width: 47, height: 47, alignment: .center)
                        .foregroundColor(Color("White"))
                        .overlay(
                            Image("backIocn")
                                .resizable()
                                .frame(width: 11, height: 22, alignment: .center)
                        ).onTapGesture{
                            viewRouter.goBack()
                        }
                    Spacer()
                }
                .padding(.top,AppUtil.getNotch() == true ? 50 : 30)
                .padding(.horizontal)
                Spacer()
            }
            
            VStack{
                Spacer()
                VStack{
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(0 ..< serviceManager.camps.count,id:\.self) { item in
                                ViewOnMapCard(Name: serviceManager.camps[item].description?.nameInEnglish ?? "",
                                              address: serviceManager.camps[item].address?.address ?? "",
                                              price: String(serviceManager.camps[item].price?.dayPrice ?? 0),
                                              ImageName: serviceManager.camps[item].description?.images.count ?? 0 > 0 ?      serviceManager.camps[item].description?.images[0] ?? "" : "")

                                    .padding(5)
                                    .onTapGesture{
                                        selectedMarker = markers[item]
                                    }
                               }
                        }
                    }
                    
                }.frame(width: UIScreen.main.bounds.width, height: 170, alignment: .center)
                    .background(Color("White").opacity(0.8))
                    .offset(y: 10)
                BottomNavigation()
            }
            
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
           
    }
    
}

struct ViewonMapScreen_Previews: PreviewProvider {
    static var previews: some View {
        ViewonMapScreen()
    }
}



struct City {
  var name: String
  var coordinate: CLLocationCoordinate2D
}
