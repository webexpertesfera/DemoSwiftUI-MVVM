//
//  EditReviewService.swift
//  SmartBookings
//
//  Created by Esfera-Macmini on 31/07/23.
//

import SwiftUI

struct EditReviewService: View {
    
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
                                                Text(serviceManager.editserviceObject?.description?.nameInEnglish ?? "")
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
                                                UserApiUtil.getVendorProfile(id: serviceManager.editserviceObject?.vender ?? "", success: { res in
                                                    AppUtil.selectedVendor = res
                                                    AppUtil.reviews = serviceManager.editserviceObject?.reviews ?? []
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
                                                Text(String(serviceManager.editserviceObject?.unitsAndGuest?.doubleBed ?? 0))
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
                                                Text(String(serviceManager.editserviceObject?.unitsAndGuest?.bathrooms ?? 0))
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
                                                Text(String(serviceManager.editserviceObject?.unitsAndGuest?.singleBed ?? 0))
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
                                            Text(serviceManager.editserviceObject?.address?.address ?? "")
                                                .font(Font.custom("poppins", size: 8))
                                                .foregroundColor(Color(textColor).opacity(0.5))
                                                .fontWeight(.regular)
                                            
                                        }
                                        Spacer()
                                        VStack{
                                            Image("SqFitSize")
                                                .resizable()
                                                .frame(width: 30, height: 30, alignment: .center)
                                            Text(String(serviceManager.editserviceObject?.description?.areaSqm ?? 0))
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
                                                if ameneties[item] == "Water Games" && ((serviceManager.editserviceObject?.leisure?.waterGames) != nil && serviceManager.editserviceObject?.leisure?.waterGames != false) {
                                                    FacilitiesCard(imageName: "Water_games", facilityName: "Water Games", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "Air Conditioning" && ((serviceManager.editserviceObject?.leisure?.airConditioning) != nil && serviceManager.editserviceObject?.leisure?.airConditioning != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "Air Conditioning", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "Air Slider" && ((serviceManager.editserviceObject?.leisure?.airSlider) != nil && serviceManager.editserviceObject?.leisure?.airSlider != false) {
                                                    FacilitiesCard(imageName: "wifi", facilityName: "Air Slider", callback: {

                                                    })
                                                }
                                                
                                                if ameneties[item] == "Sand Games" && ((serviceManager.editserviceObject?.leisure?.sandGames) != nil && serviceManager.editserviceObject?.leisure?.sandGames != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "Sand Games", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "wifi" && ((serviceManager.editserviceObject?.leisure?.wifi) != nil && serviceManager.editserviceObject?.leisure?.wifi != false) {
                                                    FacilitiesCard(imageName: "wifi", facilityName: "Wifi", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "tv" && ((serviceManager.editserviceObject?.leisure?.tv) != nil && serviceManager.editserviceObject?.leisure?.tv != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "TV", callback: {
                                                        
                                                    })
                                                }
                                               /*
                                                if ameneties[item] == "Gym" && ((serviceManager.selectedService?.leisure?.gym) != nil && serviceManager.selectedService?.leisure?.gym != false) {
                                                    FacilitiesCard(imageName: "billboardGray", facilityName: "Gym", callback: {
                                                        
                                                    })
                                                }
                                                */
                                                if ameneties[item] == "coffee" && ((serviceManager.editserviceObject?.kitchen?.coffeeMachine) != nil && serviceManager.editserviceObject?.kitchen?.coffeeMachine != false) {
                                                    FacilitiesCard(imageName: "Cup", facilityName: "Coffee", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "parking" && ((serviceManager.editserviceObject?.leisure?.parking) != nil  && serviceManager.editserviceObject?.leisure?.parking != false)
                                                   {
                                                    
                                                    FacilitiesCard(imageName: "Parking_new", facilityName: "Parking", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Billiard" && ((serviceManager.editserviceObject?.leisure?.billard) != nil && serviceManager.editserviceObject?.leisure?.billard != false) {
                                                    
                                                    FacilitiesCard(imageName: "billboardGray", facilityName: "Billiard", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Steam Bath" && ((serviceManager.editserviceObject?.leisure?.steamBath) != nil && serviceManager.editserviceObject?.leisure?.steamBath != false) {
                                                    FacilitiesCard(imageName: "steambath", facilityName: "Steam Bath", callback: {
                                                        
                                                    })
                                                }
                                            }
                                            
                                            Group{
                                                
                                                if ameneties[item] == "swimming With Water Games" && ((serviceManager.editserviceObject?.leisure?.swimmingWithWaterGames) != nil && serviceManager.editserviceObject?.leisure?.swimmingWithWaterGames != false) {
                                                    FacilitiesCard(imageName: "Water_games", facilityName: "swimming With Water Games", callback: {

                                                    })
                                                }
                                                /*
                                                if ameneties[item] == "Gym" && ((serviceManager.selectedService?.leisure?.gym) != nil && serviceManager.selectedService?.leisure?.gym != false) {
                                                    FacilitiesCard(imageName: "billboardGray", facilityName: "Gym", callback: {
                                                        
                                                    })
                                                }
                                                */
                                                if ameneties[item] == "SaftyBox" && ((serviceManager.editserviceObject?.leisure?.saftyBox) != nil && serviceManager.editserviceObject?.leisure?.saftyBox != false) {
                                                    FacilitiesCard(imageName: "safety-box", facilityName: "SaftyBox", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "Hairstylist" && ((serviceManager.editserviceObject?.leisure?.hairStylist) != nil && serviceManager.editserviceObject?.leisure?.hairStylist != false) {
                                                    FacilitiesCard(imageName: "wifi", facilityName: "Hairstylist", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "SPA" && ((serviceManager.editserviceObject?.leisure?.spa) != nil && serviceManager.editserviceObject?.leisure?.spa != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "SPA", callback: {

                                                    })
                                                }

                                                if ameneties[item] == "Tennis Court" && ((serviceManager.editserviceObject?.leisure?.tennisCourt) != false && serviceManager.editserviceObject?.leisure?.tennisCourt != nil ) {
                                                    
                                                    FacilitiesCard(imageName: "tennisGray", facilityName: "Tennis Court", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "playground" && ((serviceManager.editserviceObject?.leisure?.playground) != false && serviceManager.editserviceObject?.leisure?.playground != nil) {
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
                                                
                                                if ameneties[item] == "24 Hours Access" && (serviceManager.editserviceObject?.leisure?.accessInHours != nil && serviceManager.editserviceObject?.leisure?.accessInHours == 24 ) {
                                                    FacilitiesCard(imageName: "24hourGray", facilityName: "24-Hour", callback: {
                                                        
                                                    })
                                                }
                                                
                                               
                                                
                                                if ameneties[item] == "Wheelchair Access" && ((serviceManager.editserviceObject?.leisure?.billard) != false && serviceManager.editserviceObject?.leisure?.billard != nil) {
                                                    
                                                    
                                                    FacilitiesCard(imageName: "wheelchairG", facilityName: "Wheelchair Access", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Private Entrance" && ((serviceManager.editserviceObject?.leisure?.privateEntrance) != false && serviceManager.editserviceObject?.leisure?.privateEntrance != nil) {
                                                    
                                                    
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
                                                
                                                if ameneties[item] == "Doorman" && ((serviceManager.editserviceObject?.leisure?.doorman) != false && serviceManager.editserviceObject?.leisure?.doorman != nil)  {
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
                                                if ameneties[item] == "Indoor Swimming Pool" && ((serviceManager.editserviceObject?.leisure?.indoorSwimmingPool) != nil && serviceManager.editserviceObject?.leisure?.indoorSwimmingPool != false) {
                                                    FacilitiesCard(imageName: "indoorSwimingpool", facilityName: "Indoor Swimming Pool", callback: {
                                                        
                                                    })
                                                }

                                                if ameneties[item] == "Speakers" && ((serviceManager.editserviceObject?.leisure?.speakers) != nil && serviceManager.editserviceObject?.leisure?.speakers != false) {
                                                    FacilitiesCard(imageName: "Speakers", facilityName: "Speakers", callback: {

                                                    })
                                                }
//
                                                if ameneties[item] == "LaserLights" && ((serviceManager.addService?.leisure?.laserLights) != nil && serviceManager.editserviceObject?.leisure?.laserLights != false) {
                                                    FacilitiesCard(imageName: "Rectangle 81", facilityName: "LaserLights", callback: {

                                                    })
                                                }

                                                
                                                if ameneties[item] == "Outdoor Swimming Pool" && ((serviceManager.editserviceObject?.leisure?.outdoorSwimmingPool) != nil && serviceManager.editserviceObject?.leisure?.outdoorSwimmingPool != false) {
                                                    FacilitiesCard(imageName: "outdoorSwimingpool", facilityName: "Outdoor Swimming Pool", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Swimming Pool Heater" && ((serviceManager.editserviceObject?.leisure?.swimmingPoolHeater) != nil && serviceManager.editserviceObject?.leisure?.swimmingPoolHeater != false) {
                                                    FacilitiesCard(imageName: "swimingpool", facilityName: "Swimming Pool Heater", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Air Hockey" && ((serviceManager.editserviceObject?.leisure?.airHockeyTable) != nil && serviceManager.editserviceObject?.leisure?.airHockeyTable != false) {
                                                    FacilitiesCard(imageName: "airhockey", facilityName: "Air Hockey", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Trampoline" && ((serviceManager.editserviceObject?.leisure?.trampoline) != nil && serviceManager.editserviceObject?.leisure?.trampoline != false) {
                                                    FacilitiesCard(imageName: "trampoline", facilityName: "Trampoline", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Hot Tub" && ((serviceManager.editserviceObject?.leisure?.hotTub) != nil && serviceManager.editserviceObject?.leisure?.hotTub != false) {
                                                    FacilitiesCard(imageName: "hottub", facilityName: "Hot Tub", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Vollyball" && ((serviceManager.editserviceObject?.leisure?.volleyBall) != nil && serviceManager.editserviceObject?.leisure?.volleyBall != false) {
                                                    FacilitiesCard(imageName: "vollyball", facilityName: "Vollyball", callback: {
                                                        
                                                    })
                                                }
                                                
                                                if ameneties[item] == "Soccer Field" && ((serviceManager.editserviceObject?.leisure?.volleyBall) != nil && serviceManager.editserviceObject?.leisure?.volleyBall != false) {
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
//                                            Text(serviceManager.addService?.bookingSetting?.canellationPolicy ?? "")
//                                                .foregroundColor(Color("000000"))
//                                                .font(Font.custom("poppins", size: 16))
//                                                .fontWeight(.regular)
//                                                .multilineTextAlignment(.leading)
//                                                .padding(.top,5)
//
//                                            Spacer()
                                            
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
                                            
                                            
                                            
//
//                                            if serviceManager.addService?.bookingSetting?.canellationPolicy ?? "" == "Flexible"{
//                                                Text("The flexible Cancellation Policy allows the customer to cancel their reservation up to 24 hours prior to check-in time and receive a full refaund.")
//                                                    .foregroundColor(Color("AAAAAA"))
//                                                    .font(Font.custom("poppins", size: 13))
//                                                    .fontWeight(.regular)
//                                                    .multilineTextAlignment(.leading)
//
//                                            } else if serviceManager.addService?.bookingSetting?.canellationPolicy ?? "" == "Moderate"{
//                                                Text("Moderate Cancellation polcy allows guests to cancel up to 3 days prior to check-in date and recieve fulll refund.")
//                                                    .foregroundColor(Color("AAAAAA"))
//                                                    .font(Font.custom("poppins", size: 13))
//                                                    .fontWeight(.regular)
//                                                    .multilineTextAlignment(.leading)
//
//                                            } else if serviceManager.addService?.bookingSetting?.canellationPolicy ?? "" == "Strict"{
//                                                Text("Strict cancellation policy allows guests to cancel up to 7 days prior to check-in date and receive a full refund")
//                                                    .foregroundColor(Color("AAAAAA"))
//                                                    .font(Font.custom("poppins", size: 13))
//                                                    .fontWeight(.regular)
//                                                    .multilineTextAlignment(.leading)
//
//                                            } else if serviceManager.addService?.bookingSetting?.canellationPolicy ?? "" == "Non_refundable"{
//                                                Text("Non refundable cancellation policy allows guests to cancel the reservation but booking fees are non-refundable")
//                                                    .foregroundColor(Color("AAAAAA"))
//                                                    .font(Font.custom("poppins", size: 13))
//                                                    .fontWeight(.regular)
//                                                    .multilineTextAlignment(.leading)
//
//                                            }
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
                                    } else {
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
                                        Text("Edit Service")
                                            .font(Font.custom("poppins", size: 16))
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
                                                        VendorApiUtil.publishServiceHotelEdit(id: AppUtil.selectedID,body: serviceManager.addService!, success:{ _ in
                                                            viewRouter.currentPage = "EditServiceSubmitScreen"
                                                        }, failure: { f in
                                                            showPreloader = false
                                                           errorMessage = f
                                                            togglepopup.toggle()
                                                        })
                                                        
                                                        
                                                    },failure: { _ in
                                                            serviceManager.addService?.description?.images = imageUrls
                                                            print("gdfgfgghhgf", imageUrls)
                                                            VendorApiUtil.publishServiceHotelEdit(id: AppUtil.selectedID,body: serviceManager.addService!, success:{ _ in
                                                                viewRouter.currentPage = "EditServiceSubmitScreen"
                                                                print("Service manager hotel", serviceManager.addService ?? "")
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                    })
                                                }
                                                else {
                                                    VendorApiUtil.publishServiceHotelEdit(id: AppUtil.selectedID,body: serviceManager.addService!, success: { _ in
                                                        viewRouter.currentPage = "EditServiceSubmitScreen"
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
                                                        VendorApiUtil.publishServiceCampEdit(id: AppUtil.selectedID,body: serviceManager.addService!, success:{ _ in
                                                            viewRouter.currentPage = "EditServiceSubmitScreen"
                                                        }, failure: { f in
                                                            showPreloader = false
                                                           errorMessage = f
                                                            togglepopup.toggle()
                                                        })
                                                        
                                                    },failure: { _ in
                                                    
                                                            serviceManager.addService?.description?.images = imageUrls
                                                            VendorApiUtil.publishServiceCampEdit(id: AppUtil.selectedID,body: serviceManager.addService!, success:{ _ in
                                                                viewRouter.currentPage = "EditServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                
                                                    })
                                                }
                                                else {
                                                    VendorApiUtil.publishServiceCampEdit(id: AppUtil.selectedID,body: serviceManager.addService!, success: { _ in
                                                        viewRouter.currentPage = "EditServiceSubmitScreen"
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
                                                chalet.location?.type = "Point"
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
                                                chalet.location?.type = "Point"
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
//                                                description.secondryPhone = String(serviceManager.addService?.description?.secondryPhone ?? 0)
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
                                                            VendorApiUtil.publishResortEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                                viewRouter.currentPage = "EditServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                            
                                                        },failure: { _ in
                                                           
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishResortEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                                viewRouter.currentPage = "EditServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                        })
                                                   
                                                } else {
                                                    VendorApiUtil.publishResortEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                        viewRouter.currentPage = "EditServiceSubmitScreen"
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
                                                chalet.location?.type = "Point"
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
                                                chalet.location?.type = "Point"
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
//                                                description.secondryPhone = String(serviceManager.addService?.description?.secondryPhone ?? 0)
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
                                                        VendorApiUtil.publishFarmsEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                            viewRouter.currentPage = "EditServiceSubmitScreen"
                                                        }, failure: { f in
                                                            showPreloader = false
                                                           errorMessage = f
                                                            togglepopup.toggle()
                                                        })
                                                        
                                                        
                                                    },failure: { _ in
                                                        
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishFarmsEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                                viewRouter.currentPage = "EditServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                        
                                                        })
                                                    
                                                } else {
                                                    VendorApiUtil.publishFarmsEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                        viewRouter.currentPage = "EditServiceSubmitScreen"
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
                                                chalet.location?.type = "Point"
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
                                                chalet.location?.type = "Point"
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
//                                                description.secondryPhone = String(serviceManager.addService?.description?.secondryPhone ?? 0)
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
                                                            VendorApiUtil.publishLoungesEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                                viewRouter.currentPage = "EditServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                            
                                                        },failure: { _ in
                                                            
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishLoungesEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                                viewRouter.currentPage = "EditServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                        })
                                                    
                                                } else {
                                                    VendorApiUtil.publishLoungesEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                        viewRouter.currentPage = "EditServiceSubmitScreen"
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
                                                chalet.location?.type = "Point"
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
                                                chalet.location?.type = "Point"
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
//                                                description.secondryPhone = String(serviceManager.addService?.description?.secondryPhone ?? 0)
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
                                                            VendorApiUtil.publishAppartmentEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                                viewRouter.currentPage = "EditServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                            
                                                        },failure: { _ in
                                                            
                                                                chalet.description?.images = imageUrls
                                                                VendorApiUtil.publishAppartmentEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                                    viewRouter.currentPage = "EditServiceSubmitScreen"
                                                                }, failure: { f in
                                                                    showPreloader = false
                                                                   errorMessage = f
                                                                    togglepopup.toggle()
                                                                })
                                                            
                                                        })
                                                    
                                                } else {
                                                    VendorApiUtil.publishAppartmentEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                        viewRouter.currentPage = "EditServiceSubmitScreen"
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
                                                chalet.location?.type = "Point"
                                                chalet.categoryId = serviceManager.addService?.categoryId
                                                
                                                let roomsGuest = RoomsGuest()
                                                roomsGuest.bathrooms = serviceManager.addService?.unitsAndGuest?.bathrooms
                                                roomsGuest.maxGuest = serviceManager.addService?.unitsAndGuest?.maxGuest
                                                roomsGuest.stands = serviceManager.addService?.unitsAndGuest?.stands
                                                roomsGuest.dressingRooms = serviceManager.addService?.unitsAndGuest?.dressingRoom
                                                
                                                chalet.roomsGuest = roomsGuest
                                                chalet.addOns = serviceManager.addService?.addOns
                                                chalet.location = serviceManager.addService?.location
                                                chalet.location?.type = "Point"
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
//                                                description.secondryPhone = String(serviceManager.addService?.description?.secondryPhone ?? 0)
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
                                                            VendorApiUtil.publishServiceStadiumEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                                viewRouter.currentPage = "EditServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                            
                                                        },failure: { _ in
                                                            
                                                                chalet.description?.images = imageUrls
                                                                VendorApiUtil.publishServiceStadiumEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                                    viewRouter.currentPage = "EditServiceSubmitScreen"
                                                                }, failure: { f in
                                                                    showPreloader = false
                                                                   errorMessage = f
                                                                    togglepopup.toggle()
                                                                })
                                                            
                                                        })
                                                        
                                                    
                                                } else {
                                                    VendorApiUtil.publishServiceStadiumEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
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
                                                chalet.location?.type = "Point"
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
                                                chalet.location?.type = "Point"
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
//                                                description.secondryPhone = String(serviceManager.addService?.description?.secondryPhone ?? 0)
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
                                                            VendorApiUtil.publishWeddingsEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                                print("ikuikukjlkjljkl***jkjhkjhj")
                                                                viewRouter.currentPage = "EditServiceSubmitScreen"
                                                            }, failure: { f in
                                                                print("424525353***jkjhkjhj")
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                        },failure: { _ in
                                                           
                                                                chalet.description?.images = imageUrls
                                                                VendorApiUtil.publishWeddingsEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                                    print("dfdgdfgfg***jkjhkjhj")
                                                                    viewRouter.currentPage = "EditServiceSubmitScreen"
                                                                }, failure: { f in
                                                                    print("**************jkjhkjhj")
                                                                    showPreloader = false
                                                                   errorMessage = f
                                                                    togglepopup.toggle()
                                                                })
                                                            
                                                        })
                                                    
                                                } else {
                                                    VendorApiUtil.publishWeddingsEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                        print("sdfddsggrtytytyrydf")
                                                        viewRouter.currentPage = "EditServiceSubmitScreen"
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
                                                chalet.location?.type = "Point"
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
                                                chalet.location?.type = "Point"
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
//                                                description.secondryPhone = String(serviceManager.addService?.description?.secondryPhone ?? 0)
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
                                                            VendorApiUtil.publishChaletEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                                viewRouter.currentPage = "EditServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                        },failure: { _ in
                                                            
                                                            chalet.description?.images = imageUrls
                                                            VendorApiUtil.publishChaletEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                                viewRouter.currentPage = "EditServiceSubmitScreen"
                                                            }, failure: { f in
                                                                showPreloader = false
                                                               errorMessage = f
                                                                togglepopup.toggle()
                                                            })
                                                            
                                                        })
                                                    
                                                } else {
                                                    VendorApiUtil.publishChaletEdit(id: AppUtil.selectedID,body: chalet, success: { _ in
                                                        viewRouter.currentPage = "EditServiceSubmitScreen"
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

struct EditReviewService_Previews: PreviewProvider {
    static var previews: some View {
        EditReviewService()
    }
}


//publishServiceHotelEdit
//publishServiceCampEdit
//    publishResortEdit
//publishFarmsEdit
//    publishLoungesEdit
//    publishAppartmentEdit
//    publishServiceStadiumEdit
//    publishWeddingsEdit
//    publishChaletEdit
