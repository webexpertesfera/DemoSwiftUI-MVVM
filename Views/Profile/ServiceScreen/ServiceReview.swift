//
//  ServiceReview.swift
//  SmartBookings
//
//  Created by Sheheryar on 13/08/2022.
//

import SwiftUI

struct ServiceReview: View {
    var textColor: String = "000000"
    var textColor2: String = "AAAAAA"
    var textColor3: String = "393F45"
    var buttonbg: String = "FEBB12"
    @State var selectedTab = "Overview"
    @State var headings: [String] = ["Overview","Description","Reviews","Terms","Map"]
    @State var check: [Bool] = [false,false,false,false,false]
    @State var showPreloader: Bool = false
    var ameneties: [String] = ["wifi","tv","coffee","Steam Bath","Indoor Swimming Pool","Outdoor Swimming Pool","Swimming Pool Heater","parking","Gym","Billiard","Tennis Court","playground","24 Hours Access","Wheelchair Access","Private Entrance","Doorman","Air Hockey","Soccer Field","Vollyball","Trampoline","Camps","Hot Tub" ,"Air Slider","Sand Games","Water Games","Air Conditioning","Elevator","Stage","Speakers","LaserLights","Hairstylist", "SPA", "swimming With Water Games","SaftyBox"]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    var body: some View {
        ZStack{
            VStack{
                //  ScrollView{
                VStack{
                    ZStack{
                        
                        if serviceManager.selectedService?.description?.images.count ?? 0 > 0 {
                            let images = serviceManager.selectedService?.description?.images
                            GeometryReader { geometry in
                                ImageCarouselView(numberOfImages: images!.count) {
                                    
                                    ForEach(0 ..< images!.count,id:\.self) { item in
                                        AsyncImage(url: URL(string: serviceManager.selectedService?.description?.images[item] ?? "")) { image in
                                            image.resizable()
                                        } placeholder: {
                                            Image("No_Image")
                                                .resizable()
                                                .cornerRadius(5)
                                        }
                                            .scaledToFill()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .clipped()
                                    }
                                }
                            }
                        } else {
                            GeometryReader { geometry in
                                ImageCarouselView(numberOfImages: 3) {
                                    Image("Group 5710")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width, height: geometry.size.height)
                                        .clipped()
                                    Image("Group 5710")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width, height: geometry.size.height)
                                        .clipped()
                                    Image("Group 5710")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width, height: geometry.size.height)
                                        .clipped()
                                }
                            }
                        }
                        
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
                                Circle()
                                    .frame(width: 47, height: 47, alignment: .center)
                                    .foregroundColor(Color("White"))
                                    .overlay(
                                        Image("shareIcon")
                                            .resizable()
                                            .frame(width: 24, height: 25, alignment: .center)
                                    )
//                                Circle()
//                                    .frame(width: 47, height: 47, alignment: .center)
//                                    .foregroundColor(Color("White"))
//                                    .overlay(
//                                        Image("Vectorheart")
//                                            .resizable()
//                                            .frame(width: 24, height: 21, alignment: .center)
//                                    )
                            }
                            .padding(.top,AppUtil.getNotch() == true ? 50 : 30)
                            .padding(.horizontal)
                            Spacer()
                        }
                    }
                }.frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
                    .background(RoundedCorners(color: Color(""), tl: 0, tr: 0, bl: 15, br: 15))
                    .ignoresSafeArea()
                
                VStack{
                    
                    HStack{
                        
                        ForEach(0 ..< headings.count,id:\.self) { index in
                            Spacer()
                            if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                                if language == "ar" {
                                    if check[index] == true {
                                        RoundedRectangle(cornerRadius: 45)
                                            .frame(width: 86, height: 34, alignment: .center)
                                            .foregroundColor(Color("FEBB12"))
                                            .overlay(
                                                Text((headings[index]).localized("ar"))
                                                    .font(Font.custom("poppins", size: 11))
                                                    .foregroundColor(Color(textColor))
                                                    .fontWeight(.regular)
                                                
                                                
                                            )
                                            .padding(.horizontal,5)
                                        
                                    } else {
                                        Text((headings[index]).localized("ar"))
                                            .font(Font.custom("poppins", size: 11))
                                            .foregroundColor(Color(textColor).opacity(0.5))
                                            .fontWeight(.regular)
                                            .padding(.horizontal,5)
                                            .onTapGesture {
                                                check[index] = true
                                                markAllFalse(index: index)
                                                selectedTab = headings[index]
                                            }
                                    }
                                }
                                else {
                                    if check[index] == true {
                                        RoundedRectangle(cornerRadius: 45)
                                            .frame(width: 86, height: 34, alignment: .center)
                                            .foregroundColor(Color("FEBB12"))
                                            .overlay(
                                                Text(headings[index])
                                                    .font(Font.custom("poppins", size: 11))
                                                    .foregroundColor(Color(textColor))
                                                    .fontWeight(.regular)
                                                
                                                
                                            )
                                            .padding(.horizontal,5)
                                        
                                    } else {
                                        Text(headings[index])
                                            .font(Font.custom("poppins", size: 11))
                                            .foregroundColor(Color(textColor).opacity(0.5))
                                            .fontWeight(.regular)
                                            .padding(.horizontal,5)
                                            .onTapGesture{
                                                check[index] = true
                                                markAllFalse(index: index)
                                                selectedTab = headings[index]
                                            }
                                        
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                    .padding(.vertical,10)

                    VStack{
                        ScrollView(showsIndicators:false) {
                            if selectedTab == "Overview" {
                                VStack{
                                    HStack{
                                        VStack{
                                            HStack {
                                                Text(serviceManager.selectedService?.description?.nameInEnglish ?? "")
                                                    .font(Font.custom("poppins", size: 20))
                                                    .foregroundColor(Color(textColor))
                                                    .fontWeight(.regular)
                                                Spacer()
                                            }.padding(.bottom,-5)

                                            HStack {
                                                Text(serviceManager.selectedService?.description?.descriptionInEnglish ?? "")
                                                    .font(Font.custom("poppins", size: 12))
                                                    .foregroundColor(Color(textColor).opacity(0.6))
//                                                    .padding(.top, 5)
                                                Spacer()
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 45)
                                            .frame(width: 115, height: 35, alignment: .center)
                                            .foregroundColor(Color(buttonbg))
                                            .overlay(
                                                Text("Vendor Profile")
                                                    .font(Font.custom("poppins", size: 11))
                                                    .foregroundColor(Color(textColor))
                                                    .fontWeight(.regular)
                                            ).onTapGesture {
                                                UserApiUtil.getVendorProfile(id: serviceManager.selectedService?.vender ?? "", success: { res in
                                                    AppUtil.selectedVendor = res
                                                    AppUtil.reviews = serviceManager.selectedService?.reviews ?? []
                                                    viewRouter.currentPage = "VendorProfile"
                                                }, failure: { _ in
                                                    
                                                })
                                                
                                            }
                                        
                                    }.padding(.horizontal)
                                    
//                                    HStack {
//                                        Spacer()
//                                        VStack{
//                                            Image("rooms")
//                                                .scaledToFit()
//
//                                            HStack{
//                                                Text(String(serviceManager.selectedService?.unitsAndGuest?.doubleBed ?? 0) )
//                                                    .font(Font.custom("poppins", size: 8))
//                                                    .foregroundColor(Color(textColor).opacity(0.5))
//                                                    .fontWeight(.regular)
//
//                                                Text(" Rooms")
//                                                    .font(Font.custom("poppins", size: 8))
//                                                    .foregroundColor(Color(textColor).opacity(0.5))
//                                                    .fontWeight(.regular)
//                                            }
//
//                                        }
//                                        Spacer()
//                                        VStack{
//                                            Image("bathrooms")
//                                                .scaledToFit()
//                                            HStack{
//                                                Text(String(serviceManager.selectedService?.unitsAndGuest?.bathrooms ?? 0))
//                                                    .font(Font.custom("poppins", size: 8))
//                                                    .foregroundColor(Color(textColor).opacity(0.5))
//                                                    .fontWeight(.regular)
//
//                                                Text(" Bathrooms")
//                                                    .font(Font.custom("poppins", size: 8))
//                                                    .foregroundColor(Color(textColor).opacity(0.5))
//                                                    .fontWeight(.regular)
//                                            }
//
//
//                                        }
//                                        Spacer()
////                                        VStack{
////                                            Image("house")
////                                                .resizable()
////                                                .frame(width: 30, height: 28, alignment: .center)
////                                            Text("Hotel")
////                                                .font(Font.custom("poppins", size: 8))
////                                                .foregroundColor(Color(textColor).opacity(0.5))
////                                                .fontWeight(.regular)
////
////                                        }
////                                        Spacer()
//                                        VStack{
//                                            Image("singlebd")
//                                                .resizable()
//                                                .frame(width: 30, height: 30, alignment: .center)
//
//                                            HStack{
//                                                Text(String(serviceManager.selectedService?.unitsAndGuest?.singleBed ?? 0))
//                                                    .font(Font.custom("poppins", size: 8))
//                                                    .foregroundColor(Color(textColor).opacity(0.5))
//                                                    .fontWeight(.regular)
//
//                                                Text("Single Bed")
//                                                   .font(Font.custom("poppins", size: 8))
//                                                   .foregroundColor(Color(textColor).opacity(0.5))
//                                                   .fontWeight(.regular)
//                                            }
//                                        }
//                                        Spacer()
//                                    }
//                                    .padding(.vertical,20)
                                    
                                    HStack {
                                        Spacer()
                                        VStack{
                                            Image("Locationpin")
                                                .resizable()
                                                .frame(width: 22, height: 29, alignment: .center)
                                            Text(serviceManager.selectedService?.address?.address ?? "")
                                                .font(Font.custom("poppins", size: 13))
                                                .foregroundColor(Color(textColor).opacity(0.6))
                                                .fontWeight(.regular)
                                            
                                            }
                                        Spacer()
                                        
                                        VStack{
                                            Image("SqFitSize")
                                                .resizable()
                                                .frame(width: 22, height: 29, alignment: .center)
                                            Text(String(serviceManager.selectedService?.description?.areaSqm ?? 0))
                                                .font(Font.custom("poppins", size: 13))
                                                .foregroundColor(Color(textColor).opacity(0.6))
                                                .fontWeight(.regular)
                                          }
                                        
                                        Spacer()
                                        VStack{
                                            Image("FamilyIcon")
                                                .resizable()
                                                .frame(width: 22, height: 29, alignment: .center)
                                            Text("Family and single")
                                                .font(Font.custom("poppins", size: 13))
                                                .foregroundColor(Color(textColor).opacity(0.6))
                                                .fontWeight(.regular)
                                        }
                                        Spacer()
                                        VStack {
                                            Image("WebSite")
                                                .resizable()
                                                .frame(width: 22, height: 29, alignment: .center)
                                            Text("www.lorem.com")
                                                .font(Font.custom("poppins", size: 13))
                                                .foregroundColor(Color(textColor).opacity(0.6))
                                                .fontWeight(.regular)
                                        }
                                        Spacer()
                                    }
                                    .padding(.vertical,20)

                                    HStack{
                                        Text("Facilities")
                                            .font(Font.custom("poppins", size: 18))
                                            .foregroundColor(Color(textColor))
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                    }.padding(.horizontal)
                                        .padding(.vertical)
                                   
                                    LazyVGrid(columns: columns, spacing: 5){
                                        ForEach(0 ..< ameneties.count , id: \.self) { item in
                                            Group {
                                                if ameneties[item] == "Water Games" && ((serviceManager.selectedService?.leisure?.waterGames) != nil && serviceManager.selectedService?.leisure?.waterGames != false) {
                                                    FacilitiesCard(imageName: "Water_games", facilityName: "Water Games", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "Air Conditioning" && ((serviceManager.selectedService?.leisure?.airConditioning) != nil && serviceManager.selectedService?.leisure?.airConditioning != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "Air Conditioning", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "Air Slider" && ((serviceManager.selectedService?.leisure?.airSlider) != nil && serviceManager.selectedService?.leisure?.airSlider != false) {
                                                    FacilitiesCard(imageName: "wifi", facilityName: "Air Slider", callback: {

                                                    })
                                                }
                                                
                                                if ameneties[item] == "Sand Games" && ((serviceManager.selectedService?.leisure?.sandGames) != nil && serviceManager.selectedService?.leisure?.sandGames != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "Sand Games", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "wifi" && ((serviceManager.selectedService?.leisure?.wifi) != nil && serviceManager.selectedService?.leisure?.wifi != false) {
                                                    FacilitiesCard(imageName: "wifi", facilityName: "Wifi", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "tv" && ((serviceManager.selectedService?.leisure?.tv) != nil && serviceManager.selectedService?.leisure?.tv != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "TV", callback: {
                                                        
                                                    })
                                                }
                                               /*
                                                if ameneties[item] == "Gym" && ((serviceManager.selectedService?.leisure?.gym) != nil && serviceManager.selectedService?.leisure?.gym != false) {
                                                    FacilitiesCard(imageName: "billboardGray", facilityName: "Gym", callback: {
                                                        
                                                    })
                                                }
                                                */
                                                if ameneties[item] == "coffee" && ((serviceManager.selectedService?.kitchen?.coffeeMachine) != nil && serviceManager.selectedService?.kitchen?.coffeeMachine != false) {
                                                    FacilitiesCard(imageName: "Cup", facilityName: "Coffee", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "parking" && ((serviceManager.selectedService?.leisure?.parking) != nil  && serviceManager.selectedService?.leisure?.parking != false)
                                                   {
                                                    
                                                    FacilitiesCard(imageName: "Parking_new", facilityName: "Parking", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Billiard" && ((serviceManager.selectedService?.leisure?.billard) != nil && serviceManager.selectedService?.leisure?.billard != false) {
                                                    
                                                    FacilitiesCard(imageName: "billboardGray", facilityName: "Billiard", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Steam Bath" && ((serviceManager.selectedService?.leisure?.steamBath) != nil && serviceManager.selectedService?.leisure?.steamBath != false) {
                                                    FacilitiesCard(imageName: "steambath", facilityName: "Steam Bath", callback: {
                                                        
                                                    })
                                                }
                                            }
                                            
                                            Group{
                                                
                                                if ameneties[item] == "swimming With Water Games" && ((serviceManager.selectedService?.leisure?.swimmingWithWaterGames) != nil && serviceManager.selectedService?.leisure?.swimmingWithWaterGames != false) {
                                                    FacilitiesCard(imageName: "Water_games", facilityName: "swimming With Water Games", callback: {

                                                    })
                                                }
                                                /*
                                                if ameneties[item] == "Gym" && ((serviceManager.selectedService?.leisure?.gym) != nil && serviceManager.selectedService?.leisure?.gym != false) {
                                                    FacilitiesCard(imageName: "billboardGray", facilityName: "Gym", callback: {
                                                        
                                                    })
                                                }
                                                */
                                                if ameneties[item] == "SaftyBox" && ((serviceManager.selectedService?.leisure?.saftyBox) != nil && serviceManager.selectedService?.leisure?.saftyBox != false) {
                                                    FacilitiesCard(imageName: "safety-box", facilityName: "SaftyBox", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "Hairstylist" && ((serviceManager.selectedService?.leisure?.hairStylist) != nil && serviceManager.selectedService?.leisure?.hairStylist != false) {
                                                    FacilitiesCard(imageName: "wifi", facilityName: "Hairstylist", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "SPA" && ((serviceManager.selectedService?.leisure?.spa) != nil && serviceManager.selectedService?.leisure?.spa != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "SPA", callback: {

                                                    })
                                                }

                                                if ameneties[item] == "Tennis Court" && ((serviceManager.selectedService?.leisure?.tennisCourt) != false && serviceManager.selectedService?.leisure?.tennisCourt != nil ) {
                                                    
                                                    FacilitiesCard(imageName: "tennisGray", facilityName: "Tennis Court", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "playground" && ((serviceManager.selectedService?.leisure?.playground) != false && serviceManager.selectedService?.leisure?.playground != nil) {
                                                    FacilitiesCard(imageName: "playgroundGray", facilityName: "Playground", callback: {
                                                        
                                                    })
                                                }
                                                
//                                                if ameneties[item] == "running" && (serviceManager.selectedService?.leisure?.running != nil && serviceManager.selectedCamp?.leisure?.running == 24 ) {
//                                                    FacilitiesCard(imageName: "24hourGray", facilityName: "running", callback: {
//
//                                                    })
//                                                }
                                                
//                                                if ameneties[item] == "lamPost" && ((serviceManager.selectedService?.leisure?.lamPost) != false && serviceManager.selectedService?.leisure?.lamPost != nil) {
//                                                    FacilitiesCard(imageName: "wheelchairG", facilityName: "lamPost", callback: {
//                                                        
//                                                    })
//                                                }
                                                
                                                if ameneties[item] == "24 Hours Access" && (serviceManager.selectedService?.leisure?.accessInHours != nil && serviceManager.selectedCamp?.leisure?.accessInHours == 24 ) {
                                                    FacilitiesCard(imageName: "24hourGray", facilityName: "24-Hour", callback: {
                                                        
                                                    })
                                                }
                                                
                                               
                                                
                                                if ameneties[item] == "Wheelchair Access" && ((serviceManager.selectedService?.leisure?.billard) != false && serviceManager.selectedService?.leisure?.billard != nil) {
                                                    
                                                    
                                                    FacilitiesCard(imageName: "wheelchairG", facilityName: "Wheelchair Access", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Private Entrance" && ((serviceManager.selectedService?.leisure?.privateEntrance) != false && serviceManager.selectedService?.leisure?.privateEntrance != nil) {
                                                    
                                                    
                                                    if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                                                        if language == "ar" {
                                                            FacilitiesCard(imageName: "privateExitGray", facilityName: "خروج خاص", callback: {
                                                                
                                                            })
                                                        } else {
                                                            FacilitiesCard(imageName: "privateExitGray", facilityName: "Private Exit", callback: {
                                                                
                                                            })
                                                        }
                                                    }
                                                }
                                                
                                                if ameneties[item] == "Doorman" && ((serviceManager.selectedService?.leisure?.doorman) != false && serviceManager.selectedService?.leisure?.doorman != nil)  {
                                                    if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                                                        if language == "ar" {
                                                            FacilitiesCard(imageName: "doorman", facilityName: "بواب", callback: {
                                                                
                                                            })
                                                        } else {
                                                            FacilitiesCard(imageName: "doorman", facilityName: "Doorman", callback: {
                                                                
                                                            })
                                                        }
                                                    }
                                                    
                                                }
                                            }
                                            
                                            Group {
                                                if ameneties[item] == "Indoor Swimming Pool" && ((serviceManager.selectedService?.leisure?.indoorSwimmingPool) != nil && serviceManager.selectedService?.leisure?.indoorSwimmingPool != false) {
                                                    FacilitiesCard(imageName: "indoorSwimingpool", facilityName: "Indoor Swimming Pool", callback: {
                                                        
                                                    })
                                                }
                                                
                                               
                                                
                                                if ameneties[item] == "Speakers" && ((serviceManager.selectedService?.leisure?.speakers) != nil && serviceManager.selectedService?.leisure?.speakers != false) {
                                                    FacilitiesCard(imageName: "Speakers", facilityName: "Speakers", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "LaserLights" && ((serviceManager.selectedService?.leisure?.laserLights) != nil && serviceManager.selectedService?.leisure?.laserLights != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "LaserLights", callback: {

                                                    })
                                                }

                                                
                                                if ameneties[item] == "Outdoor Swimming Pool" && ((serviceManager.selectedService?.leisure?.outdoorSwimmingPool) != nil && serviceManager.selectedService?.leisure?.outdoorSwimmingPool != false) {
                                                    FacilitiesCard(imageName: "outdoorSwimingpool", facilityName: "Outdoor Swimming Pool", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Swimming Pool Heater" && ((serviceManager.selectedService?.leisure?.swimmingPoolHeater) != nil && serviceManager.selectedService?.leisure?.swimmingPoolHeater != false) {
                                                    FacilitiesCard(imageName: "swimingpool", facilityName: "Swimming Pool Heater", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Air Hockey" && ((serviceManager.selectedService?.leisure?.airHockeyTable) != nil && serviceManager.selectedService?.leisure?.airHockeyTable != false) {
                                                    FacilitiesCard(imageName: "airhockey", facilityName: "Air Hockey", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Trampoline" && ((serviceManager.selectedService?.leisure?.trampoline) != nil && serviceManager.selectedService?.leisure?.trampoline != false) {
                                                    FacilitiesCard(imageName: "trampoline", facilityName: "Trampoline", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Hot Tub" && ((serviceManager.selectedService?.leisure?.hotTub) != nil && serviceManager.selectedService?.leisure?.hotTub != false) {
                                                    FacilitiesCard(imageName: "hottub", facilityName: "Hot Tub", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Vollyball" && ((serviceManager.selectedService?.leisure?.volleyBall) != nil && serviceManager.selectedService?.leisure?.volleyBall != false) {
                                                    FacilitiesCard(imageName: "vollyball", facilityName: "Vollyball", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Soccer Field" && ((serviceManager.selectedService?.leisure?.volleyBall) != nil && serviceManager.selectedService?.leisure?.volleyBall != false) {
                                                    FacilitiesCard(imageName: "soccerfield", facilityName: "Soccer Field", callback: {
                                                        
                                                    })
                                                }
                                               
//                                                if ameneties[item] == "Elevator" && ((serviceManager.selectedService?.leisure?.elevator) != nil && serviceManager.selectedService?.leisure?.elevator != false) {
//                                                    FacilitiesCard(imageName: "wifi", facilityName: "Elevator", callback: {
//
//                                                    })
//                                                }

//                                                if ameneties[item] == "Stage" && ((serviceManager.selectedService?.leisure?.stage) != nil && serviceManager.selectedService?.leisure?.stage != false) {
//                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "Stage", callback: {
//
//                                                    })
//                                              }
                                                
                                            }
                                       
                                        }
                                    }

                                    HStack{
                                        Text("Availability")
                                            .font(Font.custom("poppins", size: 18))
                                            .foregroundColor(Color(textColor))
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                    }.padding(.horizontal)
                                        .padding(.vertical)
                                    
                                    HStack{
                                        Text("Bookings From")
                                            .foregroundColor(Color("000000"))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.regular)
                                        
                                        Spacer()
                                        
                                        Text(AppUtil.getDateOnlyBooking(format: "", dateValue: serviceManager.selectedService?.price?.openFrom ?? ""))
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.regular)
                                        
                                    }.padding(.horizontal, 20)
                                    Spacer()
                                    
                                    
                                    HStack{
                                        Text("Bookings To")
                                            .foregroundColor(Color("000000"))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.regular)
                                        
                                        
                                        Spacer()
                                        Text(AppUtil.getDateOnlyBooking(format: "", dateValue: serviceManager.selectedService?.price?.openTo ?? ""))
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.regular)
                                        
                                    }.padding(.horizontal, 20)
                       

                                    VStack{
                                        
                                        if  self.serviceManager.selectedService?.addOns?.sleepover ?? "" == "" && self.serviceManager.selectedService?.addOns?.birthdayArrangements ?? "" == "" && self.serviceManager.selectedService?.addOns?.weddingArrangements ?? "" == "" && self.serviceManager.selectedService?.addOns?.buffet ?? "" == "" &&  self.serviceManager.selectedService?.addOns?.photographer ?? "" == ""{
                                            
                                        }else{
                                            HStack{
                                                Text("Add-Ons")
                                                    .font(Font.custom("poppins", size: 18))
                                                    .foregroundColor(Color(textColor))
                                                    .fontWeight(.medium)
                                                
                                                Spacer()
                                            }.padding(.horizontal)
                                                .padding(.vertical)

                                        }
                                        
                                        if self.serviceManager.selectedService?.addOns?.sleepover ?? "" == ""{
                                            
                                            
                                        } else {
                                            HStack{
                                                Text("Sleep over")
                                                    .foregroundColor(Color("000000"))
                                                    .font(Font.custom("poppins", size: 13))
                                                    .fontWeight(.regular)
                                                
                                                Spacer()
                                                Text("\(serviceManager.selectedService?.addOns?.sleepover ?? "") SAR")
                                                    .foregroundColor(Color("000000").opacity(0.7))
                                                    .font(Font.custom("poppins", size: 14))
                                                    .fontWeight(.regular)
                                                
                                            }.padding(.horizontal, 20)
                                            Spacer()
                                        }
                                        
                                        if self.serviceManager.selectedService?.addOns?.birthdayArrangements ?? "" == ""{
                                            
                                        }else{
                                           HStack{
                                            Text("Birthday Arrangements")
                                                .foregroundColor(Color("000000"))
                                                .font(Font.custom("poppins", size: 13))
                                                .fontWeight(.regular)
                                            
                                            
                                            Spacer()
                                            Text("\(serviceManager.selectedService?.addOns?.birthdayArrangements ?? "") SAR")
                                                .foregroundColor(Color("000000").opacity(0.7))
                                                .font(Font.custom("poppins", size: 14))
                                                .fontWeight(.regular)
                                            
                                        }.padding(.horizontal, 20)
                                        Spacer()
                                    }
//
                                        if self.serviceManager.selectedService?.addOns?.weddingArrangements ?? "" == "" {

                                        }else{
                                            HStack{
                                                Text("Wedding Arrangements")
                                                    .foregroundColor(Color("000000"))
                                                    .font(Font.custom("poppins", size: 13))
                                                    .fontWeight(.regular)
                                                
                                                Spacer()
                                                Text("\(serviceManager.selectedService?.addOns?.weddingArrangements ?? "") SAR")
                                                    .foregroundColor(Color("000000").opacity(0.7))
                                                    .font(Font.custom("poppins", size: 14))
                                                    .fontWeight(.regular)
                                                
                                            }.padding(.horizontal, 20)
                                            Spacer()
                                        }
                                        
                                        if self.serviceManager.selectedService?.addOns?.buffet ?? "" == ""{
                                           
                                        } else {
                                            HStack{
                                                Text("Buffet")
                                                    .foregroundColor(Color("000000"))
                                                    .font(Font.custom("poppins", size: 13))
                                                    .fontWeight(.regular)
                                                
                                                Spacer()
                                                
                                                Text("\(serviceManager.selectedService?.addOns?.buffet ?? "") SAR")
                                                    .foregroundColor(Color("000000").opacity(0.7))
                                                    .font(Font.custom("poppins", size: 14))
                                                    .fontWeight(.regular)
                                                
                                            }.padding(.horizontal, 20)
                                            Spacer()
                                        }
                                        
                                        if self.serviceManager.selectedService?.addOns?.photographer ?? "" == ""{
                                           
                                        }else{
                                            HStack{
                                                Text("Photographer")
                                                    .foregroundColor(Color("000000"))
                                                    .font(Font.custom("poppins", size: 13))
                                                    .fontWeight(.regular)
                                                
                                                Spacer()
                                                Text("\(serviceManager.selectedService?.addOns?.photographer ?? "") SAR")
                                                    .foregroundColor(Color("000000").opacity(0.7))
                                                    .font(Font.custom("poppins", size: 14))
                                                    .fontWeight(.regular)
                                                
                                            }.padding(.horizontal, 20)
                                            Spacer()
                                        }
                                    }
                                    
                                }
                            }
                            else if selectedTab == "Description" {
                                VStack{
                                    HStack{
                                        Text("Description")
                                            .font(Font.custom("poppins", size: 19))
                                            .foregroundColor(Color(textColor).opacity(0.8))
                                            .fontWeight(.regular)
                                        
                                        Spacer()
                                    }.padding(.horizontal)
                                    
//                                    HStack {
//                                        Text(serviceManager.selectedService?.description?.descriptionInEnglish ?? "")
//                                            .font(Font.custom("poppins", size: 11))
//                                            .foregroundColor(Color(textColor).opacity(0.6))
//                                            .fontWeight(.regular)
//                                            .multilineTextAlignment(.leading)
//
//                                        Spacer()
//
//                                    }.padding(.horizontal)
//                                        .padding(.vertical,10)
                                    
                                    
                                    if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                                        if language == "ar" {
                                            HStack {
                                                Text(serviceManager.selectedService?.description?.descriptionInArabic ?? "")
                                                    .font(Font.custom("poppins", size: 11))
                                                    .foregroundColor(Color(textColor).opacity(0.6))
                                                    .fontWeight(.regular)
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                                
                                            }.padding(.horizontal)
                                                .padding(.vertical,10)
                                        }else{
                                            HStack {
                                                Text(serviceManager.selectedService?.description?.descriptionInEnglish ?? "")
                                                    .font(Font.custom("poppins", size: 11))
                                                    .foregroundColor(Color(textColor).opacity(0.6))
                                                    .fontWeight(.regular)
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                                
                                            }.padding(.horizontal)
                                                .padding(.vertical,10)
                                        }
                                    }else{
                                        HStack {
                                            Text(serviceManager.selectedService?.description?.descriptionInEnglish ?? "")
                                                .font(Font.custom("poppins", size: 11))
                                                .foregroundColor(Color(textColor).opacity(0.6))
                                                .fontWeight(.regular)
                                                .multilineTextAlignment(.leading)
                                            Spacer()
                                            
                                        }.padding(.horizontal)
                                            .padding(.vertical,10)
                                    }
                                    
                                    
                                  
                                }
                            }
                            else if selectedTab == "Terms" {
                                VStack{
                                    HStack{
                                        Text("Terms")
                                            .font(Font.custom("poppins", size: 19))
                                            .foregroundColor(Color(textColor).opacity(0.8))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        
                                    }.padding(.horizontal)
                                    
                                    HStack {
                                        Text("Cancellation Policy")
                                            .font(Font.custom("poppins", size: 18))
                                            .foregroundColor(Color(textColor).opacity(0.8))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        
                                       
                                    }.padding(.horizontal)
                                        .padding(.vertical,10)
                                    
                                    //
                                    Spacer()
//                                    serviceManager.selectedService?.terms ?? ""
                                    
                                    }
                                
                                        VStack {
//                                            Text(serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "")
//                                                .foregroundColor(Color("000000"))
//                                                .font(Font.custom("poppins", size: 16))
//                                                .fontWeight(.regular)
//                                                .multilineTextAlignment(.leading)
//                                                .padding(.top,5)
//
//                                            Spacer()
                                            
//                                            if serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "" == "Flexible"{
//                                                Text("The flexible Cancellation Policy allows the customer to cancel their reservation up to 24 hours prior to check-in time and receive a full refaund.")
//                                                    .foregroundColor(Color("AAAAAA"))
//                                                    .font(Font.custom("poppins", size: 13))
//                                                    .fontWeight(.regular)
//                                                    .multilineTextAlignment(.leading)
//                                                
//                                            } else if serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "" == "Moderate"{
//                                                Text("Moderate Cancellation polcy allows guests to cancel up to 3 days prior to check-in date and recieve fulll refund.")
//                                                    .foregroundColor(Color("AAAAAA"))
//                                                    .font(Font.custom("poppins", size: 13))
//                                                    .fontWeight(.regular)
//                                                    .multilineTextAlignment(.leading)
//                                                
//                                            } else if serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "" == "Strict"{
//                                                Text("Strict cancellation policy allows guests to cancel up to 7 days prior to check-in date and receive a full refund")
//                                                    .foregroundColor(Color("AAAAAA"))
//                                                    .font(Font.custom("poppins", size: 13))
//                                                    .fontWeight(.regular)
//                                                    .multilineTextAlignment(.leading)
//                                                
//                                            } else if serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "" == "Non_refundable"{
//                                                Text("Non refundable cancellation policy allows guests to cancel the reservation but booking fees are non-refundable")
//                                                    .foregroundColor(Color("AAAAAA"))
//                                                    .font(Font.custom("poppins", size: 13))
//                                                    .fontWeight(.regular)
//                                                    .multilineTextAlignment(.leading)
//                                                
//                                            }
                                            
                                            if serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "" == "Flexible"{
                                                if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                                                    if language == "ar" {
                                                        Text("مرن")
                                                            .foregroundColor(Color("000000"))
                                                            .font(Font.custom("poppins", size: 16))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                            .padding(.top,5)
                                                        
                                                        Spacer()
                                                        
                                                        Text("تسمح سياسة الإلغاء المرنة للعميل بإلغاء حجزه حتى 24 ساعة قبل موعد تسجيل الوصول والحصول على إعادة سداد كاملة.")
                                                            .foregroundColor(Color("AAAAAA"))
                                                            .font(Font.custom("poppins", size: 13))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                    } else {
                                                        Text(serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "")
                                                            .foregroundColor(Color("000000"))
                                                            .font(Font.custom("poppins", size: 16))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                            .padding(.top,5)
                                                        
                                                        Spacer()
                                                        
                                                        Text("The flexible Cancellation Policy allows the customer to cancel their reservation up to 24 hours prior to check-in time and receive a full refaund.")
                                                            .foregroundColor(Color("AAAAAA"))
                                                            .font(Font.custom("poppins", size: 13))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                    }
                                                } else {
                                                    Text(serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "")
                                                        .foregroundColor(Color("000000"))
                                                        .font(Font.custom("poppins", size: 16))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.leading)
                                                        .padding(.top,5)
                                                    
                                                    Spacer()
                                                    
                                                    Text("The flexible Cancellation Policy allows the customer to cancel their reservation up to 24 hours prior to check-in time and receive a full refaund.")
                                                        .foregroundColor(Color("AAAAAA"))
                                                        .font(Font.custom("poppins", size: 13))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.leading)
                                                }
                                                
                                            } else if serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "" == "Moderate"{
                                                if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                                                    if language == "ar" {
                                                        Text("معتدل")
                                                            .foregroundColor(Color("000000"))
                                                            .font(Font.custom("poppins", size: 16))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                            .padding(.top,5)
                                                        
                                                        Spacer()
                                                        
                                                        Text("يسمح قانون الإلغاء المعتدل للضيوف بالإلغاء حتى 3 أيام قبل تاريخ تسجيل الوصول واسترداد المبلغ المدفوع بالكامل.")
                                                            .foregroundColor(Color("AAAAAA"))
                                                            .font(Font.custom("poppins", size: 13))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                    }else{
                                                        Text(serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "")
                                                            .foregroundColor(Color("000000"))
                                                            .font(Font.custom("poppins", size: 16))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                            .padding(.top,5)
                                                        
                                                        Spacer()
                                                        
                                                        Text("Moderate Cancellation polcy allows guests to cancel up to 3 days prior to check-in date and recieve fulll refund.")
                                                            .foregroundColor(Color("AAAAAA"))
                                                            .font(Font.custom("poppins", size: 13))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                    }
                                                }else{
                                                    Text(serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "")
                                                        .foregroundColor(Color("000000"))
                                                        .font(Font.custom("poppins", size: 16))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.leading)
                                                        .padding(.top,5)
                                                    
                                                    Spacer()
                                                    
                                                    Text("Moderate Cancellation polcy allows guests to cancel up to 3 days prior to check-in date and recieve fulll refund.")
                                                        .foregroundColor(Color("AAAAAA"))
                                                        .font(Font.custom("poppins", size: 13))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.leading)
                                                }
                                                
                                            } else if serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "" == "Strict"{
                                                
                                                if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                                                    if language == "ar" {
                                                        Text("حازم")
                                                            .foregroundColor(Color("000000"))
                                                            .font(Font.custom("poppins", size: 16))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                            .padding(.top,5)
                                                        
                                                        Spacer()
                                                        
                                                        Text("تسمح سياسة الإلغاء الصارمة للضيوف بالإلغاء حتى 7 أيام قبل تاريخ تسجيل الوصول واسترداد المبلغ المدفوع بالكامل")
                                                            .foregroundColor(Color("AAAAAA"))
                                                            .font(Font.custom("poppins", size: 13))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                    }else{
                                                        Text(serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "")
                                                            .foregroundColor(Color("000000"))
                                                            .font(Font.custom("poppins", size: 16))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                            .padding(.top,5)
                                                        
                                                        Spacer()
                                                        
                                                        Text("Strict cancellation policy allows guests to cancel up to 7 days prior to check-in date and receive a full refund")
                                                            .foregroundColor(Color("AAAAAA"))
                                                            .font(Font.custom("poppins", size: 13))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                    }
                                                }else{
                                                    Text(serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "")
                                                        .foregroundColor(Color("000000"))
                                                        .font(Font.custom("poppins", size: 16))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.leading)
                                                        .padding(.top,5)
                                                    
                                                    Spacer()
                                                    
                                                    Text("Strict cancellation policy allows guests to cancel up to 7 days prior to check-in date and receive a full refund")
                                                        .foregroundColor(Color("AAAAAA"))
                                                        .font(Font.custom("poppins", size: 13))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.leading)
                                                }

                                            } else if serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "" == "Non_refundable"{
                                                if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                                                    if language == "ar" {
                                                        Text("غير قابل للاسترجاع")
                                                            .foregroundColor(Color("000000"))
                                                            .font(Font.custom("poppins", size: 16))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                            .padding(.top,5)
                                                        
                                                        Spacer()
                                                        
                                                        Text("تسمح سياسة الإلغاء غير القابلة للاسترداد للضيوف بإلغاء الحجز ولكن رسوم الحجز غير قابلة للاسترداد")
                                                            .foregroundColor(Color("AAAAAA"))
                                                            .font(Font.custom("poppins", size: 13))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                    }else{
                                                        Text(serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "")
                                                            .foregroundColor(Color("000000"))
                                                            .font(Font.custom("poppins", size: 16))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                            .padding(.top,5)
                                                        
                                                        Spacer()
                                                        
                                                        Text("Non refundable cancellation policy allows guests to cancel the reservation but booking fees are non-refundable")
                                                            .foregroundColor(Color("AAAAAA"))
                                                            .font(Font.custom("poppins", size: 13))
                                                            .fontWeight(.regular)
                                                            .multilineTextAlignment(.leading)
                                                    }
                                                }else{
                                                    Text(serviceManager.selectedService?.bookingSetting?.canellationPolicy ?? "")
                                                        .foregroundColor(Color("000000"))
                                                        .font(Font.custom("poppins", size: 16))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.leading)
                                                        .padding(.top,5)
                                                    
                                                    Spacer()
                                                    
                                                    Text("Non refundable cancellation policy allows guests to cancel the reservation but booking fees are non-refundable")
                                                        .foregroundColor(Color("AAAAAA"))
                                                        .font(Font.custom("poppins", size: 13))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.leading)
                                                }
     
                                            }
                                            
                                    }.padding(.horizontal, 30)
                                        .background(
                                            Rectangle()
                                                .fill(Color("FFFFFF"))
                                                .frame(width: UIScreen.main.bounds.width - 30, height: 110)
                                                .cornerRadius(15)
                                                .foregroundColor(Color("White"))
                                                .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
                                        )
                                    
                                    
                                    /*
                                    HStack {
                                     Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porta libero cursus quam mollis, et tempus odio porttitor. Etiam eget nulla dui.  Integer ullamcorper ullamcorper risus vulputate ornare. Etiam dignissim ligula et magna imperdiet congue. Donec vel est non diam laoreet scelerisque. Quisque volutpat congue magna.")
                                     .font(Font.custom("poppins", size: 11))
                                     .foregroundColor(Color(textColor).opacity(0.6))
                                     .fontWeight(.regular)
                                     .multilineTextAlignment(.leading)
                                     
                                     }.padding(.horizontal)
                                     .padding(.vertical,10)
                                     
                                     HStack {
                                     Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porta libero cursus quam mollis, et tempus odio porttitor. Etiam eget nulla dui. ")
                                     .font(Font.custom("poppins", size: 11))
                                     .foregroundColor(Color(textColor).opacity(0.6))
                                     .fontWeight(.regular)
                                     .multilineTextAlignment(.leading)
                                     
                                     }.padding(.horizontal)
                                     .padding(.vertical,10)
                                    */
                                    
//                                }
                            }
                            else if selectedTab == "Reviews" {
                                VStack{
                                    HStack{
                                        Text("Reviews")
                                            .font(Font.custom("poppins", size: 19))
                                            .foregroundColor(Color(textColor).opacity(0.8))
                                            .fontWeight(.regular)
                                        
                                        Text(String(serviceManager.selectedService?.reviews?.count ?? 0))
                                            .font(Font.custom("poppins", size: 7))
                                            .foregroundColor(Color(textColor3).opacity(0.6))
                                            .fontWeight(.regular)
                                        Spacer()
                                    }.padding(.horizontal)
                                    
                                    VStack{
                                        
                                        ForEach(0 ..< (serviceManager.selectedService?.reviews?.count ?? 0),id:\.self){ rev in
                                            ReviewCard(comment: serviceManager.selectedService?.reviews?[rev].comment ?? "",
                                                       rating: serviceManager.selectedService?.reviews?[rev].rating ?? 0)
                                                .padding(5)
                                        }
                                        
                                        
                                        
                                    }
                                }
                            }
                            else if selectedTab == "Map" {
                                VStack{
                                    GoogleMapsView(longitude: .constant(serviceManager.selectedService?.location?.coordinates?[0] ?? 0.0)   ,
                                                   latitude: .constant(serviceManager.selectedService?.location?.coordinates?[1] ?? 0.0))
                                }.frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
                            }
                            
                            HStack{
                                Spacer()
                                VStack{
                                    
                                    
                                    Text("SAR 180")
                                        .strikethrough()
                                        .font(Font.custom("poppins", size: 10))
                                        .foregroundColor(Color(textColor).opacity(0.5))
                                        .fontWeight(.regular)
                                    
                                    Text("SAR " + String(serviceManager.selectedService?.price?.dayPrice ?? 0))
                                        .font(Font.custom("poppins", size: 24))
                                        .foregroundColor(Color(buttonbg))
                                        .fontWeight(.bold)
                                    
                                    Text("Per Night")
                                        .font(Font.custom("poppins", size: 11))
                                        .foregroundColor(Color(textColor).opacity(0.4))
                                        .fontWeight(.regular)
                                      
                                    
                                    
                                    Text(String(serviceManager.selectedService?.bookingSetting?.bookingType ?? "") + " booking")
                                        .font(Font.custom("poppins", size: 15 ))
                                        .foregroundColor(Color(textColor))
                                        .fontWeight(.regular)
                                    
                                }
                                Spacer()
                                RoundedRectangle(cornerRadius: 76)
                                    .frame(width: 150, height: 50, alignment: .center)
                                    .foregroundColor(Color(buttonbg))
                                    .overlay(
                                        Text("Edit")
                                            .font(Font.custom("poppins", size: 20))
                                            .foregroundColor(Color(textColor))
                                            .fontWeight(.regular)
                                    ).onTapGesture {
                                        AppUtil.selectedCategory = serviceManager.selectedService?.category?.type ?? ""
                                        AppUtil.selectedID = serviceManager.selectedService?._id ?? ""
                                        print("Selected Category", AppUtil.selectedCategory)
                                        let addserviceobj = ServiceObject()
                                        AppUtil.editserviceObject = serviceManager.selectedService
//                                        AppUtil.addserviceObject?.description = nil
                                        AppUtil.pickerResult = []
                                        serviceManager.editserviceObject = serviceManager.selectedService
//                                        AppUtil.addserviceSafety = Safty()
//                                        AppUtil.addServiceRules = Rules()
//                                        AppUtil.addServiceLeisure = Leisuree()
//                                        AppUtil.addServiceDescription = Description()
//                                        AppUtil.selectedBookingFor = ""
//                                        AppUtil.selectedCategory = ""
//                                        serviceManager.selectedCancellationType = ""
                                        viewRouter.currentPage = "EditAddService_View"
                                    }
//                                serviceManager.selectedService?.categorylistt?.categories?[0].type ?? ""
//                                AppUtil.categorieslistt?.categories?[0].type ?? ""
                                Spacer()
                            }.padding(.horizontal)
                                .padding(.vertical)
                        }
                    }
                }
                BottomNavigation()
                Spacer()
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
            .background(Color("F2F5F9"))
            .ignoresSafeArea(.container, edges: .top)
    }
    
    func markAllFalse (index: Int) {
        for i in 0 ..< check.count {
            if i != index {
                check[i] = false
            }
        }
    }
}

struct ServiceReview_Previews: PreviewProvider {
    static var previews: some View {
        ServiceReview()
    }
}
//                                        showPreloader = true
//                                        VendorApiUtil.publishServiceHotel(body: serviceManager.selectedService ?? "", success: { _ in
//                                        }, failure: { _ in
//                                        })
//                                        viewRouter.currentPage = "MyServiceScreen"
