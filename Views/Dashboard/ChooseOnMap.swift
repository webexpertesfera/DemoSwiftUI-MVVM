//
//  ChooseOnMap.swift
//  manasik
//
//  Created by Sheheryar on 20/09/2022.
//

import SwiftUI
import GoogleMaps
import CoreLocation
import MapKit

struct ChooseOnMap: View{
    @State var markers: [GMSMarker] =
    AppUtil.serviceLocations.map {
      let marker = GMSMarker(position: $0.coordinate)
      marker.title = $0.name
      marker.icon = UIImage(named: "Group 8274")
      return marker
    }

    @ObservedObject var locationSearchService = LocationSearchService()
    @State var selectedMarker: GMSMarker?
    var body: some View {
        ZStack{
            MapViewControllerBridge(markers: $markers, selectedMarker: $selectedMarker, cityname: .constant(""), locationSearchService: LocationSearchService(), hotelsCheck: .constant(true), onAnimationEnded: {

            },onDragStop: {
            }, mapViewWillMove: { (isGesture) in
                  guard isGesture else { return }

                })

        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .onAppear(perform: {
                locationSearchService.getAddressFromLatLon(AppUtil.CurrentLocationLatitude ?? 0.0,
                                                           AppUtil.CurrentLocationLongitude ?? 0.0, success: { result in

                    let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: AppUtil.CurrentLocationLatitude ?? 0.0,
                                                                            longitude: AppUtil.CurrentLocationLongitude ?? 0.0))
                    marker.title = "Your location"
                    marker.icon = UIImage(named: "Group 8274")
                    selectedMarker = marker

                }, failure: { _ in

                })
            })
    }
}


struct ChooseOnMap_Previews: PreviewProvider {
    static var previews: some View {
        ChooseOnMap()
    }
}


//{
//
//    @State private var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(19.43, -99.13), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
//    @State private var locations = [Location]()
//
//    var body: some View{
//        Map(coordinateRegion: $coordinateRegion, annotationItems: locations) { location in
//            MapAnnotation(coordinate: CLLocationCoordinate2DMake($locations.coordinates?[0] ?? 0.0, $locations.coordinates?[1] ?? 0.0)
//
//            ) {
//                VStack{
//                    Text("dsfdsfdsfdsfsd")
//                        Image(systemName: "star.fill")
//                }
//            }
//
//        }
//    }
//
//}


