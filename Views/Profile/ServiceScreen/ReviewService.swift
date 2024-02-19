//
//  ReviewService.swift
//  SmartBookings
//
//  Created by Sheheryar on 11/08/2022.
//

import SwiftUI

struct ReviewService: View {
    var textColor: String = "000000"
    var textColor2: String = "AAAAAA"
    var textColor3: String = "393F45"
    var buttonbg: String = "FEBB12"
    @State var errorMessage: String = ""
    @State var selectedTab = "Overview"
    @State var headings: [String] = ["Overview","Description","Reviews","Terms","Map"]
    @State var check: [Bool] = [true,false,false,false,false]
    @State var imageUrls: [String] = []
    @State var showPreloader: Bool = false
    @State var togglepopup: Bool = false
    
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    var ameneties: [String] = ["wifi","tv","coffee","Steam Bath","Indoor Swimming Pool","Outdoor Swimming Pool","Swimming Pool Heater","parking","Gym","Billiard","Tennis Court","playground","24 Hours Access","Wheelchair Access","Private Entrance","Doorman","Air Hockey","Soccer Field","Vollyball","Trampoline","Camps","Hot Tub" ,"Air Slider","Sand Games","Water Games","Air Conditioning","Elevator","Stage","Speakers","LaserLights","Hairstylist", "SPA", "swimming With Water Games","SaftyBox"]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            VStack{
                //  ScrollView{
                VStack{
                    ZStack{
                        
                        GeometryReader { geometry in
                            if AppUtil.pickerResult.count > 0 {
                                ImageCarouselView(numberOfImages: AppUtil.pickerResult.count) {
                                    ForEach(0 ..< AppUtil.pickerResult.count,id:\.self) { item in
                                        Image(uiImage: AppUtil.pickerResult[item])
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .clipped()
                                    }
                                    
                                    
                                }
                            } else {
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
//                                Circle()
//                                    .frame(width: 47, height: 47, alignment: .center)
//                                    .foregroundColor(Color("White"))
//                                    .overlay(
//                                        Image("shareIcon")
//                                            .resizable()
//                                            .frame(width: 24, height: 25, alignment: .center)
//                                    )
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
                    
                    
                }.frame(width: UIScreen.main.bounds.width, height: 350, alignment: .center)
                    .background(RoundedCorners(color: Color(""), tl: 0, tr: 0, bl: 15, br: 15))
                    .ignoresSafeArea()
                
                VStack {
                    
                    HStack {
                        
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
                                            .onTapGesture{
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
                    
                    VStack {
                        ScrollView(showsIndicators:false) {
                            if selectedTab == "Overview" {
                                VStack{
                                    HStack{
                                        VStack{
                                            HStack {
                                                Text(serviceManager.addService?.description?.nameInEnglish ?? "")
                                                    .font(Font.custom("poppins", size: 20))
                                                    .foregroundColor(Color(textColor))
                                                    .fontWeight(.regular)
                                                
                                                Spacer()
                                                
                                            }.padding(.bottom,5)
                                            
//                                            HStack {
//                                                Text("The ulitimate 5 star hotel")
//                                                    .font(Font.custom("poppins", size: 11))
//                                                    .foregroundColor(Color(textColor).opacity(0.4))
//                                                
//                                                Spacer()
//                                            }
                                      
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
                                            ).onTapGesture{
                                                UserApiUtil.getVendorProfile(id: serviceManager.addService?.vender ?? "", success: { res in
                                                    AppUtil.selectedVendor = res
                                                    AppUtil.reviews = serviceManager.addService?.reviews ?? []
                                                    viewRouter.currentPage = "VendorProfile"
                                                }, failure: { _ in
                                                    
                                                })
                                                
                                            }
                                        
                                    }.padding(.horizontal)
                                    
                                    
                                    HStack{
                                        Spacer()
                                        VStack{
                                            Image("rooms")
                                                .scaledToFit()
                                            HStack{
                                                Text(String(serviceManager.addService?.unitsAndGuest?.doubleBed ?? 0))
                                                    .font(Font.custom("poppins", size: 8))
                                                    .foregroundColor(Color(textColor).opacity(0.5))
                                                    .fontWeight(.regular)
                                                
                                                Text(" Rooms")
                                                    .font(Font.custom("poppins", size: 8))
                                                    .foregroundColor(Color(textColor).opacity(0.5))
                                                    .fontWeight(.regular)
                                            }
                                          
                                            
                                        }
                                        Spacer()
                                        VStack{
                                            Image("bathrooms")
                                                .scaledToFit()
                                            HStack{
                                                Text(String(serviceManager.addService?.unitsAndGuest?.bathrooms ?? 0))
                                                    .font(Font.custom("poppins", size: 8))
                                                    .foregroundColor(Color(textColor).opacity(0.5))
                                                    .fontWeight(.regular)
                                                
                                                Text(" Bathrooms")
                                                    .font(Font.custom("poppins", size: 8))
                                                    .foregroundColor(Color(textColor).opacity(0.5))
                                                    .fontWeight(.regular)
                                            }
                                          
                                            
                                        }
                                        Spacer()
                                        VStack{
                                            Image("house")
                                                .resizable()
                                                .frame(width: 30, height: 28, alignment: .center)
                                            Text("Hotel")
                                                .font(Font.custom("poppins", size: 8))
                                                .foregroundColor(Color(textColor).opacity(0.5))
                                                .fontWeight(.regular)
                                            
                                        }
                                        Spacer()
                                        VStack{
                                            Image("singlebd")
                                                .resizable()
                                                .frame(width: 30, height: 30, alignment: .center)
                                            HStack{
                                                Text(String(serviceManager.addService?.unitsAndGuest?.singleBed ?? 0))
                                                    .font(Font.custom("poppins", size: 8))
                                                    .foregroundColor(Color(textColor).opacity(0.5))
                                                    .fontWeight(.regular)
                                                
                                                Text(" Single Bed")
                                                   .font(Font.custom("poppins", size: 8))
                                                   .foregroundColor(Color(textColor).opacity(0.5))
                                                   .fontWeight(.regular)
                                            }
                                           
                                            
                                        }
                                        Spacer()
                                        
                                    }
                                    .padding(.vertical,20)
                                    
                                    
                                    HStack{
                                        Spacer()
                                        VStack{
                                            Image("Locationpin")
                                                .resizable()
                                                .frame(width: 22, height: 32, alignment: .center)
                                            Text(serviceManager.addService?.address?.address ?? "")
                                                .font(Font.custom("poppins", size: 8))
                                                .foregroundColor(Color(textColor).opacity(0.5))
                                                .fontWeight(.regular)
                                            
                                        }
                                        Spacer()
                                        VStack{
                                            Image("SqFitSize")
                                                .resizable()
                                                .frame(width: 30, height: 30, alignment: .center)
                                            Text(String(serviceManager.addService?.description?.areaSqm ?? 0))
                                                .font(Font.custom("poppins", size: 8))
                                                .foregroundColor(Color(textColor).opacity(0.5))
                                                .fontWeight(.regular)
                                            
                                        }
                                        Spacer()
                                        VStack{
                                            Image("FamilyIcon")
                                                .resizable()
                                                .frame(width: 30, height: 28, alignment: .center)
                                            Text("For Families")
                                                .font(Font.custom("poppins", size: 8))
                                                .foregroundColor(Color(textColor).opacity(0.5))
                                                .fontWeight(.regular)
                                            
                                        }
                                        Spacer()
                                        VStack{
                                            Image("WebSite")
                                                .resizable()
                                                .frame(width: 30, height: 30, alignment: .center)
                                            Text("www.lorem.com")
                                                .font(Font.custom("poppins", size: 8))
                                                .foregroundColor(Color(textColor).opacity(0.5))
                                                .fontWeight(.regular)
                                            
                                        }
                                        Spacer()
                                        
                                    }
                                    .padding(.vertical,20)
                                    
                                    HStack{
                                        Text("Facilities")
                                            .font(Font.custom("poppins", size: 14))
                                            .foregroundColor(Color(textColor))
                                            .fontWeight(.regular)
                                        
                                        Spacer()
                                    }.padding(.horizontal)
                                        .padding(.vertical)
                                    
                                    LazyVGrid(columns: columns, spacing: 10){
                                        ForEach(0 ..< ameneties.count , id: \.self) { item in
                                            Group {
                                                if ameneties[item] == "Water Games" && ((serviceManager.addService?.leisure?.waterGames) != nil && serviceManager.addService?.leisure?.waterGames != false) {
                                                    FacilitiesCard(imageName: "Water_games", facilityName: "Water Games", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "Air Conditioning" && ((serviceManager.addService?.leisure?.airConditioning) != nil && serviceManager.addService?.leisure?.airConditioning != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "Air Conditioning", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "Air Slider" && ((serviceManager.addService?.leisure?.airSlider) != nil && serviceManager.addService?.leisure?.airSlider != false) {
                                                    FacilitiesCard(imageName: "wifi", facilityName: "Air Slider", callback: {

                                                    })
                                                }
                                                
                                                if ameneties[item] == "Sand Games" && ((serviceManager.addService?.leisure?.sandGames) != nil && serviceManager.addService?.leisure?.sandGames != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "Sand Games", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "wifi" && ((serviceManager.addService?.leisure?.wifi) != nil && serviceManager.addService?.leisure?.wifi != false) {
                                                    FacilitiesCard(imageName: "wifi", facilityName: "Wifi", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "tv" && ((serviceManager.addService?.leisure?.tv) != nil && serviceManager.addService?.leisure?.tv != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "TV", callback: {
                                                        
                                                    })
                                                }
                                               /*
                                                if ameneties[item] == "Gym" && ((serviceManager.selectedService?.leisure?.gym) != nil && serviceManager.selectedService?.leisure?.gym != false) {
                                                    FacilitiesCard(imageName: "billboardGray", facilityName: "Gym", callback: {
                                                        
                                                    })
                                                }
                                                */
                                                if ameneties[item] == "coffee" && ((serviceManager.addService?.kitchen?.coffeeMachine) != nil && serviceManager.addService?.kitchen?.coffeeMachine != false) {
                                                    FacilitiesCard(imageName: "Cup", facilityName: "Coffee", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "parking" && ((serviceManager.addService?.leisure?.parking) != nil  && serviceManager.addService?.leisure?.parking != false)
                                                   {
                                                    
                                                    FacilitiesCard(imageName: "Parking_new", facilityName: "Parking", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Billiard" && ((serviceManager.addService?.leisure?.billard) != nil && serviceManager.addService?.leisure?.billard != false) {
                                                    
                                                    FacilitiesCard(imageName: "billboardGray", facilityName: "Billiard", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Steam Bath" && ((serviceManager.addService?.leisure?.steamBath) != nil && serviceManager.addService?.leisure?.steamBath != false) {
                                                    FacilitiesCard(imageName: "steambath", facilityName: "Steam Bath", callback: {
                                                        
                                                    })
                                                }
                                            }
                                            
                                            Group{
                                                
                                                if ameneties[item] == "swimming With Water Games" && ((serviceManager.addService?.leisure?.swimmingWithWaterGames) != nil && serviceManager.addService?.leisure?.swimmingWithWaterGames != false) {
                                                    FacilitiesCard(imageName: "Water_games", facilityName: "swimming With Water Games", callback: {

                                                    })
                                                }
                                                /*
                                                if ameneties[item] == "Gym" && ((serviceManager.selectedService?.leisure?.gym) != nil && serviceManager.selectedService?.leisure?.gym != false) {
                                                    FacilitiesCard(imageName: "billboardGray", facilityName: "Gym", callback: {
                                                        
                                                    })
                                                }
                                                */
                                                if ameneties[item] == "SaftyBox" && ((serviceManager.addService?.leisure?.saftyBox) != nil && serviceManager.addService?.leisure?.saftyBox != false) {
                                                    FacilitiesCard(imageName: "safety-box", facilityName: "SaftyBox", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "Hairstylist" && ((serviceManager.addService?.leisure?.hairStylist) != nil && serviceManager.addService?.leisure?.hairStylist != false) {
                                                    FacilitiesCard(imageName: "wifi", facilityName: "Hairstylist", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "SPA" && ((serviceManager.addService?.leisure?.spa) != nil && serviceManager.addService?.leisure?.spa != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "SPA", callback: {

                                                    })
                                                }

                                                if ameneties[item] == "Tennis Court" && ((serviceManager.addService?.leisure?.tennisCourt) != false && serviceManager.addService?.leisure?.tennisCourt != nil ) {
                                                    
                                                    FacilitiesCard(imageName: "tennisGray", facilityName: "Tennis Court", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "playground" && ((serviceManager.addService?.leisure?.playground) != false && serviceManager.addService?.leisure?.playground != nil) {
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
                                                
                                                if ameneties[item] == "24 Hours Access" && (serviceManager.addService?.leisure?.accessInHours != nil && serviceManager.addService?.leisure?.accessInHours == 24 ) {
                                                    FacilitiesCard(imageName: "24hourGray", facilityName: "24-Hour", callback: {
                                                        
                                                    })
                                                }
                                                
                                               
                                                
                                                if ameneties[item] == "Wheelchair Access" && ((serviceManager.addService?.leisure?.billard) != false && serviceManager.addService?.leisure?.billard != nil) {
                                                    
                                                    
                                                    FacilitiesCard(imageName: "wheelchairG", facilityName: "Wheelchair Access", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Private Entrance" && ((serviceManager.addService?.leisure?.privateEntrance) != false && serviceManager.addService?.leisure?.privateEntrance != nil) {
                                                    
                                                    
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
                                                
                                                if ameneties[item] == "Doorman" && ((serviceManager.addService?.leisure?.doorman) != false && serviceManager.addService?.leisure?.doorman != nil)  {
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
                                                if ameneties[item] == "Indoor Swimming Pool" && ((serviceManager.addService?.leisure?.indoorSwimmingPool) != nil && serviceManager.addService?.leisure?.indoorSwimmingPool != false) {
                                                    FacilitiesCard(imageName: "indoorSwimingpool", facilityName: "Indoor Swimming Pool", callback: {
                                                        
                                                    })
                                                }

                                                if ameneties[item] == "Speakers" && ((serviceManager.addService?.leisure?.speakers) != nil && serviceManager.addService?.leisure?.speakers != false) {
                                                    FacilitiesCard(imageName: "Speakers", facilityName: "Speakers", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "LaserLights" && ((serviceManager.addService?.leisure?.laserLights) != nil && serviceManager.addService?.leisure?.laserLights != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "LaserLights", callback: {

                                                    })
                                                }

                                                
                                                if ameneties[item] == "Outdoor Swimming Pool" && ((serviceManager.addService?.leisure?.outdoorSwimmingPool) != nil && serviceManager.addService?.leisure?.outdoorSwimmingPool != false) {
                                                    FacilitiesCard(imageName: "outdoorSwimingpool", facilityName: "Outdoor Swimming Pool", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Swimming Pool Heater" && ((serviceManager.addService?.leisure?.swimmingPoolHeater) != nil && serviceManager.addService?.leisure?.swimmingPoolHeater != false) {
                                                    FacilitiesCard(imageName: "swimingpool", facilityName: "Swimming Pool Heater", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Air Hockey" && ((serviceManager.addService?.leisure?.airHockeyTable) != nil && serviceManager.addService?.leisure?.airHockeyTable != false) {
                                                    FacilitiesCard(imageName: "airhockey", facilityName: "Air Hockey", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Trampoline" && ((serviceManager.addService?.leisure?.trampoline) != nil && serviceManager.addService?.leisure?.trampoline != false) {
                                                    FacilitiesCard(imageName: "trampoline", facilityName: "Trampoline", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Hot Tub" && ((serviceManager.addService?.leisure?.hotTub) != nil && serviceManager.addService?.leisure?.hotTub != false) {
                                                    FacilitiesCard(imageName: "hottub", facilityName: "Hot Tub", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Vollyball" && ((serviceManager.addService?.leisure?.volleyBall) != nil && serviceManager.addService?.leisure?.volleyBall != false) {
                                                    FacilitiesCard(imageName: "vollyball", facilityName: "Vollyball", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Soccer Field" && ((serviceManager.addService?.leisure?.volleyBall) != nil && serviceManager.addService?.leisure?.volleyBall != false) {
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
//                                        Text(serviceManager.addService?.description?.descriptionInEnglish ?? "")
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
                                                Text(serviceManager.addService?.description?.descriptionInArabic ?? "")
                                                    .font(Font.custom("poppins", size: 11))
                                                    .foregroundColor(Color(textColor).opacity(0.6))
                                                    .fontWeight(.regular)
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                                
                                            }.padding(.horizontal)
                                                .padding(.vertical,10)
                                        }else{
                                            HStack {
                                                Text(serviceManager.addService?.description?.descriptionInEnglish ?? "")
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
                                            Text(serviceManager.addService?.description?.descriptionInEnglish ?? "")
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
//                                    serviceManager.addService?.terms ?? ""
                                    
                                    }
                                
                                        VStack {
                                            if serviceManager.addService?.bookingSetting?.canellationPolicy ?? "" == "Flexible"{
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
                                                    }else{
                                                        Text(serviceManager.addService?.bookingSetting?.canellationPolicy ?? "")
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
                                                }else{
                                                    Text(serviceManager.addService?.bookingSetting?.canellationPolicy ?? "")
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
                                                
                                            } else if serviceManager.addService?.bookingSetting?.canellationPolicy ?? "" == "Moderate"{
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
                                                        Text(serviceManager.addService?.bookingSetting?.canellationPolicy ?? "")
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
                                                    Text(serviceManager.addService?.bookingSetting?.canellationPolicy ?? "")
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
                                                
                                            } else if serviceManager.addService?.bookingSetting?.canellationPolicy ?? "" == "Strict"{
                                                
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
                                                        Text(serviceManager.addService?.bookingSetting?.canellationPolicy ?? "")
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
                                                } else {
                                                    Text(serviceManager.addService?.bookingSetting?.canellationPolicy ?? "")
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

                                            } else if serviceManager.addService?.bookingSetting?.canellationPolicy ?? "" == "Non_refundable"{
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
                                                    } else {
                                                        Text(serviceManager.addService?.bookingSetting?.canellationPolicy ?? "")
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
                                                    Text(serviceManager.addService?.bookingSetting?.canellationPolicy ?? "")
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
                            
//                            else if selectedTab == "Reviews" {
//                                VStack{
//                                    HStack{
//                                        Text("Reviews")
//                                            .font(Font.custom("poppins", size: 19))
//                                            .foregroundColor(Color(textColor).opacity(0.8))
//                                            .fontWeight(.regular)
//                                        
//                                        Text("(24)")
//                                            .font(Font.custom("poppins", size: 7))
//                                            .foregroundColor(Color(textColor3).opacity(0.6))
//                                            .fontWeight(.regular)
//                                        Spacer()
//                                    }.padding(.horizontal)
//                                    
//                                    VStack{
//                                        
//                                        ForEach(0 ..< 7,id:\.self){ _ in
//                                            ReviewCard()
//                                                .padding(5)
//                                        }
//                                        
//                                        ForEach(0 ..< (serviceManager.addService?.reviews.count ?? 0),id:\.self){ rev in
//                                            ReviewCard(comment: serviceManager.addService?.reviews[rev].comment ?? "",
//                                                       rating: serviceManager.addService?.reviews[rev].rating ?? 0)
//                                                .padding(5)
//                                        }
//                                        
//                                        
//                                        
//                                    }
//                                }
//                            }
                            else if selectedTab == "Map" {
                                VStack{
                                    GoogleMapsView(longitude: .constant(serviceManager.addService?.location?.coordinates?[0] ?? 0.0)   ,
                                                   latitude: .constant(serviceManager.addService?.location?.coordinates?[1] ?? 0.0))
                                }.frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
                            }
                            HStack{
                                Spacer()
                                VStack{
                                    if AppUtil.selectedCategory == "Stadium"{
                                        Text("SAR " + String(serviceManager.addService?.price?.hourPrice ?? 0))
                                            .font(Font.custom("poppins", size: 24))
                                            .foregroundColor(Color(buttonbg))
                                            .fontWeight(.bold)
                                        
                                        Text("Per hour")
                                            .font(Font.custom("poppins", size: 11))
                                            .foregroundColor(Color(textColor).opacity(0.5))
                                            .fontWeight(.regular)
                                    }else{
                                        Text("SAR " + String(serviceManager.addService?.price?.dayPrice ?? 0))
                                            .font(Font.custom("poppins", size: 24))
                                            .foregroundColor(Color(buttonbg))
                                            .fontWeight(.bold)
                                        
                                        Text("Per Night")
                                            .font(Font.custom("poppins", size: 11))
                                            .foregroundColor(Color(textColor).opacity(0.5))
                                            .fontWeight(.regular)
                                    }
                                    
                                }
                                
                                Spacer()
                                RoundedRectangle(cornerRadius: 76)
                                    .frame(width: 150, height: 50, alignment: .center)
                                    .foregroundColor(Color(buttonbg))
                                    .overlay(
                                        Text("Publish")
                                            .font(Font.custom("poppins", size: 20))
                                            .foregroundColor(Color(textColor))
                                            .fontWeight(.regular)
                                    ).onTapGesture {
                                       
                                        if !showPreloader {
                                            showPreloader = true
                                            if AppUtil.selectedCategory == "Hotel" || AppUtil.selectedCategory == "Hotels"  {
                                                if AppUtil.pickerResult.count > 0 {
                                               
                                                    UserApiUtil.uploadImageForService(paramName: "images", fileName: "hotel1", image:AppUtil.pickerResult,success: { res in
                                                        imageUrls = res
                                                        print("sdfjsdufs", res)
                                                        serviceManager.addService?.description?.images = imageUrls
                                                        print("gdfgfdgfdgdfgyjuytju", res)
                                                        VendorApiUtil.publishServiceHotel(body: serviceManager.addService!, success:{ _ in
                                                            viewRouter.currentPage = "ServiceSubmitScreen"
                                                        }, failure: { f in
                                                            showPreloader = false
                                                           errorMessage = f
                                                            togglepopup.toggle()
                                                        })
                                                        
                                                        
                                                    },failure: { _ in
                                                            serviceManager.addService?.description?.images = imageUrls
                                                            print("gdfgfgghhgf", imageUrls)
                                                            VendorApiUtil.publishServiceHotel(body: serviceManager.addService!, success:{ _ in
                                                                viewRouter.currentPage = "ServiceSubmitScreen"
                                                                print("Service manager hotel", serviceManager.addService ?? "")
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                    })
                                                }
                                                else {
                                                    VendorApiUtil.publishServiceHotel(body: serviceManager.addService!, success: { _ in
                                                        viewRouter.currentPage = "ServiceSubmitScreen"
                                                    }, failure: { f in
                                                        showPreloader = false
                                                       errorMessage = f
                                                        togglepopup.toggle()
                                                    })
                                                }
                                            }
                                            else if  AppUtil.selectedCategory == "Camps" {
                                                if AppUtil.pickerResult.count > 0 {
                                               
                                                    UserApiUtil.uploadImageForService(paramName: "images", fileName: "hotel1", image:AppUtil.pickerResult,success: { res in
                                                        imageUrls = res
                                                        serviceManager.addService?.description?.images = imageUrls
                                                        VendorApiUtil.publishServiceCamp(body: serviceManager.addService!, success:{ _ in
                                                            viewRouter.currentPage = "ServiceSubmitScreen"
                                                        }, failure: { f in
                                                            showPreloader = false
                                                           errorMessage = f
                                                            togglepopup.toggle()
                                                        })
                                                        
                                                        
                                                    },failure: { _ in
                                                    
                                                            serviceManager.addService?.description?.images = imageUrls
                                                            VendorApiUtil.publishServiceCamp(body: serviceManager.addService!, success:{ _ in
                                                                viewRouter.currentPage = "ServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                
                                                    })
                                                }
                                                else {
                                                    VendorApiUtil.publishServiceCamp(body: serviceManager.addService!, success: { _ in
                                                        viewRouter.currentPage = "ServiceSubmitScreen"
                                                    }, failure: { f in
                                                        showPreloader = false
                                                       errorMessage = f
                                                        togglepopup.toggle()
                                                    })
                                                }
                                            }
                                            else if AppUtil.selectedCategory == "Resorts" {
                                                let chalet = Resort()
                                                chalet.location = serviceManager.addService?.location
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                                
                                                
                                                let roomsGuest = RoomsGuest()
                                                roomsGuest.indoorSeating = serviceManager.addService?.unitsAndGuest?.indoorSeating
                                                roomsGuest.outdoorSeating = serviceManager.addService?.unitsAndGuest?.outdoorSeating
                                                roomsGuest.bathrooms = serviceManager.addService?.unitsAndGuest?.bathrooms
                                                roomsGuest.singleBed = serviceManager.addService?.unitsAndGuest?.singleBed
                                                roomsGuest.doubleBed = serviceManager.addService?.unitsAndGuest?.doubleBed
                                                roomsGuest.section = serviceManager.addService?.unitsAndGuest?.section
                                                roomsGuest.additionSeating = serviceManager.addService?.unitsAndGuest?.additionSeating
                                                roomsGuest.maxGuest = serviceManager.addService?.unitsAndGuest?.maxGuest
                                                roomsGuest.bedrooms = serviceManager.addService?.unitsAndGuest?.bedrooms
                                                
                                                chalet.roomsGuest = roomsGuest
                                                chalet.addOns = serviceManager.addService?.addOns
                                                chalet.location = serviceManager.addService?.location
                                                chalet.address = serviceManager.addService?.address
                                                chalet.bookingSetting = serviceManager.addService?.bookingSetting
                                                chalet.available = serviceManager.addService?.available
                                                chalet.check = serviceManager.addService?.check
                                                chalet.kitchen = serviceManager.addService?.kitchen
                                                chalet.roomsbath = serviceManager.addService?.roomsbath
                                                chalet.price = serviceManager.addService?.price
                                                chalet.fav = serviceManager.addService?.fav
                                                chalet.leisure = serviceManager.addService?.leisure
                                                

                                                let description = ResortDescription()
                                                description.areaSqm = serviceManager.addService?.description?.areaSqm
                                                description.images = serviceManager.addService?.description?.images
                                                description.nameInEnglish = serviceManager.addService?.description?.nameInEnglish
                                                description.rules = serviceManager.addService?.description?.rules
                                                description.secondryPhone = serviceManager.addService?.description?.secondryPhone ?? 0
                                                description.safty = serviceManager.addService?.description?.safty
                                                description.nameInArabic = serviceManager.addService?.description?.nameInArabic
                                                description.descriptionInArabic = serviceManager.addService?.description?.descriptionInArabic
                                                description.descriptionInEnglish = serviceManager.addService?.description?.descriptionInEnglish
                                                
                                                chalet.description = description
                                                
                                                chalet.outdoors = serviceManager.addService?.outdoors
                                                chalet.reviews = serviceManager.addService?.reviews
                                                chalet.terms = serviceManager.addService?.terms
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                              
                                                if AppUtil.pickerResult.count > 0 {
                                                        UserApiUtil.uploadImageForService(paramName: "images", fileName: "hotel1", image: AppUtil.pickerResult,success: { res in
                                                            imageUrls = res
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishResort(body: chalet, success: { _ in
                                                                viewRouter.currentPage = "ServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                            
                                                        },failure: { _ in
                                                           
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishResort(body: chalet, success: { _ in
                                                                viewRouter.currentPage = "ServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                        })
                                                   
                                                } else {
                                                    VendorApiUtil.publishResort(body: chalet, success: { _ in
                                                        viewRouter.currentPage = "ServiceSubmitScreen"
                                                    }, failure: { f in
                                                        showPreloader = false
                                                       errorMessage = f
                                                        togglepopup.toggle()
                                                    })
                                                }
                                              
                                                
                                               
                                            }
                                            
                                            else if AppUtil.selectedCategory == "Farms" {
                                                
                                                let chalet = Resort()
                                                chalet.location = serviceManager.addService?.location
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                                
                                                
                                                let roomsGuest = RoomsGuest()
                                                roomsGuest.indoorSeating = serviceManager.addService?.unitsAndGuest?.indoorSeating
                                                roomsGuest.outdoorSeating = serviceManager.addService?.unitsAndGuest?.outdoorSeating
                                                roomsGuest.bathrooms = serviceManager.addService?.unitsAndGuest?.bathrooms
                                                roomsGuest.singleBed = serviceManager.addService?.unitsAndGuest?.singleBed
                                                roomsGuest.doubleBed = serviceManager.addService?.unitsAndGuest?.doubleBed
                                                roomsGuest.section = serviceManager.addService?.unitsAndGuest?.section
                                                roomsGuest.additionSeating = serviceManager.addService?.unitsAndGuest?.additionSeating
                                                roomsGuest.maxGuest = serviceManager.addService?.unitsAndGuest?.maxGuest
                                                roomsGuest.bedrooms = serviceManager.addService?.unitsAndGuest?.bedrooms
                                                
                                                chalet.roomsGuest = roomsGuest
                                                chalet.addOns = serviceManager.addService?.addOns
                                                chalet.location = serviceManager.addService?.location
                                                chalet.address = serviceManager.addService?.address
                                                chalet.bookingSetting = serviceManager.addService?.bookingSetting
                                                chalet.available = serviceManager.addService?.available
                                                chalet.check = serviceManager.addService?.check
                                                chalet.kitchen = serviceManager.addService?.kitchen
                                                chalet.roomsbath = serviceManager.addService?.roomsbath
                                                chalet.price = serviceManager.addService?.price
                                                chalet.fav = serviceManager.addService?.fav
                                                chalet.leisure = serviceManager.addService?.leisure
                                                
                                                
                                                let description = ResortDescription()
                                                description.areaSqm = serviceManager.addService?.description?.areaSqm
                                                description.images = serviceManager.addService?.description?.images
                                                description.nameInEnglish = serviceManager.addService?.description?.nameInEnglish
                                                description.rules = serviceManager.addService?.description?.rules
                                                description.secondryPhone = serviceManager.addService?.description?.secondryPhone ?? 0
                                                description.safty = serviceManager.addService?.description?.safty
                                                description.nameInArabic = serviceManager.addService?.description?.nameInArabic
                                                description.descriptionInArabic = serviceManager.addService?.description?.descriptionInArabic
                                                description.descriptionInEnglish = serviceManager.addService?.description?.descriptionInEnglish
                                                
                                                chalet.description = description
                                                
                                                chalet.outdoors = serviceManager.addService?.outdoors
                                                chalet.reviews = serviceManager.addService?.reviews
                                                chalet.terms = serviceManager.addService?.terms
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                               
                                              
                                                if AppUtil.pickerResult.count > 0 {
                                                   
                                                   
                                                    UserApiUtil.uploadImageForService(paramName: "images", fileName: "hotel1", image: AppUtil.pickerResult,success: { res in
                                                        imageUrls = res
                                                        
                                                        chalet.description?.images = imageUrls
                                                        VendorApiUtil.publishFarms(body: chalet, success: { _ in
                                                            viewRouter.currentPage = "ServiceSubmitScreen"
                                                        }, failure: { f in
                                                            showPreloader = false
                                                           errorMessage = f
                                                            togglepopup.toggle()
                                                        })
                                                        
                                                        
                                                    },failure: { _ in
                                                        
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishFarms(body: chalet, success: { _ in
                                                                viewRouter.currentPage = "ServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                        
                                                        })
                                                    
                                                } else {
                                                    VendorApiUtil.publishFarms(body: chalet, success: { _ in
                                                        viewRouter.currentPage = "ServiceSubmitScreen"
                                                    }, failure: { f in
                                                        showPreloader = false
                                                       errorMessage = f
                                                        togglepopup.toggle()
                                                    })
                                                }
                                                
                                              
                                              
                                            }
                                            
                                            else if AppUtil.selectedCategory == "Lounges" {
                                                
                                                let chalet = Resort()
                                                chalet.location = serviceManager.addService?.location
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                                
                                                
                                                let roomsGuest = RoomsGuest()
                                                roomsGuest.indoorSeating = serviceManager.addService?.unitsAndGuest?.indoorSeating
                                                roomsGuest.outdoorSeating = serviceManager.addService?.unitsAndGuest?.outdoorSeating
                                                roomsGuest.bathrooms = serviceManager.addService?.unitsAndGuest?.bathrooms
                                                roomsGuest.section = serviceManager.addService?.unitsAndGuest?.section
                                                roomsGuest.additionSeating = serviceManager.addService?.unitsAndGuest?.additionSeating
                                                roomsGuest.maxGuest = serviceManager.addService?.unitsAndGuest?.maxGuest
                                               
                                                
                                                chalet.roomsGuest = roomsGuest
                                                chalet.addOns = serviceManager.addService?.addOns
                                                chalet.location = serviceManager.addService?.location
                                                chalet.address = serviceManager.addService?.address
                                                chalet.bookingSetting = serviceManager.addService?.bookingSetting
                                                chalet.available = serviceManager.addService?.available
                                                chalet.check = serviceManager.addService?.check
                                                chalet.kitchen = serviceManager.addService?.kitchen
                                                chalet.roomsbath = serviceManager.addService?.roomsbath
                                                chalet.price = serviceManager.addService?.price
                                                chalet.fav = serviceManager.addService?.fav
                                                chalet.leisure = serviceManager.addService?.leisure
                                                
                                                let description = ResortDescription()
                                                description.areaSqm = serviceManager.addService?.description?.areaSqm
                                                description.images = serviceManager.addService?.description?.images
                                                description.nameInEnglish = serviceManager.addService?.description?.nameInEnglish
                                                description.rules = serviceManager.addService?.description?.rules
                                                description.secondryPhone = serviceManager.addService?.description?.secondryPhone ?? 0
                                                description.safty = serviceManager.addService?.description?.safty
                                                description.nameInArabic = serviceManager.addService?.description?.nameInArabic
                                                description.descriptionInArabic = serviceManager.addService?.description?.descriptionInArabic
                                                description.descriptionInEnglish = serviceManager.addService?.description?.descriptionInEnglish
                                                
                                                
                                               
                                                
                                                
                                                chalet.description = description
                                                
                                                
                                                chalet.outdoors = serviceManager.addService?.outdoors
                                                chalet.reviews = serviceManager.addService?.reviews
                                                chalet.terms = serviceManager.addService?.terms
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                             
                                                if AppUtil.pickerResult.count > 0 {
                                                
                                                       
                                                        UserApiUtil.uploadImageForService(paramName: "images", fileName: "hotel1", image: AppUtil.pickerResult,success: { res in
                                                            imageUrls = res
                                                            
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishLounges(body: chalet, success: { _ in
                                                                viewRouter.currentPage = "ServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                            
                                                        },failure: { _ in
                                                            
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishLounges(body: chalet, success: { _ in
                                                                viewRouter.currentPage = "ServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                        })
                                                    
                                                } else {
                                                    VendorApiUtil.publishLounges(body: chalet, success: { _ in
                                                        viewRouter.currentPage = "ServiceSubmitScreen"
                                                    }, failure: { f in
                                                        showPreloader = false
                                                       errorMessage = f
                                                        togglepopup.toggle()
                                                    })
                                                }
                                                
                                               
                                            }
                                            
                                            else if AppUtil.selectedCategory == "Apartment" || AppUtil.selectedCategory == "Apartments" {
                                                
                                                let chalet = Resort()
                                                chalet.location = serviceManager.addService?.location
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                                let roomsGuest = RoomsGuest()
                                                
                                                roomsGuest.roomType = serviceManager.addService?.unitsAndGuest?.roomType
//                                                roomsGuest.numberOfUnits = String(serviceManager.addService?.unitsAndGuest?.numberUnits ?? 0)
                                                roomsGuest.numberOfAdult = serviceManager.addService?.unitsAndGuest?.numberAdults
                                                roomsGuest.childrenAllowed = serviceManager.addService?.unitsAndGuest?.childrenAllowed
                                                roomsGuest.singleBed = serviceManager.addService?.unitsAndGuest?.singleBed
                                                roomsGuest.bathrooms = serviceManager.addService?.unitsAndGuest?.bathrooms
                                                roomsGuest.livingRoom = serviceManager.addService?.unitsAndGuest?.livingRoom
                                                
                                                chalet.roomsGuest = roomsGuest
                                                chalet.addOns = serviceManager.addService?.addOns
                                                chalet.location = serviceManager.addService?.location
                                                chalet.address = serviceManager.addService?.address
                                                chalet.bookingSetting = serviceManager.addService?.bookingSetting
                                                chalet.available = serviceManager.addService?.available
                                                chalet.check = serviceManager.addService?.check
                                                chalet.kitchen = serviceManager.addService?.kitchen
                                                chalet.roomsbath = serviceManager.addService?.roomsbath
                                                chalet.price = serviceManager.addService?.price
                                                chalet.fav = serviceManager.addService?.fav
                                                chalet.leisure = serviceManager.addService?.leisure
                                                
                                                let description = ResortDescription()
                                                description.areaSqm = serviceManager.addService?.description?.areaSqm
                                                description.images = serviceManager.addService?.description?.images
                                                description.nameInEnglish = serviceManager.addService?.description?.nameInEnglish
                                                description.rules = serviceManager.addService?.description?.rules
                                                description.secondryPhone = serviceManager.addService?.description?.secondryPhone ?? 0
                                                description.safty = serviceManager.addService?.description?.safty
                                                description.nameInArabic = serviceManager.addService?.description?.nameInArabic
                                                description.descriptionInArabic = serviceManager.addService?.description?.descriptionInArabic
                                                description.descriptionInEnglish = serviceManager.addService?.description?.descriptionInEnglish
                                                
                                                
                                                chalet.description = description
                                                
                                                
                                                chalet.outdoors = serviceManager.addService?.outdoors
                                                chalet.reviews = serviceManager.addService?.reviews
                                                chalet.terms = serviceManager.addService?.terms
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                            
                                                if AppUtil.pickerResult.count > 0 {
                                                  
                                                        UserApiUtil.uploadImageForService(paramName: "images", fileName: "hotel1", image: AppUtil.pickerResult,success: { res in
                                                            imageUrls = res
                                                            
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishAppartment(body: chalet, success: { _ in
                                                                viewRouter.currentPage = "ServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                            
                                                        },failure: { _ in
                                                            
                                                                chalet.description?.images = imageUrls
                                                                VendorApiUtil.publishAppartment(body: chalet, success: { _ in
                                                                    viewRouter.currentPage = "ServiceSubmitScreen"
                                                                }, failure: { f in
                                                                    showPreloader = false
                                                                   errorMessage = f
                                                                    togglepopup.toggle()
                                                                })
                                                            
                                                        })
                                                    
                                                } else {
                                                    VendorApiUtil.publishAppartment(body: chalet, success: { _ in
                                                        viewRouter.currentPage = "ServiceSubmitScreen"
                                                    }, failure: { f in
                                                        showPreloader = false
                                                       errorMessage = f
                                                        togglepopup.toggle()
                                                    })
                                                }
                                                
                                           
                                                
                                            }
                                            else if AppUtil.selectedCategory == "Stadium" {
                                                
                                                let chalet = Resort()
                                                chalet.location = serviceManager.addService?.location
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                                
                                                let roomsGuest = RoomsGuest()
                                                roomsGuest.bathrooms = serviceManager.addService?.unitsAndGuest?.bathrooms
                                                roomsGuest.maxGuest = serviceManager.addService?.unitsAndGuest?.maxGuest
                                                roomsGuest.stands = serviceManager.addService?.unitsAndGuest?.stands
                                                roomsGuest.dressingRooms = serviceManager.addService?.unitsAndGuest?.dressingRoom
                                                
                                                chalet.roomsGuest = roomsGuest
                                                chalet.addOns = serviceManager.addService?.addOns
                                                chalet.location = serviceManager.addService?.location
                                                chalet.address = serviceManager.addService?.address
                                                chalet.bookingSetting = serviceManager.addService?.bookingSetting
                                                chalet.available = serviceManager.addService?.available
                                                //chalet.check = serviceManager.addService?.check
                                                chalet.kitchen = serviceManager.addService?.kitchen
                                                chalet.roomsbath = serviceManager.addService?.roomsbath
                                                chalet.price = serviceManager.addService?.price
                                                chalet.fav = serviceManager.addService?.fav
                                                chalet.leisure = serviceManager.addService?.leisure
                                                
                                                let description = ResortDescription()
                                                description.areaSqm = serviceManager.addService?.description?.areaSqm
                                                description.images = serviceManager.addService?.description?.images
                                                description.nameInEnglish = serviceManager.addService?.description?.nameInEnglish
                                                description.secondryPhone = serviceManager.addService?.description?.secondryPhone ?? 0
                                                description.safty = serviceManager.addService?.description?.safty
                                                description.nameInArabic = serviceManager.addService?.description?.nameInArabic
                                                description.descriptionInArabic = serviceManager.addService?.description?.descriptionInArabic
                                                description.descriptionInEnglish = serviceManager.addService?.description?.descriptionInEnglish
                                                
                                                
                                                chalet.description = description
                                                
                                                
                                                
                                                chalet.outdoors = serviceManager.addService?.outdoors
                                                chalet.reviews = serviceManager.addService?.reviews
                                                chalet.terms = serviceManager.addService?.terms
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                                chalet.totalEntities = serviceManager.addService?.totalEntities
                                            
                                                if AppUtil.pickerResult.count > 0 {

                                                        UserApiUtil.uploadImageForService(paramName: "images", fileName: "hotel1", image: AppUtil.pickerResult,success: { res in
                                                            imageUrls = res
                                                           
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishServiceStadium(body: chalet, success: { _ in
                                                                viewRouter.currentPage = "ServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                            
                                                        },failure: { _ in
                                                            
                                                                chalet.description?.images = imageUrls
                                                                VendorApiUtil.publishServiceStadium(body: chalet, success: { _ in
                                                                    viewRouter.currentPage = "ServiceSubmitScreen"
                                                                }, failure: { f in
                                                                    showPreloader = false
                                                                   errorMessage = f
                                                                    togglepopup.toggle()
                                                                })
                                                            
                                                        })
                                                        
                                                    
                                                } else {
                                                    VendorApiUtil.publishServiceStadium(body: chalet, success: { _ in
                                                        viewRouter.currentPage = "ServiceSubmitScreen"
                                                    }, failure: { f in
                                                        showPreloader = false
                                                       errorMessage = f
                                                        togglepopup.toggle()
                                                    })
                                                }
                                            } else if AppUtil.selectedCategory == "Wedding_Halls" {
                                                
                                                let chalet = Resort()
                                                chalet.location = serviceManager.addService?.location
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                                
                                                let roomsGuest = RoomsGuest()
                                               
                                                roomsGuest.section = serviceManager.addService?.unitsAndGuest?.section
                                                roomsGuest.maleRooms = serviceManager.addService?.unitsAndGuest?.maleRooms
                                                roomsGuest.femaleRooms = serviceManager.addService?.unitsAndGuest?.femaleRooms
                                                roomsGuest.maxSittingCapacity = serviceManager.addService?.unitsAndGuest?.maxSittingCapacity
                                                roomsGuest.maxGuest = serviceManager.addService?.unitsAndGuest?.maxGuest
                                                roomsGuest.bathrooms = serviceManager.addService?.unitsAndGuest?.bathrooms
                                                
                                                chalet.roomsGuest = roomsGuest
//                                                chalet.addOns = serviceManager.addService?.addOns
                                                chalet.location = serviceManager.addService?.location
                                                chalet.address = serviceManager.addService?.address
                                                chalet.bookingSetting = serviceManager.addService?.bookingSetting
                                                chalet.available = serviceManager.addService?.available
                                                chalet.check = serviceManager.addService?.check
                                                chalet.kitchen = serviceManager.addService?.kitchen
                                                chalet.roomsbath = serviceManager.addService?.roomsbath
                                                chalet.price = serviceManager.addService?.price
                                                chalet.fav = serviceManager.addService?.fav
                                                chalet.leisure = serviceManager.addService?.leisure
                                                
                                                let description = ResortDescription()
                                               
                                                description.areaSqm = serviceManager.addService?.description?.areaSqm
                                                description.images = serviceManager.addService?.description?.images
                                                description.nameInEnglish = serviceManager.addService?.description?.nameInEnglish
                                                description.rules = serviceManager.addService?.description?.rules
                                                description.secondryPhone = serviceManager.addService?.description?.secondryPhone ?? 0
                                                description.safty = serviceManager.addService?.description?.safty
                                                description.nameInArabic = serviceManager.addService?.description?.nameInArabic
                                                description.descriptionInArabic = serviceManager.addService?.description?.descriptionInArabic
                                                description.descriptionInEnglish = serviceManager.addService?.description?.descriptionInEnglish
                                                
                                                chalet.description = description
                                                
                                                chalet.outdoors = serviceManager.addService?.outdoors
                                                chalet.reviews = serviceManager.addService?.reviews
                                                chalet.terms = serviceManager.addService?.terms
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                                chalet.totalEntities = serviceManager.addService?.totalEntities
                                                
                                                print("description ********* ", description)
                                                print("roomsGuest ********* ", roomsGuest)
                                                print("Param ********* ", chalet)
                                            
                                                if AppUtil.pickerResult.count > 0 {
                                                       UserApiUtil.uploadImageForService(paramName: "images", fileName: "hotel1", image: AppUtil.pickerResult,success: { res in
                                                            imageUrls = res
                                                            print("vdfdgfgf***jkjhkjhj")
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishWeddings(body: chalet, success: { _ in
                                                                print("ikuikukjlkjljkl***jkjhkjhj")
                                                                viewRouter.currentPage = "ServiceSubmitScreen"
                                                            }, failure: { f in
                                                                print("424525353***jkjhkjhj")
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                        },failure: { _ in
                                                           
                                                                chalet.description?.images = imageUrls
                                                                VendorApiUtil.publishWeddings(body: chalet, success: { _ in
                                                                    print("dfdgdfgfg***jkjhkjhj")
                                                                    viewRouter.currentPage = "ServiceSubmitScreen"
                                                                }, failure: { f in
                                                                    print("**************jkjhkjhj")
                                                                    showPreloader = false
                                                                   errorMessage = f
                                                                    togglepopup.toggle()
                                                                })
                                                            
                                                        })
                                                    
                                                } else {
                                                    VendorApiUtil.publishWeddings(body: chalet, success: { _ in
                                                        print("sdfddsggrtytytyrydf")
                                                        viewRouter.currentPage = "ServiceSubmitScreen"
                                                    }, failure: { f in
                                                        print("sdfddsgdf")
                                                        showPreloader = false
                                                       errorMessage = f
                                                        togglepopup.toggle()
                                                    })
                                                }
                                            }
                                            else if AppUtil.selectedCategory == "Chalets" {
                                                
                                                let chalet = Resort()
                                                chalet.location = serviceManager.addService?.location
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                            
                                                let roomsGuest = RoomsGuest()
                                                roomsGuest.indoorSeating = serviceManager.addService?.unitsAndGuest?.indoorSeating
                                                roomsGuest.outdoorSeating = serviceManager.addService?.unitsAndGuest?.outdoorSeating
                                                roomsGuest.bathrooms = serviceManager.addService?.unitsAndGuest?.bathrooms
                                                roomsGuest.singleBed = serviceManager.addService?.unitsAndGuest?.singleBed
                                                roomsGuest.doubleBed = serviceManager.addService?.unitsAndGuest?.doubleBed
                                                roomsGuest.section = serviceManager.addService?.unitsAndGuest?.section
                                                roomsGuest.additionSeating = serviceManager.addService?.unitsAndGuest?.additionSeating
                                                roomsGuest.maxGuest = serviceManager.addService?.unitsAndGuest?.maxGuest
                                                roomsGuest.bedrooms = serviceManager.addService?.unitsAndGuest?.bedrooms
                                                
                                                chalet.roomsGuest = roomsGuest
                                                chalet.addOns = serviceManager.addService?.addOns
                                                chalet.location = serviceManager.addService?.location
                                                chalet.address = serviceManager.addService?.address
                                                chalet.bookingSetting = serviceManager.addService?.bookingSetting
                                                chalet.available = serviceManager.addService?.available
                                                chalet.check = serviceManager.addService?.check
                                                chalet.kitchen = serviceManager.addService?.kitchen
                                                chalet.roomsbath = serviceManager.addService?.roomsbath
                                                chalet.price = serviceManager.addService?.price
                                                chalet.fav = serviceManager.addService?.fav
                                                chalet.leisure = serviceManager.addService?.leisure
                                                
                                                let description = ResortDescription()
                                                description.areaSqm = serviceManager.addService?.description?.areaSqm
                                                description.images = serviceManager.addService?.description?.images
                                                description.nameInEnglish = serviceManager.addService?.description?.nameInEnglish
                                                description.rules = serviceManager.addService?.description?.rules
                                                description.secondryPhone = serviceManager.addService?.description?.secondryPhone ?? 0
                                                description.safty = serviceManager.addService?.description?.safty
                                                description.nameInArabic = serviceManager.addService?.description?.nameInArabic
                                                description.descriptionInArabic = serviceManager.addService?.description?.descriptionInArabic
                                                description.descriptionInEnglish = serviceManager.addService?.description?.descriptionInEnglish
                                                
                                                chalet.description = description
                                                
                                                
                                                chalet.outdoors = serviceManager.addService?.outdoors
                                                chalet.reviews = serviceManager.addService?.reviews
                                                chalet.terms = serviceManager.addService?.terms
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                             
                                                if AppUtil.pickerResult.count > 0 {
                                                
                                                       
                                                    UserApiUtil.uploadImageForService(paramName: "images", fileName: "hotel1", image: AppUtil.pickerResult,success: { res in
                                                            imageUrls = res
                                                            
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishChalet(body: chalet, success: { _ in
                                                                viewRouter.currentPage = "ServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                        },failure: { _ in
                                                            
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishChalet(body: chalet, success: { _ in
                                                                viewRouter.currentPage = "ServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                        })
                                                    
                                                } else {
                                                    VendorApiUtil.publishChalet(body: chalet, success: { _ in
                                                        viewRouter.currentPage = "ServiceSubmitScreen"
                                                    }, failure: { f in
                                                        showPreloader = false
                                                       errorMessage = f
                                                        togglepopup.toggle()
                                                    })
                                                }
                                                
                                            }
                                        }
                                    }
                                Spacer()
                            }.padding(.horizontal)
                                .padding(.vertical)
                        }
                    }
                }
                
                //   }
                BottomNavigation()
                Spacer()
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

struct ReviewService_Previews: PreviewProvider {
    static var previews: some View {
        ReviewService()
    }
}
