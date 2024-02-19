//
//  SearchArea.swift
//  SmartBookings
//
//  Created by Sheheryar on 23/05/2022.
//
import SwiftUI
import CoreLocation
import IQKeyboardManagerSwift

struct SearchArea: View {

    @State var searchcategorieslistt : [Categorylist]?
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @State var CitySearchLists: [citySearchList] = []
    @State var locations: [Location] = []
    @StateObject var createdProject:ProjectItem = ProjectItem()
    @State var showPreloader: Bool = false
    @State var city: String = ""
    var textColor: String = "000000"
    @State var checkIn: String = ""
    @State var numberOfRooms: String = "1"
    @State var checkInDate: Date = Date()
//    @State var checkOutDate: Date = Date()
    @State var checkOutDate: Date = Calendar.current.startOfDay(for: Calendar.current.date(byAdding: .day, value: 1, to: .now)!)
    @State var types: [Bool] = [false,false,false,false,false,false,false,false,false,false]
    @State var selectedType : String = ""
    @State var togglepopup: Bool = false
    
    @State var AllCategory: Bool = false
    @State var chooseOnMap: Bool = false
    @State var cityPopUpMsg: Bool = false
    @State var errorMessage: String = ""
    @State var viewonMap: Bool = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var name: String = ""
    
    let rows = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]
    
//    selectedCategoryId
//    selectedIndex
//    selectedType
    
    var body: some View {
        ZStack{
            VStack {
                TopNavigationSearch(titleText: "Search")
                ScrollView( showsIndicators: false){
                    VStack{
                         HStack {
                             if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                                 if language == "ar"{
                                     ForEach(0 ..< 5, id: \.self) { item in

                                        if types[item] == true {
                                         categorySearchCardBorder(title: AppUtil.categorieslistt?.categories?[item].category_name_ar ?? "")
                                            .onTapGesture {
                                                types[item] = false
                                            }
                                        } else {
                                          categorySearchCard(title: AppUtil.categorieslistt?.categories?[item].category_name_ar ?? "")
                                            .onTapGesture {
                                                markAllFalse(index: item)
                                                types[item] = true
                                                serviceManager.selectedType = AppUtil.categorieslistt?.categories?[item].type ?? ""
                                                serviceManager.selectedCategoryId = AppUtil.categorieslistt?.categories?[item]._id ?? ""
                                            }
                                        }
                                    }
                                 }else{
                                     ForEach(0 ..< 5, id: \.self) { item in

                                        if types[item] == true {
                                         categorySearchCardBorder(title: AppUtil.categorieslistt?.categories?[item].category ?? "")
                                            .onTapGesture {
                                                types[item] = false
                                            }
                                        } else {
                                          categorySearchCard(title: AppUtil.categorieslistt?.categories?[item].category ?? "")
                                            .onTapGesture {
                                                markAllFalse(index: item)
                                                types[item] = true
                                                serviceManager.selectedType = AppUtil.categorieslistt?.categories?[item].type ?? ""
                                                serviceManager.selectedCategoryId = AppUtil.categorieslistt?.categories?[item]._id ?? ""
                                            }
                                        }
                                    }
                                 }
                             }else{
                                 ForEach(0 ..< 5, id: \.self) { item in
                                    if types[item] == true {
                                     categorySearchCardBorder(title: AppUtil.categorieslistt?.categories?[item].category ?? "")
                                        .onTapGesture {
                                            types[item] = false
                                        }
                                    } else {
                                      categorySearchCard(title: AppUtil.categorieslistt?.categories?[item].category ?? "")
                                        .onTapGesture {
                                            markAllFalse(index: item)
                                            types[item] = true
                                            serviceManager.selectedType = AppUtil.categorieslistt?.categories?[item].type ?? ""
                                            serviceManager.selectedCategoryId = AppUtil.categorieslistt?.categories?[item]._id ?? ""
                                        }
                                    }
                                }
                             }
                         }.frame(width: UIScreen.main.bounds.width - 10,height: 30)
//
                        HStack {

                            if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                                if language == "ar"{
                                    ForEach(5 ..< (AppUtil.categorieslistt?.categories!.count)!, id: \.self) { item in
                                        if types[item] == true {
                                            categorySearchCardBorder(title: AppUtil.categorieslistt?.categories?[item].category_name_ar ?? "")
                                            .onTapGesture {
                                                types[item] = false
                                            }
                                        } else {
                                            categorySearchCard(title: AppUtil.categorieslistt?.categories?[item].category_name_ar ?? "")
                                                .onTapGesture {
                                                    markAllFalse(index: item)
                                                    types[item] = true
                                                    serviceManager.selectedType = AppUtil.categorieslistt?.categories?[item].type ?? ""
                                                    serviceManager.selectedCategoryId = AppUtil.categorieslistt?.categories?[item]._id ?? ""
                                            }
                                        }
                                    }
                                }else{
                                    ForEach(5 ..< (AppUtil.categorieslistt?.categories!.count)!, id: \.self) { item in

                                        if types[item] == true {
                                            categorySearchCardBorder(title: AppUtil.categorieslistt?.categories?[item].category ?? "")
                                            .onTapGesture {
                                                types[item] = false
                                            }
                                        } else {
                                            categorySearchCard(title: AppUtil.categorieslistt?.categories?[item].category ?? "")
                                                .onTapGesture {
                                                    markAllFalse(index: item)
                                                    types[item] = true
                                                    serviceManager.selectedType = AppUtil.categorieslistt?.categories?[item].type ?? ""
                                                    serviceManager.selectedCategoryId = AppUtil.categorieslistt?.categories?[item]._id ?? ""
                                            }
                                        }
                                    }
                                }
                            }else{
                                ForEach(5 ..< (AppUtil.categorieslistt?.categories!.count)!, id: \.self) { item in
                                    if types[item] == true {
                                        categorySearchCardBorder(title: AppUtil.categorieslistt?.categories?[item].category ?? "")
                                        .onTapGesture {
                                            types[item] = false
                                        }
                                    } else {
                                        categorySearchCard(title: AppUtil.categorieslistt?.categories?[item].category ?? "")
                                            .onTapGesture {
                                                markAllFalse(index: item)
                                                types[item] = true
                                                serviceManager.selectedType = AppUtil.categorieslistt?.categories?[item].type ?? ""
                                                serviceManager.selectedCategoryId = AppUtil.categorieslistt?.categories?[item]._id ?? ""
                                        }
                                    }
                                }
                            }
                        }.frame(width: UIScreen.main.bounds.width - 10,height:30)
                    }.padding(.vertical)
//                    .frame(width: UIScreen.main.bounds.width, height: 400, alignment: .center)
                    
//                  SearchBar(searchQuery: $city,caption: "City, Landmark or Property")
                    if serviceManager.selectedType == "Apartment"  || AppUtil.selectedCategory == "Apartments" || serviceManager.selectedType == "Hotel" {
                        VStack{
                            RoundedRectangle(cornerRadius: 80)
                                .foregroundColor(Color("White"))
                                .frame(width: UIScreen.main.bounds.width - 50, height: 61, alignment: .center)
                                .overlay(
                                    HStack{
//                                        TextField("Search city, Landmark or Property", text: self.$city)

                                        TextField("City", text: self.$city)
                                            .foregroundColor(Color("000000").opacity(0.4))
                                            .font(Font.custom("poppins", size: 12))
                                            .padding(.leading,10)
                                            .cornerRadius(20)
                                            .userInteractionDisabled()
                                        
                                        Image("magnifyglass")
                                    }.padding(.horizontal)
                                ).onTapGesture {
                                    cityPopUpMsg.toggle()
                                }
                            
                            HStack {
                                RoundedRectangle(cornerRadius: 80)
                                    .frame(height: 40, alignment: .center)
                                    .foregroundColor(Color(viewonMap ? "FEBB12" : "White"))
                                    .overlay(
                                        HStack{
                                            Image("Group 3821")
                                                .resizable()
                                                .frame(width: 15, height: 20, alignment: .center)
                                            Text("Around me")
                                                .font(Font.custom("poppins", size: 14))
                                                .fontWeight(.regular)
                                                .foregroundColor(viewonMap ? Color("White") : Color(textColor).opacity(0.5))
                                        }.padding(.horizontal)
                                    ).onTapGesture{
                                        print("ertertertr")
                                        serviceManager.searchLat = AppUtil.CurrentLocationLatitude
                                        serviceManager.searchLong = AppUtil.CurrentLocationLongitude
                                        
                                        showPreloader = true
//                                        if hours != "" {
//                                            serviceManager.HoursCount = Int(hours)
//                                        } else {
//                                            serviceManager.HoursCount = 1
//                                        }
                                        
                                        serviceManager.checkInDate = AppUtil.getDateInString(checkInDate)
                                        serviceManager.checkOutDate = AppUtil.getDateInString(checkOutDate)
                                        
//                                        serviceManager.checkIndatee = AppUtil.getDateInString(checkInDate)
//                                        serviceManager.checkOutdatee = AppUtil.getTimeInString(checkOutDate)
                                        
                                        serviceManager.camps = []
                                        UserApiUtil.getServiceByfilter(
                                            city: city,
                                            categoryId: serviceManager.selectedCategoryId ?? "",
                                            rooms: "1",
                                            checkIn:  serviceManager.checkInDate ?? "" ,
                                            lat: serviceManager.searchLat ?? 34.6844,
                                            lng: serviceManager.searchLong ?? 73.0479,
                                            checkOut: serviceManager.checkOutDate ?? "",aroundme: 10000000000000000, success: { result in
                                                DispatchQueue.main.async {
                                                    showPreloader = false
                                                    serviceManager.dayCount = AppUtil.numberOfDaysBetween(startDate: checkInDate, endDate: checkOutDate)
                                                    if serviceManager.dayCount == 0 {
                                                        serviceManager.dayCount = 1
                                                    }
                                                    if result.services?.count ?? 0 > 0 {
                                                        serviceManager.camps = result.services!
                                                    }
                                                    AppUtil.categorieslistt?.categories?.remove(at: 0)
                                                    viewRouter.currentPage = "SearchResults"
                                                }
                                               
                                            }, failure: { f in
                                                showPreloader = false
                                                errorMessage = f
                                                togglepopup.toggle()
                                            })

                                        viewonMap.toggle()
                                    }
                                Spacer()
                               
                                RoundedRectangle(cornerRadius: 80)
                                    .frame(height: 40, alignment: .center)
                                    .foregroundColor(Color(chooseOnMap ? "FEBB12" : "White"))
                                    .overlay(
                                        HStack{
                                            Image("Group 3820")
                                                .resizable()
                                                .frame(width: 15, height: 20, alignment: .center)
                                            Text("Choose on map")
                                                .font(Font.custom("poppins", size: 14))
                                                .fontWeight(.regular)
                                                .foregroundColor(chooseOnMap ? Color("White") : Color(textColor).opacity(0.5))
                                        }.padding(.horizontal)
                                    ).onTapGesture{
                                       
                                        serviceManager.searchLat = AppUtil.CurrentLocationLatitude
                                        serviceManager.searchLong = AppUtil.CurrentLocationLongitude
                                        
                                        showPreloader = true
//                                        if hours != "" {
//                                            serviceManager.HoursCount = Int(hours)
//                                        } else {
//                                            serviceManager.HoursCount = 1
//                                        }
                                        
                                        serviceManager.checkInDate = AppUtil.getDateInString(checkInDate)
                                        serviceManager.checkOutDate = AppUtil.getDateInString(checkOutDate)
                                        
//                                        serviceManager.checkIndatee = AppUtil.getDateInString(checkInDate)
//                                        serviceManager.checkOutdatee = AppUtil.getTimeInString(checkOutDate)
                                        
                                        serviceManager.camps = []
                                        UserApiUtil.getServiceByfilter(
                                            city: city,
                                            categoryId: serviceManager.selectedCategoryId ?? "",
                                            rooms: "1",
                                            checkIn:  serviceManager.checkInDate ?? "" ,
                                            lat: serviceManager.searchLat ?? 34.6844,
                                            lng: serviceManager.searchLong ?? 73.0479,
                                            checkOut: serviceManager.checkOutDate ?? "",aroundme: 10000000000000000, success: { result in
                                                DispatchQueue.main.async {
                                                    showPreloader = false
                                                    serviceManager.dayCount = AppUtil.numberOfDaysBetween(startDate: checkInDate, endDate: checkOutDate)
                                                    if serviceManager.dayCount == 0 {
                                                        serviceManager.dayCount = 1
                                                    }
                                                    if result.services?.count ?? 0 > 0 {
                                                        serviceManager.camps = result.services!
                                                    }
//                                                    AppUtil.categorieslistt?.categories?.remove(at: 0)
                                                    
                                                    if result.services?.count ?? 0 > 0 {
                                                        serviceManager.camps = result.services!
                                                    }
                                                    print("serviceManager.camps", serviceManager.camps[0].location?.coordinates)
                                                    serviceManager.camps = serviceManager.camps
                                                    viewRouter.currentPage = "LocationScreen"
                                                }
                                               
                                            }, failure: { f in
                                                showPreloader = false
                                                errorMessage = f
                                                togglepopup.toggle()
                                            })

                                        chooseOnMap.toggle()
                                        
//                                        AppUtil.categorieslistt?.categories?.remove(at: 0)
//                                        viewRouter.currentPage = "LocationScreen"
                                    }
                           
                            }.frame(width: UIScreen.main.bounds.width - 50)
                                .padding(.vertical,10)
                            VStack {
                                SearchDateControl(searchQuery: $checkIn,caption: "Check-In", date: $checkInDate)
                                    .padding(.bottom)
                               
                                SearchDateControl(searchQuery: .constant(""),caption: "Check-out", date: $checkOutDate)
                                    .padding(.bottom)
                                
                                SearchFields(searchQuery: $numberOfRooms,caption: "Rooms",imageName: "Group 6778")
                                    .padding(.bottom)
                                
                            }
                            
                            HStack {
                                RoundedRectangle(cornerRadius: 80)
                                    .foregroundColor(Color("White"))
                                    .frame(height: 50, alignment: .center)
                                    .overlay(
                                        HStack{
                                            Image("Group 6779")
                                                .resizable()
                                                .frame(width: 20, height: 25, alignment: .center)
                                                .padding(.leading)
                                            Spacer()
                                            TextField("Adults", text: .constant(""))
                                                .foregroundColor(Color("000000").opacity(0.4))
                                                .font(Font.custom("poppins", size: 12))
                                                .padding(.leading,10)
                                                .keyboardType(.numberPad)
                                                .onTapGesture {
                                                    IQKeyboardManager.shared.enable = true
                                                    IQKeyboardManager.shared.keyboardDistanceFromTextField = 80
                                                }
                                        }.padding(.horizontal)
                                    )
                                Spacer()
                                RoundedRectangle(cornerRadius: 80)
                                    .foregroundColor(Color("White"))
                                    .frame(height: 50, alignment: .center)
                                    .overlay(
                                        HStack{
                                            Image("Group 6780")
                                                .resizable()
                                                .frame(width: 20, height: 20, alignment: .center)
                                                .padding(.leading)
                                            Spacer()
                                            TextField("Children", text: .constant(""))
                                                .foregroundColor(Color("000000").opacity(0.4))
                                                .font(Font.custom("poppins", size: 12))
                                                .padding(.leading,10)
                                                .keyboardType(.numberPad)
                                                .onTapGesture {
                                                    IQKeyboardManager.shared.enable = true
                                                    IQKeyboardManager.shared.keyboardDistanceFromTextField = 80
                                                }
                                        }.padding(.horizontal)
                                    )
                            }.frame(width: UIScreen.main.bounds.width - 50)
                            
                            if (serviceManager.searchQuery ?? "") != "" {
                                HStack{
                                    Text("You are Searching in the area of " + (serviceManager.searchQuery ?? "") )
                                        .font(Font.custom("poppins", size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(textColor).opacity(0.5))
                                    
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(Color.red)
                                        .onTapGesture{
                                            serviceManager.searchLat = 34.6844
                                            serviceManager.searchLong = 73.0479
                                            serviceManager.searchQuery = ""
                                        }
                                }.padding(10)
                            }
                            
                            LoginButton(title: "Search", callback: {
                                showPreloader = true
//                                $serviceManager.serviceLocations = city
                                serviceManager.checkInDate = AppUtil.getDateInString(checkInDate)
                                serviceManager.checkOutDate = AppUtil.getDateInString(checkOutDate)
                                serviceManager.roomsRequired = numberOfRooms
                                serviceManager.camps = []
                                UserApiUtil.getServiceByfilter(
//                                    AppUtil.addserviceObject?.address?.area ?? ""
                                    city: city,
                                    categoryId: serviceManager.selectedCategoryId ?? "",
                                    rooms: numberOfRooms,
                                    checkIn:  serviceManager.checkInDate ?? "" ,
                                    lat: serviceManager.searchLat ?? 34.6844,
                                    lng: serviceManager.searchLong ?? 73.0479,
                                    checkOut: serviceManager.checkOutDate ?? "",aroundme: 10000000000000000, success: { result in
                                        DispatchQueue.main.async {
                                            serviceManager.dayCount = AppUtil.numberOfDaysBetween(startDate: checkInDate, endDate: checkOutDate)
                                            if serviceManager.dayCount == 0 {
                                                serviceManager.dayCount = 1
                                            }
                                            if result.services?.count ?? 0 > 0 {
                                                serviceManager.camps = result.services!
                                            }
                                            viewRouter.currentPage = "SearchResults"
                                        }
                                    }, failure: { f in
                                        errorMessage = f
                                        showPreloader = false
                                        togglepopup.toggle()
                                        
                                    })
                            }).padding(.vertical)
                        }
                    }
                    else if serviceManager.selectedType == "Stadium" {
                        StadiumSearch(showPreloader: $showPreloader, togglepopup: $togglepopup, errorMessage: $errorMessage )
                    }
                    
                    else {
                        VStack{
                            RoundedRectangle(cornerRadius: 80)
                                .foregroundColor(Color("White"))
                                .frame(width: UIScreen.main.bounds.width - 50, height: 61, alignment: .center)
                                .overlay(
                                    HStack{
//                                        TextField("Search city, Landmark or Property", text: $city)
                                        TextField("City", text: self.$city)
                                            .foregroundColor(Color("000000"))
                                            .font(Font.custom("poppins", size: 14))
                                            .padding(.leading,10)
                                            .cornerRadius(20)
                                            .userInteractionDisabled()
//                                            .opacity(0.4)
                                        Image("magnifyglass")
                                    }.padding(.horizontal)
                                ).onTapGesture {
                                    cityPopUpMsg.toggle()
                                }
                            HStack {
                                RoundedRectangle(cornerRadius: 80)
                                    .frame(height: 40, alignment: .center)
                                    .foregroundColor(Color(viewonMap ? "FEBB12" : "White"))
                                    .overlay(
                                        HStack{
                                            Image("Group 3821")
                                                .resizable()
                                                .frame(width: 15, height: 20, alignment: .center)
                                            Text("Around me")
                                                .font(Font.custom("poppins", size: 14))
                                                .fontWeight(.regular)
                                                .foregroundColor(viewonMap ? Color("White") : Color(textColor).opacity(0.5))
                                        }.padding(.horizontal)
                                    ).onTapGesture{
                                        print("sdfsdfdf")
                                        serviceManager.searchLat = AppUtil.CurrentLocationLatitude
                                        serviceManager.searchLong = AppUtil.CurrentLocationLongitude
                                        
                                        serviceManager.checkInDate = AppUtil.getBookingDate(checkInDate)
                                        serviceManager.checkOutDate = AppUtil.getBookingDate(checkOutDate)
                                        
                                        showPreloader = true
                                        serviceManager.camps = []
                                        UserApiUtil.getServiceByfilter(
                                            city: city,
                                            categoryId: serviceManager.selectedCategoryId ?? "",
                                            rooms: numberOfRooms,
                                            checkIn:  serviceManager.checkInDate ?? "" ,
                                            lat: serviceManager.searchLat ?? 34.6844 ,
                                            lng: serviceManager.searchLong ?? 73.0479 ,
                                            checkOut: serviceManager.checkOutDate ?? "",
                                            aroundme: viewonMap ? AppUtil.appSettings.distance?.maxDistance ?? 10000000 : 10000000,
                                            success: { result in
                                                DispatchQueue.main.async {
                                                    serviceManager.dayCount = AppUtil.numberOfDaysBetween(startDate: checkInDate, endDate: checkOutDate)
                                                    if serviceManager.dayCount == 0 {
                                                        serviceManager.dayCount = 1
                                                    }
                                                    if result.services?.count ?? 0 > 0 {
                                                        serviceManager.camps = result.services!
                                                    }
                                                    showPreloader = false
                                                    AppUtil.categorieslistt?.categories?.remove(at: 0)
                                                    viewRouter.currentPage = "SearchResults"
                                                }
                                            }, failure: { _ in
                                                showPreloader = false
                                        })
                                        
//                                        viewonMap.toggle()
                                    }
                                
                                Spacer()

                                RoundedRectangle(cornerRadius: 80)
                                    .frame(height: 40, alignment: .center)
                                    .foregroundColor(Color(chooseOnMap ? "FEBB12" : "White"))
                                    .overlay(
                                        HStack{
                                            Image("Group 3820")
                                                .resizable()
                                                .frame(width: 15, height: 20, alignment: .center)
                                            Text("Choose on map")
                                                .font(Font.custom("poppins", size: 14))
                                                .fontWeight(.regular)
                                                .foregroundColor(chooseOnMap ? Color("White") : Color(textColor).opacity(0.5))
                                        }.padding(.horizontal)
                                    ).onTapGesture{
                                        
                                        serviceManager.searchLat = AppUtil.CurrentLocationLatitude
                                        serviceManager.searchLong = AppUtil.CurrentLocationLongitude
                                        
                                        showPreloader = true
//                                        if hours != "" {
//                                            serviceManager.HoursCount = Int(hours)
//                                        } else {
//                                            serviceManager.HoursCount = 1
//                                        }
                                        
                                        serviceManager.checkInDate = AppUtil.getDateInString(checkInDate)
                                        serviceManager.checkOutDate = AppUtil.getDateInString(checkOutDate)
                                        
//                                        serviceManager.checkIndatee = AppUtil.getDateInString(checkInDate)
//                                        serviceManager.checkOutdatee = AppUtil.getTimeInString(checkOutDate)
                                        
                                        serviceManager.camps = []
                                        UserApiUtil.getServiceByfilter(
                                            city: city,
                                            categoryId: serviceManager.selectedCategoryId ?? "",
                                            rooms: "1",
                                            checkIn:  serviceManager.checkInDate ?? "" ,
                                            lat: serviceManager.searchLat ?? 34.6844,
                                            lng: serviceManager.searchLong ?? 73.0479,
                                            checkOut: serviceManager.checkOutDate ?? "",aroundme: 10000000000000000, success: { result in
                                                DispatchQueue.main.async {
                                                    showPreloader = false
                                                    serviceManager.dayCount = AppUtil.numberOfDaysBetween(startDate: checkInDate, endDate: checkOutDate)
                                                    if serviceManager.dayCount == 0 {
                                                        serviceManager.dayCount = 1
                                                    }
                                                    if result.services?.count ?? 0 > 0 {
                                                        serviceManager.camps = result.services!
                                                    }
                                                    
                                                    print("serviceManager.camps", serviceManager.camps[0].location?.coordinates)
                                                    serviceManager.camps = serviceManager.camps
                                                    viewRouter.currentPage = "LocationScreen"
                                                }
                                               
                                            }, failure: { f in
                                                showPreloader = false
                                                errorMessage = f
                                                togglepopup.toggle()
                                            })

                                        chooseOnMap.toggle()
                                        
//                                        AppUtil.categorieslistt?.categories?.remove(at: 0)
//                                        viewRouter.currentPage = "LocationScreen"
                                    }
                            }.frame(width: UIScreen.main.bounds.width - 50)
                                .padding(.vertical,10)
                            
                            VStack {
                                SearchDateControl(searchQuery: .constant(""),caption: "Check-In-Date",date: $checkInDate)
                                    .padding(.bottom)
                                SearchDateControl(searchQuery: .constant(""),caption: "Check-out-Date",date: $checkOutDate)
                                    .padding(.bottom)
                                }
                            
                            if (serviceManager.searchQuery ?? "") != "" {
                                HStack {
                                    Text("You are Searching in the area of " + (serviceManager.searchQuery ?? "") )
                                        .font(Font.custom("poppins", size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(textColor).opacity(0.5))
                                    
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(Color.red)
                                        .onTapGesture{
                                            serviceManager.searchLat = 34.6844
                                            serviceManager.searchLong = 73.0479
                                            serviceManager.searchQuery = ""
                                        }
                                    
                                }.padding(10)
                            }

                            LoginButton(title: "Search", callback: {
                                serviceManager.checkInDate = AppUtil.getBookingDate(checkInDate)
                                serviceManager.checkOutDate = AppUtil.getBookingDate(checkOutDate)
                                showPreloader = true
                                serviceManager.camps = []
                                UserApiUtil.getServiceByfilter(
                                    city: city,
                                    categoryId: serviceManager.selectedCategoryId ?? "",
                                    rooms: numberOfRooms,
                                    checkIn:  serviceManager.checkInDate ?? "" ,
                                    lat: serviceManager.searchLat ?? 34.6844 ,
                                    lng: serviceManager.searchLong ?? 73.0479 ,
                                    checkOut: serviceManager.checkOutDate ?? "",
                                    aroundme: viewonMap ? AppUtil.appSettings.distance?.maxDistance ?? 10000000 : 10000000,
                                    success: { result in
                                        DispatchQueue.main.async {
                                            serviceManager.dayCount = AppUtil.numberOfDaysBetween(startDate: checkInDate, endDate: checkOutDate)
                                            if serviceManager.dayCount == 0 {
                                                serviceManager.dayCount = 1
                                            }
                                            if result.services?.count ?? 0 > 0 {
                                                serviceManager.camps = result.services!
                                            }
                                            showPreloader = false
                                            viewRouter.currentPage = "SearchResults"
                                        }
                                    }, failure: { _ in
                                        showPreloader = false
                                })
                               
                            }).padding(.vertical)
                            
                        }
                    }
                }
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
                                
                                Text("Error?")
                                    .foregroundColor(Color("000000"))
                                    .font(Font.custom("poppins", size: 20))
                                    .fontWeight(.bold)
                                
                                Text(errorMessage)
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
            
            
            if cityPopUpMsg {
                    ZStack {
                        VStack {
                            HStack {
                                Text("Select City")
                                    .foregroundColor(Color("04304B"))
                                    .font(Font.custom("poppins", size: 20))
                                    .fontWeight(.medium)
                                    .padding(.top, 20)
                                    .padding(.leading, 30)
                                    .padding(.trailing, 190)
//                                    .padding(.bottom, 10)
                                    .multilineTextAlignment(.center)
                                
                                 Image("Cross_new")
                                    .padding(.top, 20)
                                    .onTapGesture{
                                        cityPopUpMsg.toggle()
                                    }
                                Spacer()
                            }.padding(.horizontal,5)
                                .padding(.bottom, 5)
                            
                            Divider()
                                .padding(.vertical)
                            
                            ScrollView(showsIndicators:false) {
                                VStack{
                                    
                                    if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                                        if language == "ar"{
                                            if CitySearchLists.count > 0 {
                                                ForEach(0 ..< CitySearchLists.count,id:\.self) { ind in
                                                    CitySearchList(
                                                        title: CitySearchLists[ind].name_ar ?? "")
                                                    .onTapGesture {
                                                        print("City name", CitySearchLists[ind].name_ar ?? "")
                                                        self.city = CitySearchLists[ind].name_ar ?? ""
                                                        cityPopUpMsg.toggle()
                                                    }
                                                }
                                            }
                                            
                                        }else{
                                            if CitySearchLists.count > 0 {
                                                ForEach(0 ..< CitySearchLists.count,id:\.self) { ind in
                                                    CitySearchList(
                                                        title: CitySearchLists[ind].name ?? "")
                                                    .onTapGesture {
                                                        print("City name", CitySearchLists[ind].name ?? "")
                                                        self.city = CitySearchLists[ind].name ?? ""
                                                        cityPopUpMsg.toggle()
                                                    }
                                                }
                                            }
                                            
                                        }
                                    }else{
                                        if CitySearchLists.count > 0 {
                                            ForEach(0 ..< CitySearchLists.count,id:\.self) { ind in
                                                CitySearchList(
                                                    title: CitySearchLists[ind].name ?? "")
                                                .onTapGesture {
                                                    print("City name", CitySearchLists[ind].name ?? "")
                                                    self.city = CitySearchLists[ind].name ?? ""
                                                    cityPopUpMsg.toggle()
                                                }
                                            }
                                        }
                                        
                                    }
                                    
                                   
                                    
                                    
                                    
                                }
                            }
                            .navigationBarHidden(true)
                        }
                    }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-350, alignment: .center)
                         .ignoresSafeArea(.all)
                         .background(Color("FFFFFF"))
                         .foregroundColor(Color("FFFFFF"))
                         .cornerRadius(20)
                         .padding(.top, 300)
                         .onAppear(perform: {
                            VendorApiUtil.citySerachList(success: { res in
                                CitySearchLists = res
                                print("City list api success")
                            }, failure: { _ in
                                print("City list api issue")
                            })
                        })
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
                print("sfsdfdsf", serviceManager.bookedServiceObject?.location?.coordinates)
                //  self.searchcategorieslistt = AppUtil.categorieslistt
                
                let allinfo = Categorylist()
                if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                    if language == "ar"{
                        allinfo._id = ""
                        allinfo.category = "All"
                        allinfo.category_name_ar = "All"
                        allinfo.user = ""
                        allinfo.__v = 0
                        allinfo.image = ""
                        allinfo.type = ""
                        AppUtil.categorieslistt?.categories?.insert(allinfo, at: 0)
                        markAllFalse(index: serviceManager.selectedIndex ?? 0)
                    } else {
                        allinfo._id = ""
                        allinfo.category = "All"
                        allinfo.category_name_ar = "All"
                        allinfo.user = ""
                        allinfo.__v = 0
                        allinfo.image = ""
                        allinfo.type = ""
                        AppUtil.categorieslistt?.categories?.insert(allinfo, at: 0)
                        markAllFalse(index: serviceManager.selectedIndex ?? 0)
                    }
                }else{
                    allinfo._id = ""
                    allinfo.category = "All"
                    allinfo.category_name_ar = "All"
                    allinfo.user = ""
                    allinfo.__v = 0
                    allinfo.image = ""
                    allinfo.type = ""
                    AppUtil.categorieslistt?.categories?.insert(allinfo, at: 0)
                    markAllFalse(index: serviceManager.selectedIndex ?? 0)
                }
               
                

            })
    }
    
    
    
    func markAllFalse(index: Int) {
        for i in 0 ..< types.count {
            if i != index {
                types[i] = false
            } else {
                types[i] = true
                serviceManager.selectedType = AppUtil.categorieslistt?.categories?[i].type ?? ""
                serviceManager.selectedCategoryId = AppUtil.categorieslistt?.categories?[i]._id ?? ""
            }
        }
    }
}


struct SearchArea_Previews: PreviewProvider {
    static var previews: some View {
        SearchArea()
        //StadiumSearch()
    }
}

class ProjectItem: Identifiable, ObservableObject {
    
    @Published var id: UUID = UUID()
    @Published var startDate:Date = Date()
    var targetDate:Date {
            let daysNeeded = (targetWordCount - startWordCount) / dailyWordCount
            print("Need \(daysNeeded) days to reach the target")
            var dateComponent = DateComponents()
            dateComponent.day = 1

            let nextDate = Calendar.current.date(byAdding: dateComponent, to: startDate) ?? startDate
            print("The target date will be \(nextDate)")
            return nextDate
    }
    
    @Published var startWordCount:Int = 0
    @Published var targetWordCount:Int = 85000
    @Published var dailyWordCount:Int = 0
}


struct StadiumSearch: View {
    var textColor: String = "000000"
    @EnvironmentObject var serviceManager: ServiceManager
    @EnvironmentObject var viewRouter: ViewRouter
    @State var checkInDate: Date = Date()
    @State var checkInTime: Date = Date()
    @State var city: String = ""
    @State var hours: String = ""
    @Binding var showPreloader: Bool
    @Binding var togglepopup: Bool
    @State var checkOutDate: Date = Calendar.current.startOfDay(for: Calendar.current.date(byAdding: .day, value: 1, to: .now)!)

    @Binding var errorMessage: String
    @State var viewonMap: Bool = false
    @State var chooseOnMap: Bool = false
    @State var cityPopUpMsg: Bool = false
    
    var body: some View{
        
        VStack{
            RoundedRectangle(cornerRadius: 80)
                .foregroundColor(Color("White"))
                .frame(width: UIScreen.main.bounds.width - 50, height: 61, alignment: .center)
                .overlay(
                    HStack{
//                        TextField("Search city, Landmark or Property", text: $city)
                        TextField("City", text: self.$city)
                            .foregroundColor(Color("000000"))
                            .cornerRadius(20)
                            .font(Font.custom("poppins", size: 14))
                            .padding(.leading,10)
                            .userInteractionDisabled()
//                            .opacity(0.4)
                        Image("magnifyglass")
                    }.padding(.horizontal)
                ).onTapGesture{
                    cityPopUpMsg.toggle()
                }
            
            HStack{
                RoundedRectangle(cornerRadius: 80)
                    .frame(height: 40, alignment: .center)
                    .foregroundColor(Color(viewonMap ? "FEBB12" : "White"))
                    .overlay(
                        HStack{
                            Image("Group 3821")
                                .resizable()
                                .frame(width: 15, height: 20, alignment: .center)
                            Text("Around me")
                                .font(Font.custom("poppins", size: 14))
                                .fontWeight(.regular)
                                .foregroundColor(viewonMap ? Color("White") : Color(textColor).opacity(0.5))
                        }.padding(.horizontal)
                    ).onTapGesture{
                        print("retertetter")
                        serviceManager.searchLat = AppUtil.CurrentLocationLatitude
                        serviceManager.searchLong = AppUtil.CurrentLocationLongitude
                        
                        showPreloader = true
                        if hours != "" {
                            serviceManager.HoursCount = Int(hours)
                        } else {
                            serviceManager.HoursCount = 1
                        }
                        
                        serviceManager.checkInDate = AppUtil.getDateInString(checkInDate)
                        serviceManager.checkOutDate = AppUtil.getTimeInString(checkInTime)
                        
                            
                        
                        
                        serviceManager.camps = []
                        UserApiUtil.getServiceByfilter(
                            city: city,
                            categoryId: serviceManager.selectedCategoryId ?? "",
                            rooms: "1",
                            checkIn:  serviceManager.checkInDate ?? "" ,
                            lat: serviceManager.searchLat ?? 34.6844,
                            lng: serviceManager.searchLong ?? 73.0479,
                            checkOut: serviceManager.checkOutDate ?? "",aroundme: 10000000000000000, success: { result in
                                DispatchQueue.main.async {
                                    showPreloader = false
                                    serviceManager.dayCount = AppUtil.numberOfDaysBetween(startDate: checkInDate, endDate: checkInTime)
                                    if serviceManager.dayCount == 0 {
                                        serviceManager.dayCount = 1
                                    }
                                    if result.services?.count ?? 0 > 0 {
                                        serviceManager.camps = result.services!
                                    }
                                    AppUtil.categorieslistt?.categories?.remove(at: 0)
                                    viewRouter.currentPage = "SearchResults"
                                }
                               
                            }, failure: { f in
                                showPreloader = false
                                errorMessage = f
                                togglepopup.toggle()
                            })
                        
//                        viewonMap.toggle()
                    }
                Spacer()
                RoundedRectangle(cornerRadius: 80)
                    .frame(height: 40, alignment: .center)
                    .foregroundColor(Color(chooseOnMap ? "FEBB12" : "White"))
                    .overlay(
                        HStack{
                            Image("Group 3820")
                                .resizable()
                                .frame(width: 15, height: 20, alignment: .center)
                            Text("Choose on map")
                                .font(Font.custom("poppins", size: 14))
                                .fontWeight(.regular)
                                .foregroundColor(chooseOnMap ? Color("White") : Color(textColor).opacity(0.5))
                        }.padding(.horizontal)
                    ).onTapGesture{
                        
                        serviceManager.searchLat = AppUtil.CurrentLocationLatitude
                        serviceManager.searchLong = AppUtil.CurrentLocationLongitude
                        
                        showPreloader = true
//                                        if hours != "" {
//                                            serviceManager.HoursCount = Int(hours)
//                                        } else {
//                                            serviceManager.HoursCount = 1
//                                        }
                        
                        serviceManager.checkInDate = AppUtil.getDateInString(checkInDate)
                        serviceManager.checkOutDate = AppUtil.getDateInString(checkOutDate)
                        
//                      serviceManager.checkIndatee = AppUtil.getDateInString(checkInDate)
//                      serviceManager.checkOutdatee = AppUtil.getTimeInString(checkOutDate)
                        
                        serviceManager.camps = []
                        UserApiUtil.getServiceByfilter(
                            city: city,
                            categoryId: serviceManager.selectedCategoryId ?? "",
                            rooms: "1",
                            checkIn:  serviceManager.checkInDate ?? "" ,
                            lat: serviceManager.searchLat ?? 34.6844,
                            lng: serviceManager.searchLong ?? 73.0479,
                            checkOut: serviceManager.checkOutDate ?? "",aroundme: 10000000000000000, success: { result in
                                DispatchQueue.main.async {
                                    showPreloader = false
                                    serviceManager.dayCount = AppUtil.numberOfDaysBetween(startDate: checkInDate, endDate: checkOutDate)
                                    if serviceManager.dayCount == 0 {
                                        serviceManager.dayCount = 1
                                    }
                                    if result.services?.count ?? 0 > 0 {
                                        serviceManager.camps = result.services!
                                    }
//                                                    AppUtil.categorieslistt?.categories?.remove(at: 0)
                                    
                                    if result.services?.count ?? 0 > 0 {
                                        serviceManager.camps = result.services!
                                    }
                                    print("serviceManager.camps", serviceManager.camps[0].location?.coordinates)
                                    serviceManager.camps = serviceManager.camps
                                    viewRouter.currentPage = "LocationScreen"
                                }
                               
                            }, failure: { f in
                                showPreloader = false
                                errorMessage = f
                                togglepopup.toggle()
                            })

                        chooseOnMap.toggle()
                        
//                        AppUtil.categorieslistt?.categories?.remove(at: 0)
//                                        viewRouter.currentPage = "LocationScreen"
                    }
            }.frame(width: UIScreen.main.bounds.width - 50)
                .padding(.vertical,10)
            VStack{
                SearchDateControl(searchQuery: .constant(""),caption: "Check-In-Date", date: $checkInDate)
                    .padding(.bottom)
                
//                SearchDateControl(searchQuery: .constant(""),caption: "Check-Out-Date", date: $checkOutDate)
//                    .padding(.bottom)
                
                SearchTimeControl(searchQuery: .constant(""),caption: "Check-In-Time",date: checkInTime)
                    .padding(.bottom)
                
                ProfileTextfield(placeHolder: "Hours", textValue: $hours,keyboardType: .numberPad)
            }

            LoginButton(title: "Search", callback: {
                showPreloader = true
                if hours != "" {
                    serviceManager.HoursCount = Int(hours)
                } else {
                    serviceManager.HoursCount = 1
                }
                
                serviceManager.checkInDate = AppUtil.getDateInString(checkInDate)
                serviceManager.checkOutDate = AppUtil.getDateInString(checkInTime)
//                serviceManager.checkOutDate = AppUtil.getTimeInString(checkInTime)
                
                serviceManager.camps = []
                UserApiUtil.getServiceByfilter(
                    city: city,
                    categoryId: serviceManager.selectedCategoryId ?? "",
                    rooms: "1",
                    checkIn:  serviceManager.checkInDate ?? "" ,
                    lat: serviceManager.searchLat ?? 34.6844,
                    lng: serviceManager.searchLong ?? 73.0479,
                    checkOut: serviceManager.checkOutDate ?? "",aroundme: 10000000000000000, success: { result in
                        DispatchQueue.main.async {
                            showPreloader = false
                            serviceManager.dayCount = AppUtil.numberOfDaysBetween(startDate: checkInDate, endDate: checkInTime)
                            if serviceManager.dayCount == 0 {
                                serviceManager.dayCount = 1
                            }
                            if result.services?.count ?? 0 > 0 {
                                serviceManager.camps = result.services!
                            }
                            viewRouter.currentPage = "SearchResults"
                        }
                    }, failure: { f in
                        showPreloader = false
                        errorMessage = f
                        togglepopup.toggle()
                    })
            }).padding(.vertical)
        }
    }
}



struct ChaletSearch: View {
    var textColor: String = "000000"
    @State var city: String = ""
    @State var checkInDate: Date = Date()
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View{
        
        VStack{
//            SearchBar(searchQuery: $city,caption: "City, Landmark or Property")
            
            RoundedRectangle(cornerRadius: 80)
                .foregroundColor(Color("White"))
                .frame(width: UIScreen.main.bounds.width - 50, height: 61, alignment: .center)
                .overlay(
                    HStack{
//                        TextField("Search city, Landmark or Property", text: $city)
                        TextField("City", text: self.$city)
                            .foregroundColor(Color("000000").opacity(0.4))
                            .font(Font.custom("poppins", size: 12))
                            .cornerRadius(20)
                            .padding(.leading,10)
                            .userInteractionDisabled()
                        
                        Image("magnifyglass")
                    }.padding(.horizontal)
                ).onTapGesture{
//                    cityPopUpMsg.toggle()
                }
            
            HStack{
                RoundedRectangle(cornerRadius: 80)
                    .foregroundColor(Color("White"))
                    .frame(height: 40, alignment: .center)
                    .overlay(
                        HStack{
                            Image("Group 3821")
                                .resizable()
                                .frame(width: 15, height: 20, alignment: .center)
                            Text("Around me")
                                .font(Font.custom("poppins", size: 14))
                                .fontWeight(.regular)
                                .foregroundColor(Color(textColor).opacity(0.5))
                        }.padding(.horizontal)
                    ).onTapGesture {
                        print("sdfsdfdf")
                    }
                Spacer()
                RoundedRectangle(cornerRadius: 80)
                    .foregroundColor(Color("White"))
                    .frame(height: 40, alignment: .center)
                    .overlay(
                        HStack{
                            Image("Group 3820")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                            Text("Choose on map")
                                .font(Font.custom("poppins", size: 14))
                                .fontWeight(.regular)
                                .foregroundColor(Color(textColor).opacity(0.5))
                                .lineLimit(1)
                        }.padding(.horizontal)
                    )
                    .onTapGesture{
                        AppUtil.categorieslistt?.categories?.remove(at: 0)
                        viewRouter.currentPage = "LocationScreen"
                    }
            }.frame(width: UIScreen.main.bounds.width - 50)
                .padding(.vertical,10)
            VStack{
                SearchDateControl(searchQuery: .constant(""),caption: "Check-In-Date", date: $checkInDate)
                    .padding(.bottom)
                SearchDateControl(searchQuery: .constant(""),caption: "Check-out-Date", date: .constant(Date()))
                    .padding(.bottom)
            }

            LoginButton(title: "Search", callback: {
                
            }).padding(.vertical)
            
        }
    }
}






//struct SearchArea: View {
//    @EnvironmentObject var viewRouter: ViewRouter
//    @EnvironmentObject var serviceManager: ServiceManager
//    @State var CitySearchLists: [citySearchList] = []
//    @State var showPreloader: Bool = false
//    @State var city: String = ""
//    var textColor: String = "000000"
//    @State var checkIn: String = ""
//    @State var numberOfRooms: String = "1"
//    @State var checkInDate: Date = Date()
//    @State var checkOutDate: Date = Date()
//    @State var types: [Bool] = [true,false,false,false,false,false,false,false,false]
//    @State var selectedType : String = ""
//    @State var togglepopup: Bool = false
//    @State var cityPopUpMsg: Bool = false
//    @State var errorMessage: String = ""
//    @State var viewonMap: Bool = false
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//
//    ]
//
//    @State private var name: String = ""
//
//    let rows = [
//        GridItem(.fixed(50)),
//        GridItem(.fixed(50))
//    ]
//    var body: some View {
//        ZStack{
//            VStack {
//                TopNavigation(titleText: "Search")
//                ScrollView( showsIndicators: false){
//
//                    VStack{
//                        HStack{
//                            ForEach(0 ..< 4, id: \.self) { item in
//                                if types[item] == true {
//                                 categorySearchCardBorder(title: AppUtil.categories?[item].category ?? "")
//                                    .onTapGesture {
//                                        types[item] = false
//                                    }
//                                }else{
//                                  categorySearchCard(title: AppUtil.categories?[item].category ?? "")
//                                    .onTapGesture {
//                                        markAllFalse(index: item)
//                                        types[item] = true
//                                        serviceManager.selectedType = AppUtil.categories?[item].type ?? ""
//                                        serviceManager.selectedCategoryId = AppUtil.categories?[item]._id ?? ""
//                                    }
//                                }
//                            }
//                        }.frame(width: UIScreen.main.bounds.width - 50,height:30)
//
//                        HStack{
//                            ForEach(4 ..< AppUtil.searchtypes.count, id: \.self) { item in
//                                if types[item] == true {
//                                    categorySearchCardBorder(title: AppUtil.categories?[item].category ?? "")
//                                    .onTapGesture {
//                                        types[item] = false
//                                    }
//                                } else {
//                                    categorySearchCard(title: AppUtil.categories?[item].category ?? "")
//                                        .onTapGesture {
//                                            markAllFalse(index: item)
//                                            types[item] = true
//                                            serviceManager.selectedType = AppUtil.categories?[item].type ?? ""
//                                            serviceManager.selectedCategoryId = AppUtil.categories?[item]._id ?? ""
//                                        }
//                                }
//                            }
//                        }.frame(width: UIScreen.main.bounds.width - 50,height:30)
//                    }.padding(.vertical)
////                  SearchBar(searchQuery: $city,caption: "City, Landmark or Property")
//                    if serviceManager.selectedType == "Apartment" || serviceManager.selectedType == "Hotel" {
//                        VStack{
//                            RoundedRectangle(cornerRadius: 80)
//                                .foregroundColor(Color("White"))
//                                .frame(width: UIScreen.main.bounds.width - 50, height: 61, alignment: .center)
//                                .overlay(
//                                    HStack{
//                                        TextField("Search city, Landmark or Property", text: $city)
//                                            .foregroundColor(Color("000000").opacity(0.4))
//                                            .font(Font.custom("poppins", size: 12))
//                                            .padding(.leading,10)
//                                            .userInteractionDisabled()
//
//                                        Image("magnifyglass")
//                                    }.padding(.horizontal)
//                                ).onTapGesture{
//                                    cityPopUpMsg.toggle()
//                                }
//
//
//                            HStack {
//                                RoundedRectangle(cornerRadius: 80)
//                                    .frame(height: 40, alignment: .center)
//                                    .foregroundColor(Color(viewonMap ? "04304B" : "White"))
//                                    .overlay(
//                                        HStack{
//                                            Image("Group 3821")
//                                                .resizable()
//                                                .frame(width: 15, height: 20, alignment: .center)
//                                            Text("Around me")
//                                                .font(Font.custom("poppins", size: 14))
//                                                .fontWeight(.regular)
//                                                .foregroundColor(viewonMap ? Color("White") : Color(textColor).opacity(0.5))
//                                        }.padding(.horizontal)
//                                    ).onTapGesture{
//                                        serviceManager.searchLat = AppUtil.CurrentLocationLatitude
//                                        serviceManager.searchLong = AppUtil.CurrentLocationLongitude
//                                        viewonMap.toggle()
//                                    }
//                                Spacer()
//
//                                RoundedRectangle(cornerRadius: 80)
//                                    .foregroundColor(Color("White"))
//                                    .frame(height: 40, alignment: .center)
//                                    .overlay(
//                                        HStack{
//                                            Image("Group 3820")
//                                                .resizable()
//                                                .frame(width: 20, height: 20, alignment: .center)
//                                            Text("Choose on map")
//                                                .font(Font.custom("poppins", size: 14))
//                                                .fontWeight(.regular)
//                                                .foregroundColor(Color(textColor).opacity(0.5))
//                                                .lineLimit(1)
//                                        }.padding(.horizontal)
//
//                                    ).onTapGesture{
//                                        viewRouter.currentPage = "LocationScreen"
//                                    }
//
//                            }.frame(width: UIScreen.main.bounds.width - 50)
//                                .padding(.vertical,10)
//                            VStack {
//                                SearchDateControl(searchQuery: $checkIn,caption: "Check-In", date: $checkInDate)
//                                    .padding(.bottom)
//                                SearchDateControl(searchQuery: .constant(""),caption: "Check-Out", date: $checkOutDate)
//                                    .padding(.bottom)
//
//                                SearchFields(searchQuery: $numberOfRooms,caption: "Rooms",imageName: "Group 6778")
//                                    .padding(.bottom)
//
//                            }
//
//                            HStack{
//                                RoundedRectangle(cornerRadius: 80)
//                                    .foregroundColor(Color("White"))
//                                    .frame(height: 50, alignment: .center)
//                                    .overlay(
//                                        HStack{
//                                            Image("Group 6779")
//                                                .resizable()
//                                                .frame(width: 20, height: 25, alignment: .center)
//                                                .padding(.leading)
//                                            Spacer()
//                                            TextField("Adults", text: .constant(""))
//                                                .foregroundColor(Color("000000").opacity(0.4))
//                                                .font(Font.custom("poppins", size: 12))
//                                                .padding(.leading,10)
//                                                .keyboardType(.numberPad)
//                                        }.padding(.horizontal)
//                                    )
//                                Spacer()
//                                RoundedRectangle(cornerRadius: 80)
//                                    .foregroundColor(Color("White"))
//                                    .frame(height: 50, alignment: .center)
//                                    .overlay(
//                                        HStack{
//                                            Image("Group 6780")
//                                                .resizable()
//                                                .frame(width: 20, height: 20, alignment: .center)
//                                                .padding(.leading)
//                                            Spacer()
//                                            TextField("Children", text: .constant(""))
//                                                .foregroundColor(Color("000000").opacity(0.4))
//                                                .font(Font.custom("poppins", size: 12))
//                                                .padding(.leading,10)
//                                                .keyboardType(.numberPad)
//                                        }.padding(.horizontal)
//                                    )
//                            }.frame(width: UIScreen.main.bounds.width - 50)
//
//
//                            if  (serviceManager.searchQuery ?? "") != "" {
//                                HStack{
//                                    Text("You are Searching in the area of " + (serviceManager.searchQuery ?? "") )
//                                        .font(Font.custom("poppins", size: 14))
//                                        .fontWeight(.regular)
//                                        .foregroundColor(Color(textColor).opacity(0.5))
//
//                                    Image(systemName: "xmark.circle.fill")
//                                        .foregroundColor(Color.red)
//                                        .onTapGesture{
//                                            serviceManager.searchLat = 34.6844
//                                            serviceManager.searchLong = 73.0479
//                                            serviceManager.searchQuery = ""
//                                        }
//
//                                }.padding(10)
//
//                            }
//
//
//                            LoginButton(title: "Search", callback: {
//                                showPreloader = true
////                                $serviceManager.serviceLocations = city
//                                serviceManager.checkInDate = AppUtil.getDateInString(checkInDate)
//                                serviceManager.checkOutDate = AppUtil.getDateInString(checkOutDate)
//                                serviceManager.roomsRequired = numberOfRooms
//                                serviceManager.camps = []
//                                UserApiUtil.getServiceByfilter(
////                                    AppUtil.addserviceObject?.address?.area ?? ""
//                                    city: city,
//                                    categoryId: serviceManager.selectedCategoryId ?? "",
//                                    rooms: numberOfRooms,
//                                    checkIn:  serviceManager.checkInDate ?? "" ,
//                                    lat: serviceManager.searchLat ?? 34.6844,
//                                    lng: serviceManager.searchLong ?? 73.0479,
//                                    checkOut: serviceManager.checkOutDate ?? "",aroundme: 10000000000000000, success: { result in
//                                        DispatchQueue.main.async {
//                                            serviceManager.dayCount = AppUtil.numberOfDaysBetween(startDate: checkInDate, endDate: checkOutDate)
//                                            if serviceManager.dayCount == 0 {
//                                                serviceManager.dayCount = 1
//                                            }
//                                            if result.services?.count ?? 0 > 0 {
//                                                serviceManager.camps = result.services!
//                                            }
//
//                                               viewRouter.currentPage = "SearchResults"
//                                        }
//
//                                    }, failure: { f in
//                                        errorMessage = f
//                                        showPreloader = false
//                                        togglepopup.toggle()
//
//                                    })
//                            }).padding(.vertical)
//                        }
//                    }
//                    else if serviceManager.selectedType == "Stadium" {
//                        StadiumSearch(showPreloader: $showPreloader, togglepopup: $togglepopup, errorMessage: $errorMessage )
//                    }
//
//                    else {
//                        VStack{
//                            RoundedRectangle(cornerRadius: 80)
//                                .foregroundColor(Color("White"))
//                                .frame(width: UIScreen.main.bounds.width - 50, height: 61, alignment: .center)
//                                .overlay(
//                                    HStack{
//
//                                        TextField("Search city, Landmark or Property", text: $city)
//                                            .foregroundColor(Color("000000").opacity(0.4))
//                                            .font(Font.custom("poppins", size: 12))
//                                            .padding(.leading,10)
//                                            .userInteractionDisabled()
//
//                                        Image("magnifyglass")
//                                    }.padding(.horizontal)
//                                ).onTapGesture {
//                                    cityPopUpMsg.toggle()
//                                }
//
//
//                            HStack{
//
//                                RoundedRectangle(cornerRadius: 80)
//                                    .frame(height: 40, alignment: .center)
//                                    .foregroundColor(Color(viewonMap ? "04304B" : "White"))
//                                    .overlay(
//                                        HStack{
//                                            Image("Group 3821")
//                                                .resizable()
//                                                .frame(width: 15, height: 20, alignment: .center)
//                                            Text("Around me")
//                                                .font(Font.custom("poppins", size: 14))
//                                                .fontWeight(.regular)
//                                                .foregroundColor(viewonMap ? Color("White") : Color(textColor).opacity(0.5))
//                                        }.padding(.horizontal)
//                                    ).onTapGesture{
//                                        serviceManager.searchLat = AppUtil.CurrentLocationLatitude
//                                        serviceManager.searchLong = AppUtil.CurrentLocationLongitude
//                                        viewonMap.toggle()
//                                    }
//
//                                Spacer()
//
//                                RoundedRectangle(cornerRadius: 80)
//                                    .foregroundColor(/* serviceManager.searchLat ?? 0.0 != 0.0 ? Color("FEBB12") : */ Color("White"))
//                                    .frame(height: 40, alignment: .center)
//                                    .overlay(
//                                        HStack{
//                                            Image("Group 3820")
//                                                .resizable()
//                                                .frame(width: 20, height: 20, alignment: .center)
//                                            Text("Choose on map")
//                                                .font(Font.custom("poppins", size: 14))
//                                                .fontWeight(.regular)
//                                                .foregroundColor(Color(textColor).opacity(0.5))
//                                                .lineLimit(1)
//                                        }.padding(.horizontal)
//                                    )
//                                    .onTapGesture{
//                                        viewRouter.currentPage = "LocationScreen"
//                                    }
//                            }.frame(width: UIScreen.main.bounds.width - 50)
//                                .padding(.vertical,10)
//
//                            VStack {
//                                SearchDateControl(searchQuery: .constant(""),caption: "Check-In-Date",date: $checkInDate)
//                                    .padding(.bottom)
//                                SearchDateControl(searchQuery: .constant(""),caption: "Check-out-Date",date: $checkOutDate)
//                                    .padding(.bottom)
//                                }
//
//                            if (serviceManager.searchQuery ?? "") != "" {
//                                HStack{
//                                    Text("You are Searching in the area of " + (serviceManager.searchQuery ?? "") )
//                                        .font(Font.custom("poppins", size: 14))
//                                        .fontWeight(.regular)
//                                        .foregroundColor(Color(textColor).opacity(0.5))
//
//                                    Image(systemName: "xmark.circle.fill")
//                                        .foregroundColor(Color.red)
//                                        .onTapGesture{
//                                            serviceManager.searchLat = 34.6844
//                                            serviceManager.searchLong = 73.0479
//                                            serviceManager.searchQuery = ""
//                                        }
//
//                                }.padding(10)
//                            }
//
//                            LoginButton(title: "Search", callback: {
//                                serviceManager.checkInDate = AppUtil.getBookingDate(checkInDate)
//                                serviceManager.checkOutDate = AppUtil.getBookingDate(checkOutDate)
//                                showPreloader = true
//                                serviceManager.camps = []
//                                UserApiUtil.getServiceByfilter(
//                                    city: city,
//                                    categoryId: serviceManager.selectedCategoryId ?? "",
//                                    rooms: numberOfRooms,
//                                    checkIn:  serviceManager.checkInDate ?? "" ,
//                                    lat: serviceManager.searchLat ?? 34.6844 ,
//                                    lng: serviceManager.searchLong ?? 73.0479 ,
//                                    checkOut: serviceManager.checkOutDate ?? "",
//                                    aroundme: viewonMap ? AppUtil.appSettings.distance?.maxDistance ?? 10000000 : 10000000,
//                                    success: { result in
//                                        DispatchQueue.main.async {
//                                            serviceManager.dayCount = AppUtil.numberOfDaysBetween(startDate: checkInDate, endDate: checkOutDate)
//                                            if serviceManager.dayCount == 0 {
//                                                serviceManager.dayCount = 1
//                                            }
//                                            if result.services?.count ?? 0 > 0 {
//                                                serviceManager.camps = result.services!
//                                            }
//                                            showPreloader = false
//                                            viewRouter.currentPage = "SearchResults"
//                                        }
//                                    }, failure: { _ in
//                                        showPreloader = false
//                                })
//
//                            }).padding(.vertical)
//
//                        }
//                    }
//                }
//            }
//
//
//            if togglepopup {
//                ZStack{
//
//                    VStack {}
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .background(Color("000000"))
//                        .edgesIgnoringSafeArea(.all)
//                        .opacity(0.6)
//
//                    RoundedRectangle(cornerRadius: 25)
//                        .frame(width: UIScreen.main.bounds.width - 50, height: 330, alignment: .center)
//                        .foregroundColor(Color("White"))
//                        .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
//                        .overlay(
//                            VStack{
//                                VStack{
//                                    Image("informationIcon")
//                                        .scaledToFit()
//                                }
//                                .frame(width: 108, height: 110, alignment: .center)
//                                .padding(.top)
//
//                                Text("Error?")
//                                    .foregroundColor(Color("000000"))
//                                    .font(Font.custom("poppins", size: 20))
//                                    .fontWeight(.bold)
//
//                                Text(errorMessage)
//                                    .foregroundColor(Color("000000").opacity(0.7))
//                                    .font(Font.custom("poppins", size: 12))
//                                    .fontWeight(.regular)
//                                    .padding(.top,1)
//
//                                HStack{
//                                    ZStack{
//                                        RoundedRectangle(cornerRadius: 70)
//                                            .foregroundColor(Color("White"))
//
//                                        RoundedRectangle(cornerRadius: 70)
//                                            .stroke(Color("707070"),lineWidth: 1)
//                                            .overlay(
//                                                    Text("OK")
//                                                        .foregroundColor(Color("000000").opacity(0.4))
//                                                        .font(Font.custom("poppins", size: 18))
//                                                        .fontWeight(.regular)
//                                            )
//
//                                    }.frame(width: 120, height: 35, alignment: .center)
//                                        .onTapGesture{
//                                            togglepopup.toggle()
//                                        }
//                                }
//                                .frame(width: UIScreen.main.bounds.width - 70)
//                                .padding(.vertical)
//                            }
//                        )
//                   }
//               }
//
//
//            if cityPopUpMsg {
//                    ZStack {
//                        VStack {
//                            HStack {
//                                Text("Select City")
//                                    .foregroundColor(Color("04304B"))
//                                    .font(Font.custom("poppins", size: 20))
//                                    .fontWeight(.medium)
//                                    .padding(.top, 20)
//                                    .padding(.leading, 30)
//                                    .padding(.trailing, 190)
////                                    .padding(.bottom, 10)
//                                    .multilineTextAlignment(.center)
//
//                                 Image("Cross_new")
//                                    .padding(.top, 20)
//                                    .onTapGesture{
//                                        cityPopUpMsg.toggle()
//                                    }
//                                Spacer()
//                            }.padding(.horizontal,5)
//                                .padding(.bottom, 5)
//
//                            Divider()
//                                .padding(.vertical)
//
//                            ScrollView(showsIndicators:false) {
//                                VStack{
//                                    if CitySearchLists.count > 0 {
//                                        ForEach(0 ..< CitySearchLists.count,id:\.self) { ind in
//                                            CitySearchList(
//                                                title: CitySearchLists[ind].name ?? "")
//                                            .onTapGesture {
////                                                viewRouter.currentPage = "ServiceBookingDetail"
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                            .navigationBarHidden(true)
//                        }
//                    }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-350, alignment: .center)
//                         .ignoresSafeArea(.all)
//                         .background(Color("FFFFFF"))
//                         .foregroundColor(Color("FFFFFF"))
//                         .cornerRadius(20)
//                         .padding(.top, 300)
//                         .onAppear(perform: {
//                            VendorApiUtil.citySerachList(success: { res in
//                                CitySearchLists = res
//                                print("City list api success")
//                            }, failure: { _ in
//                                print("City list api issue")
//                            })
//                        })
//                   }
//
//
//            if showPreloader {
//                VStack {}
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background(Color("707070"))
//                .edgesIgnoringSafeArea(.all)
//                .opacity(0.6)
//
//                ProgressView()
//                    .progressViewStyle(CircularProgressViewStyle(tint: Color("FEBB12")))
//                    .scaleEffect(x: 4, y: 4, anchor: .center)
//            }
//
//        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
//            .ignoresSafeArea(.all)
//            .background(Color("F2F5F9"))
//            .onAppear(perform: {
//                markAllFalse(index:  serviceManager.selectedIndex ?? 0)
//            })
//
//    }
//
//    func markAllFalse (index: Int) {
//        for i in 0 ..< types.count {
//            if i != index {
//                types[i] = false
//            } else {
//                types[i] = true
//                serviceManager.selectedType = AppUtil.categories?[i].type ?? ""
//                serviceManager.selectedCategoryId = AppUtil.categories?[i]._id ?? ""
//            }
//        }
//    }
//}
//
//struct SearchArea_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchArea()
//        //StadiumSearch()
//    }
//}
//
//struct StadiumSearch: View {
//    var textColor: String = "000000"
//    @EnvironmentObject var serviceManager: ServiceManager
//    @EnvironmentObject var viewRouter: ViewRouter
//    @State var checkInDate: Date = Date()
//    @State var checkInTime: Date = Date()
//    @State var city: String = ""
//    @State var hours: String = ""
//    @Binding var showPreloader: Bool
//    @Binding var togglepopup: Bool
//    @Binding var errorMessage: String
//    @State var viewonMap: Bool = false
//    @State var cityPopUpMsg: Bool = false
//    var body: some View{
//
//        VStack{
//            RoundedRectangle(cornerRadius: 80)
//                .foregroundColor(Color("White"))
//                .frame(width: UIScreen.main.bounds.width - 50, height: 61, alignment: .center)
//                .overlay(
//                    HStack{
//                        TextField("Search city, Landmark or Property", text: $city)
//                            .foregroundColor(Color("000000").opacity(0.4))
//                            .font(Font.custom("poppins", size: 12))
//                            .padding(.leading,10)
//                            .userInteractionDisabled()
//
//                        Image("magnifyglass")
//                    }.padding(.horizontal)
//                ).onTapGesture{
//                    cityPopUpMsg.toggle()
//                }
//
//            HStack{
//                RoundedRectangle(cornerRadius: 80)
//                    .frame(height: 40, alignment: .center)
//                    .foregroundColor(Color(viewonMap ? "04304B" : "White"))
//                    .overlay(
//                        HStack{
//                            Image("Group 3821")
//                                .resizable()
//                                .frame(width: 15, height: 20, alignment: .center)
//                            Text("Around me")
//                                .font(Font.custom("poppins", size: 14))
//                                .fontWeight(.regular)
//                                .foregroundColor(viewonMap ? Color("White") : Color(textColor).opacity(0.5))
//                        }.padding(.horizontal)
//                    ).onTapGesture{
//                        serviceManager.searchLat = AppUtil.CurrentLocationLatitude
//                        serviceManager.searchLong = AppUtil.CurrentLocationLongitude
//                        viewonMap.toggle()
//                    }
//                Spacer()
//                RoundedRectangle(cornerRadius: 80)
//                    .foregroundColor(Color("White"))
//                    .frame(height: 40, alignment: .center)
//                    .overlay(
//                        HStack{
//                            Image("Group 3820")
//                                .resizable()
//                                .frame(width: 20, height: 20, alignment: .center)
//                            Text("Choose on map")
//                                .font(Font.custom("poppins", size: 14))
//                                .fontWeight(.regular)
//                                .foregroundColor(Color(textColor).opacity(0.5))
//                                .lineLimit(1)
//                        }.padding(.horizontal)
//                    )
//                    .onTapGesture{
//                        viewRouter.currentPage = "LocationScreen"
//                    }
//            }.frame(width: UIScreen.main.bounds.width - 50)
//                .padding(.vertical,10)
//            VStack{
//                SearchDateControl(searchQuery: .constant(""),caption: "Check-In-Date", date: $checkInDate)
//                    .padding(.bottom)
//
//
//                SearchTimeControl(searchQuery: .constant(""),caption: "Check-In-Time",date: checkInTime)
//                    .padding(.bottom)
//
//                ProfileTextfield(placeHolder: "Hours", textValue: $hours,keyboardType: .numberPad)
//            }
//
//            LoginButton(title: "Search", callback: {
//                showPreloader = true
//                if hours != "" {
//                    serviceManager.HoursCount = Int(hours)
//                } else {
//                    serviceManager.HoursCount = 1
//                }
//
//                serviceManager.checkInDate = AppUtil.getDateInString(checkInDate)
//                serviceManager.checkOutDate = AppUtil.getTimeInString(checkInTime)
//
//                serviceManager.camps = []
//                UserApiUtil.getServiceByfilter(
//                    city: city,
//                    categoryId: serviceManager.selectedCategoryId ?? "",
//                    rooms: "1",
//                    checkIn:  serviceManager.checkInDate ?? "" ,
//                    lat: serviceManager.searchLat ?? 34.6844,
//                    lng: serviceManager.searchLong ?? 73.0479,
//                    checkOut: serviceManager.checkOutDate ?? "",aroundme: 10000000000000000, success: { result in
//                        DispatchQueue.main.async {
//                            showPreloader = false
//                            serviceManager.dayCount = AppUtil.numberOfDaysBetween(startDate: checkInDate, endDate: checkInTime)
//                            if serviceManager.dayCount == 0 {
//                                serviceManager.dayCount = 1
//                            }
//                            if result.services?.count ?? 0 > 0 {
//                                serviceManager.camps = result.services!
//                            }
//                            viewRouter.currentPage = "SearchResults"
//                        }
//
//                    }, failure: { f in
//                        showPreloader = false
//                        errorMessage = f
//                        togglepopup.toggle()
//                    })
//
//
//
//            }).padding(.vertical)
//
//        }
//
//    }
//}
//
//struct ChaletSearch: View {
//    var textColor: String = "000000"
//    @State var city: String = ""
//    @State var checkInDate: Date = Date()
//    @EnvironmentObject var viewRouter: ViewRouter
//    var body: some View{
//
//        VStack{
////            SearchBar(searchQuery: $city,caption: "City, Landmark or Property")
//
//            RoundedRectangle(cornerRadius: 80)
//                .foregroundColor(Color("White"))
//                .frame(width: UIScreen.main.bounds.width - 50, height: 61, alignment: .center)
//                .overlay(
//                    HStack{
//                        TextField("Search city, Landmark or Property", text: $city)
//                            .foregroundColor(Color("000000").opacity(0.4))
//                            .font(Font.custom("poppins", size: 12))
//                            .padding(.leading,10)
//                            .userInteractionDisabled()
//
//                        Image("magnifyglass")
//                    }.padding(.horizontal)
//                ).onTapGesture{
////                    cityPopUpMsg.toggle()
//                }
//
//            HStack{
//                RoundedRectangle(cornerRadius: 80)
//                    .foregroundColor(Color("White"))
//                    .frame(height: 40, alignment: .center)
//                    .overlay(
//                        HStack{
//                            Image("Group 3821")
//                                .resizable()
//                                .frame(width: 15, height: 20, alignment: .center)
//                            Text("Around me")
//                                .font(Font.custom("poppins", size: 14))
//                                .fontWeight(.regular)
//                                .foregroundColor(Color(textColor).opacity(0.5))
//                        }.padding(.horizontal)
//                    )
//                Spacer()
//                RoundedRectangle(cornerRadius: 80)
//                    .foregroundColor(Color("White"))
//                    .frame(height: 40, alignment: .center)
//                    .overlay(
//                        HStack{
//                            Image("Group 3820")
//                                .resizable()
//                                .frame(width: 20, height: 20, alignment: .center)
//                            Text("Choose on map")
//                                .font(Font.custom("poppins", size: 14))
//                                .fontWeight(.regular)
//                                .foregroundColor(Color(textColor).opacity(0.5))
//                                .lineLimit(1)
//                        }.padding(.horizontal)
//                    )
//                    .onTapGesture{
//                        viewRouter.currentPage = "LocationScreen"
//                    }
//            }.frame(width: UIScreen.main.bounds.width - 50)
//                .padding(.vertical,10)
//            VStack{
//                SearchDateControl(searchQuery: .constant(""),caption: "Check-In-Date", date: $checkInDate)
//                    .padding(.bottom)
//                SearchDateControl(searchQuery: .constant(""),caption: "Check-out-Date", date: .constant(Date()))
//                    .padding(.bottom)
//
//            }
//
//
//
//
//            LoginButton(title: "Search", callback: {
//
//            }).padding(.vertical)
//
//        }
//    }
//}
//
//
