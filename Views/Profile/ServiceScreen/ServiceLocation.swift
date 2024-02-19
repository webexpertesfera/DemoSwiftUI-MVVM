//
//  ServiceLocation.swift
//  SmartBookings
//
//  Created by Sheheryar on 05/06/2022.
//

import SwiftUI
import GoogleMaps

struct ServiceLocation: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var address: String = AppUtil.addserviceObject?.address?.address ?? ""
    @State var Property: String = AppUtil.addserviceObject?.address?.houseNumber ?? ""
    @State var City: String = AppUtil.addserviceObject?.address?.city ?? ""
    @State var Area: String = AppUtil.addserviceObject?.address?.area ?? ""
    @State var Landmark: String = AppUtil.addserviceObject?.address?.landMark ?? ""
    @State var destination: String = AppUtil.addserviceObject?.address?.destination ?? ""
    @State var district: String = AppUtil.addserviceObject?.address?.district ?? ""
    @State var direction: String = AppUtil.addserviceObject?.address?.direction ?? ""
    @State var hotelsCheck : Bool = true
    @EnvironmentObject var serviceManager: ServiceManager
    @ObservedObject var locationSearchService = LocationSearchService()
    @State var togglepopup: Bool = false
    @State var coordiantes: [Double] = []
//    @State var coordiantes: Double?
    @State var selectedMarker: GMSMarker?
    @State var markers: [GMSMarker] =
    AppUtil.serviceLocations.map {
      let marker = GMSMarker(position: $0.coordinate)
      marker.title = $0.name
      marker.icon = UIImage(named: "Group 8274")

      return marker
    }
    var body: some View {
        ZStack{
            
            VStack{
                TopNavigation(titleText:"Service Description")
                VStack{
                    HStack{
                        Text("Address & Location")
                            .foregroundColor(Color("000000").opacity(0.8))
                            .font(Font.custom("poppins", size: 16))
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }.padding(.horizontal,10)
                    HStack{
                        Text("Please add the address & Location of service")
                            .foregroundColor(Color("000000").opacity(0.6))
                            .font(Font.custom("poppins", size: 12))
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }.padding(.horizontal,10)
                        .padding(.top,5)
                    ScrollView(showsIndicators:false){
                        VStack{
                            MapViewControllerBridge(markers: $markers, selectedMarker: $selectedMarker, cityname: $City, locationSearchService: locationSearchService, hotelsCheck: $hotelsCheck, onAnimationEnded: {
                                hotelsCheck.toggle()
                            },onDragStop: {
                                
                            }, mapViewWillMove: { (isGesture) in
                              guard isGesture else { return }
                             // self.zoomInCenter = false
                            })
//                            GoogleMapsView(longitude: .constant(AppUtil.CurrentLocationLongitude ?? 0.0),
//                                           latitude: .constant(AppUtil.CurrentLocationLatitude ?? 0.0))
                            
                        }.frame(width: UIScreen.main.bounds.width, height: 330, alignment: .center)
                        VStack{
                            Group{
                               // ProfileTextfield(placeHolder: "Address", textValue: $serviceManager.locationCity)
                                ProfileTextfield(placeHolder: "Address", textValue: $serviceManager.propertyaddres)
                               // ProfileTextfield(placeHolder: "City", textValue: $serviceManager.locationCity )
                               // ProfileTextfield(placeHolder: "Area", textValue: $serviceManager.administrativeArea)
                             
                            }.padding(.top,10)
                            
                        }
                        
                        LoginButton(title: "Done", callback: {
                            address = serviceManager.propertyaddres
                            City = serviceManager.locationCity
                            Area = serviceManager.administrativeArea
                            
                          //  if address != "" && City != "" && Area != "" && district != "" && destination != "" && direction != "" {
                               
                                let addressObj = Address()
                                addressObj.address = address
                                addressObj.landMark = Landmark
                                addressObj.houseNumber = Property
                                addressObj.city = City
                                addressObj.area = Area
                                addressObj.district = district
                                addressObj.destination = destination
                                addressObj.direction = direction
                                addressObj.houseNumber = address
                                
                                let location = Location()
                                coordiantes.append(AppUtil.addServiceLocationLatitude ?? 0)
                                coordiantes.append(AppUtil.addServiceLocationLongitude ?? 0)
                            
                                location.coordinates =  coordiantes
                                
                                AppUtil.addserviceObject?.address = addressObj
                                serviceManager.addService?.location = location
                                serviceManager.addService?.address = AppUtil.addserviceObject?.address
                                viewRouter.currentPage = "AddService"
//                            } else {
//                                togglepopup.toggle()
//                            }
                           
                        })
                            .padding(.bottom,30)
                    }
                    
                    //BottomNavigation()
                }
                
            }.keyboardAdaptive()
           
            
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
                                
                                Text("Error?")
                                    .foregroundColor(Color("000000"))
                                    .font(Font.custom("poppins", size: 20))
                                    .fontWeight(.bold)
                                
                                Text("Please input all fields")
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
                                                    Text("OK")
                                                        .foregroundColor(Color("000000").opacity(0.4))
                                                        .font(Font.custom("poppins", size: 18))
                                                        .fontWeight(.regular)
                                            )
                                        
                                    }.frame(width: 120, height: 35, alignment: .center)
                                        .onTapGesture{
                                            togglepopup.toggle()
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
            .onAppear(perform: {
                locationSearchService.getAddressFromLatLon(AppUtil.CurrentLocationLatitude ?? 0.0,
                                                           AppUtil.CurrentLocationLongitude ?? 0.0, success: { result in
                    address = result.subLocality ?? ""
                    City = result.subAdministrativeArea ?? ""
                    Landmark = result.locality ?? ""
                    
                    var location = ""
                    location += result.subThoroughfare ?? "" + " "
                    location += result.thoroughfare ?? "" + " "
                    location += result.subLocality ?? "" + " "
                    location += result.locality ?? ""  + " "
                    location += " "
                    location += result.country ?? "" + " "
                    
                    serviceManager.administrativeArea = result.administrativeArea ?? ""
                    serviceManager.subAdminArea = result.subAdministrativeArea ?? ""
                    serviceManager.locationCity = result.locality ?? ""
                    serviceManager.propertyaddres = location
                    
                    AppUtil.addServiceLocationLatitude =  AppUtil.CurrentLocationLatitude ?? 0.0
                    AppUtil.addServiceLocationLongitude =  AppUtil.CurrentLocationLongitude ?? 0.0
                    
                    let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: AppUtil.CurrentLocationLatitude ?? 0.0,
                                                                            longitude: AppUtil.CurrentLocationLongitude ?? 0.0))
                    marker.title = "Your location"
                    marker.icon = UIImage(named: "Group 8274")
                    selectedMarker = marker
                    
                }, failure: { _ in
                    
                })
            })
            .onTapGesture {
                hideKeyboard()
            }
    }
}

struct ServiceLocation_Previews: PreviewProvider {
    static var previews: some View {
        ServiceLocation()
    }
}
