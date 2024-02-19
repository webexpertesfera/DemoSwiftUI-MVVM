////
////  AmenitiesScreen.swift
////  SmartBookings
////
////  Created by Sheheryar on 07/08/2022.
////
//
//import SwiftUI
//
//struct AmenitiesScreen: View {
//    @EnvironmentObject var viewRouter: ViewRouter
//    @EnvironmentObject var serviceManager: ServiceManager
//    let columns = [
//
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//
//        ]
//    var sportsTypes: [String] = ["gym","Billard","tennisCourt","airHockeyTable","soccerField","volleyBall","Trampoline","airSlider","sandGames","waterGames"]
//    var sportsImages : [String] = ["gym","paperPen","tennisCourt","airhockey","soccerfield","vollyball","trampoline","trampoline","trampoline","Water_games"]
//
//    var Leisure: [String] = ["wifi","tv","playground","steamBath","indoorSwimmingPool","outdoorSwimmingPool","swimmingPoolHeater","hotTub", "airConditioning","Camps","elevator","stage", "speakers","laserLights", "Hairstylist", "spa", "swimmingWithWaterGames"]
//
//    var leisureImages: [String] = ["wifi","Rectangle 81","indoorSwimingpool","outdoorSwimingpool","swimingpool","playground","hottub","wheelchair","hottub","trampoline","Elevator_new","hottub","Speakers","doorman","hottub","trampoline","Water_games"]
//
//    var HomeAmenities: [String] = ["accessInHours","weelChaireAccess","privateEntrance","doorman","parking","saftyBox","running","lamPost"]
//    var homeImages : [String] = ["24hour","wheelchair","privateentrance","doorman","Parking_new","safety-box","Parking_new","safety-box"]
//
//    @State var sportsCheck: [Bool] = [false,false,false,false,false,false,false,false,false,false]
//    @State var leisureCheck: [Bool] = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
//    @State var HomeAmenitiesCheck: [Bool] = [false,false,false,false,false,false,false,false]
//
//    var body: some View {
//        ZStack {
//            VStack {
//                TopNavigation(titleText: "Basic Information")
//                ScrollView(showsIndicators:false) {
//                    VStack{
//                        VStack{
//                            HStack{
//                                Text("Amenities")
//                                    .foregroundColor(Color("000000").opacity(0.8))
//                                    .font(Font.custom("poppins", size: 17))
//                                    .fontWeight(.medium)
//                                    .multilineTextAlignment(.center)
//                                Spacer()
//                            }.padding(.horizontal)
//
//                            HStack{
//                                Text("Please select the amenities that are available")
//                                    .foregroundColor(Color("000000").opacity(0.6))
//                                    .font(Font.custom("poppins", size: 14))
//                                    .fontWeight(.regular)
//                                    .multilineTextAlignment(.center)
//                                Spacer()
//                            }.padding(.horizontal)
//                                .padding(.top,2)
//                        }.padding(.vertical)
//
//                        VStack {
//
//                            if AppUtil.selectedCategory == "Chalets" || AppUtil.selectedCategory == "Chalet" || AppUtil.selectedCategory == "Resorts" || AppUtil.selectedCategory == "Farms" || AppUtil.selectedCategory == "Lounges"{
//                                HStack{
//                                    Text("Sports")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 18))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< sportsTypes.count, id: \.self) {item in
//                                        AmenetiesCard(callback: {
//                                            constructbody(value: sportsTypes[item])
//                                        }, text: sportsTypes[item], imageName: sportsImages[item], check: $sportsCheck[item])
//                                    }
//                                }
//
//                                HStack{
//                                    Text("Leisure")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 17))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< Leisure.count, id: \.self) { item in
//                                        if Leisure[item] != "swimmingPoolHeater" &&  Leisure[item] != "Camps" && Leisure[item] != "Hairstylist" && Leisure[item] != "spa" && Leisure[item] != "swimmingWithWaterGames"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: Leisure[item])
//                                            }, text: Leisure[item], imageName: leisureImages[item], check: $leisureCheck[item])
//                                        }
//                                    }
//                                }
//
//                                HStack {
//                                    Text("Home Amenities")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 17))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< HomeAmenities.count, id: \.self) { item in
//                                        if HomeAmenities[item] != "running"  && HomeAmenities[item] != "lamPost"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: HomeAmenities[item])
//                                            }, text: HomeAmenities[item], imageName: homeImages[item], check: $HomeAmenitiesCheck[item])
//                                        }
//                                    }
//                                }
//                            }
//
//                            if AppUtil.selectedCategory == "Stadium" {
//                                HStack{
//                                    Text("Sports")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 18))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< sportsTypes.count, id: \.self) {item in
//                                        if sportsTypes[item] != "airSlider" && sportsTypes[item] != "sandGames" && sportsTypes[item] != "waterGames"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: sportsTypes[item])
//                                            }, text: sportsTypes[item], imageName: sportsImages[item], check: $sportsCheck[item])
//                                        }
//                                    }
//                                }
//
//                                HStack {
//                                    Text("Home Amenities")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 17))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< HomeAmenities.count, id: \.self) { item in
//                                        if HomeAmenities[item] != "accessInHours" && HomeAmenities[item] != "privateEntrance" && HomeAmenities[item] != "saftyBox"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: HomeAmenities[item])
//                                            }, text: HomeAmenities[item], imageName: homeImages[item], check: $HomeAmenitiesCheck[item])
//                                        }
//                                    }
//                                }
//                            }
//
//                            if AppUtil.selectedCategory == "Apartment" {
//                                HStack{
//                                    Text("Sports")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 18))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< sportsTypes.count, id: \.self) {item in
//                                        if sportsTypes[item] != "soccerField" && sportsTypes[item] != "volleyBall" && sportsTypes[item] != "Trampoline" && sportsTypes[item] != "airSlider" && sportsTypes[item] != "sandGames" && sportsTypes[item] != "waterGames"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: sportsTypes[item])
//                                            }, text: sportsTypes[item], imageName: sportsImages[item], check: $sportsCheck[item])
//                                        }
//                                    }
//                                }
//
//                                HStack{
//                                    Text("Leisure")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 17))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< Leisure.count, id: \.self) { item in
//                                        if Leisure[item] != "swimmingPoolHeater" &&  Leisure[item] != "Camps" && Leisure[item] != "stage" && Leisure[item] != "laserLights" && Leisure[item] != "swimmingWithWaterGames"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: Leisure[item])
//                                            }, text: Leisure[item], imageName: leisureImages[item], check: $leisureCheck[item])
//                                        }
//                                    }
//                                }
//                                HStack {
//                                    Text("Home Amenities")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 17))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< HomeAmenities.count, id: \.self) { item in
//                                        if HomeAmenities[item] != "running"  && HomeAmenities[item] != "lamPost"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: HomeAmenities[item])
//                                            }, text: HomeAmenities[item], imageName: homeImages[item], check: $HomeAmenitiesCheck[item])
//                                        }
//                                    }
//                                }
//                            }
//
//                            if AppUtil.selectedCategory == "Camps" {
//                                HStack{
//                                    Text("Sports")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 18))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< sportsTypes.count, id: \.self) {item in
//                                        if sportsTypes[item] != "gym" && sportsTypes[item] != "airHockeyTable" && sportsTypes[item] != "waterGames"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: sportsTypes[item])
//                                            }, text: sportsTypes[item], imageName: sportsImages[item], check: $sportsCheck[item])
//                                        }
//                                    }
//                                }
//                                HStack{
//                                    Text("Leisure")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 17))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< Leisure.count, id: \.self) { item in
//                                        if Leisure[item] != "steamBath" && Leisure[item] != "indoorSwimmingPool" && Leisure[item] != "outdoorSwimmingPool" && Leisure[item] != "swimmingPoolHeater" && Leisure[item] != "hotTub" && Leisure[item] != "Camps" && Leisure[item] != "elevator" && Leisure[item] != "stage" &&  Leisure[item] != "Hairstylist" && Leisure[item] != "spa" && Leisure[item] != "swimmingWithWaterGames" {
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: Leisure[item])
//                                            }, text: Leisure[item], imageName: leisureImages[item], check: $leisureCheck[item])
//                                        }
//                                    }
//                                }
//                                HStack {
//                                    Text("Home Amenities")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 17))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< HomeAmenities.count, id: \.self) { item in
//                                        if HomeAmenities[item] != "running" && HomeAmenities[item] != "lamPost" && HomeAmenities[item] != "saftyBox"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: HomeAmenities[item])
//                                            }, text: HomeAmenities[item], imageName: homeImages[item], check: $HomeAmenitiesCheck[item])
//                                        }
//                                    }
//                                }
//                            }
//
//                            if AppUtil.selectedCategory == "Wedding_Halls" {
//                                HStack{
//                                    Text("Leisure")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 17))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< Leisure.count, id: \.self) { item in
//                                        if Leisure[item] != "steamBath" &&  Leisure[item] != "indoorSwimmingPool" && Leisure[item] != "outdoorSwimmingPool" && Leisure[item] != "swimmingPoolHeater" && Leisure[item] != "hotTub" && Leisure[item] != "Camps" && Leisure[item] != "Hairstylist" && Leisure[item] != "spa" && Leisure[item] != "swimmingWithWaterGames"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: Leisure[item])
//                                            }, text: Leisure[item], imageName: leisureImages[item], check: $leisureCheck[item])
//                                        }
//                                    }
//                                }
//
//                                HStack {
//                                    Text("Home Amenities")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 17))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< HomeAmenities.count, id: \.self) { item in
//                                        if HomeAmenities[item] != "running" && HomeAmenities[item] != "lamPost"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: HomeAmenities[item])
//                                            }, text: HomeAmenities[item], imageName: homeImages[item], check: $HomeAmenitiesCheck[item])
//                                        }
//                                    }
//                                }
//                            }
//
//                            if AppUtil.selectedCategory == "Hotel"{
//                                HStack{
//                                    Text("Sports")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 18))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< sportsTypes.count, id: \.self) {item in
//                                        if sportsTypes[item] != "soccerField" && sportsTypes[item] != "volleyBall" && sportsTypes[item] != "Trampoline" && sportsTypes[item] != "airSlider" && sportsTypes[item] != "sandGames" && sportsTypes[item] != "waterGames"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: sportsTypes[item])
//                                            }, text: sportsTypes[item], imageName: sportsImages[item], check: $sportsCheck[item])
//                                        }
//                                    }
//                                }
//                                HStack{
//                                    Text("Leisure")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 17))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< Leisure.count, id: \.self) { item in
//                                        if Leisure[item] != "swimmingPoolHeater" &&  Leisure[item] != "Camps" && Leisure[item] != "stage" && Leisure[item] != "laserLights"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: Leisure[item])
//                                            }, text: Leisure[item], imageName: leisureImages[item], check: $leisureCheck[item])
//                                        }
//                                    }
//                                }
//                                HStack {
//                                    Text("Home Amenities")
//                                        .foregroundColor(Color("000000").opacity(0.8))
//                                        .font(Font.custom("poppins", size: 17))
//                                        .fontWeight(.medium)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }.padding(.horizontal)
//                                LazyVGrid(columns: columns, spacing: 20) {
//                                    ForEach(0 ..< HomeAmenities.count, id: \.self) { item in
//                                        if HomeAmenities[item] != "running" && HomeAmenities[item] != "lamPost"{
//                                            AmenetiesCard(callback: {
//                                                constructbody(value: HomeAmenities[item])
//                                            }, text: HomeAmenities[item], imageName: homeImages[item], check: $HomeAmenitiesCheck[item])
//                                        }
//                                    }
//                                }
//                            }
//
//                            LoginButton(title: "Done", callback: {
//                                if AppUtil.selectedCategory != "Farms" && AppUtil.selectedCategory != "Lounges" && AppUtil.selectedCategory != "Wedding_Halls" && AppUtil.selectedCategory != "Resorts"  &&  AppUtil.selectedCategory != "Chalets" {
////                                    AppUtil.addServiceLeisure.parking = true
//                                }
//                                serviceManager.addService?.leisure = AppUtil.addServiceLeisure
//                                AppUtil.addserviceObject?.leisure = AppUtil.addServiceLeisure
//
////                                serviceManager.EditServiceShowdate?.leisure = AppUtil.addServiceLeisure
////                                AppUtil.EditServiceShowdate?.leisure = AppUtil.addServiceLeisure
//                                viewRouter.currentPage = "AddService"
//                            }).padding(.vertical,10)
//                        }.padding(.vertical)
//                    }
//                }
//                Spacer()
//            }
//        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
//            .ignoresSafeArea(.all)
//            .background(Color("F2F5F9"))
//      }
//
//    func constructbody(value : String) {
//            if value == "spa" {
//                if AppUtil.addServiceLeisure.spa == nil && (AppUtil.addServiceLeisure.spa ?? false) {
//                    AppUtil.addServiceLeisure.spa = true
//                } else {
//                    AppUtil.addServiceLeisure.spa = false
//                }
//            }
//
//            if value == "saftyBox" {
//                if AppUtil.addServiceLeisure.saftyBox == nil && !(AppUtil.addServiceLeisure.saftyBox ?? false) {
//                    AppUtil.addServiceLeisure.saftyBox = true
//                } else {
//                    AppUtil.addServiceLeisure.saftyBox = false
//                }
//            }
//
//            if value == "swimmingWithWaterGames" {
//                if AppUtil.addServiceLeisure.swimmingWithWaterGames == nil && !(AppUtil.addServiceLeisure.swimmingWithWaterGames ?? false) {
//                    AppUtil.addServiceLeisure.swimmingWithWaterGames = true
//                } else {
//                    AppUtil.addServiceLeisure.swimmingWithWaterGames = false
//                }
//            }
//
//            if value == "laserLights" {
//                if AppUtil.addServiceLeisure.laserLights == nil && !(AppUtil.addServiceLeisure.laserLights ?? false) {
//                    AppUtil.addServiceLeisure.laserLights = true
//                } else {
//                    AppUtil.addServiceLeisure.laserLights = false
//                }
//            }
//
//            if value == "Hairstylist" {
//                if AppUtil.addServiceLeisure.hairStylist == nil && !(AppUtil.addServiceLeisure.hairStylist ?? false) {
//                    AppUtil.addServiceLeisure.hairStylist = true
//                } else {
//                    AppUtil.addServiceLeisure.hairStylist = false
//                }
//            }
//
//            if value == "stage" {
//                if AppUtil.addServiceLeisure.stage == nil && !(AppUtil.addServiceLeisure.stage ?? false) {
//                    AppUtil.addServiceLeisure.stage = true
//                } else {
//                    AppUtil.addServiceLeisure.stage = false
//                }
//            }
//
//            if value == "speakers" {
//                if AppUtil.addServiceLeisure.speakers == nil && !(AppUtil.addServiceLeisure.speakers ?? false) {
//                    AppUtil.addServiceLeisure.speakers = true
//                } else {
//                    AppUtil.addServiceLeisure.speakers = false
//                }
//            }
//
//
//            if value == "airConditioning" {
//                if AppUtil.addServiceLeisure.airConditioning == nil && !(AppUtil.addServiceLeisure.airConditioning ?? false) {
//                    AppUtil.addServiceLeisure.airConditioning = true
//                } else {
//                    AppUtil.addServiceLeisure.airConditioning = false
//                }
//            }
//
//            if value == "elevator" {
//                if AppUtil.addServiceLeisure.elevator == nil && !(AppUtil.addServiceLeisure.elevator ?? false) {
//                    AppUtil.addServiceLeisure.elevator = true
//                } else {
//                    AppUtil.addServiceLeisure.elevator = false
//                }
//            }
//
//            if value == "sandGames" {
//                if AppUtil.addServiceLeisure.sandGames == nil && !(AppUtil.addServiceLeisure.sandGames ?? false) {
//                    AppUtil.addServiceLeisure.sandGames = true
//                } else {
//                    AppUtil.addServiceLeisure.sandGames = false
//                }
//            }
//
//            if value == "waterGames" {
//                if AppUtil.addServiceLeisure.waterGames == nil && !(AppUtil.addServiceLeisure.waterGames ?? false) {
//                    AppUtil.addServiceLeisure.waterGames = true
//                } else {
//                    AppUtil.addServiceLeisure.waterGames = false
//                }
//            }
//
//            if value == "hotTub" {
//                if AppUtil.addServiceLeisure.hotTub == nil && !(AppUtil.addServiceLeisure.hotTub ?? false) {
//                    AppUtil.addServiceLeisure.hotTub = true
//                } else {
//                    AppUtil.addServiceLeisure.hotTub = false
//                }
//            }
//
//            if value == "airSlider" {
//                if AppUtil.addServiceLeisure.airSlider == nil && !(AppUtil.addServiceLeisure.airSlider ?? false) {
//                    AppUtil.addServiceLeisure.airSlider = true
//                } else {
//                    AppUtil.addServiceLeisure.airSlider = false
//                }
//            }
//
//            if value == "gym" {
//                if AppUtil.addServiceLeisure.gym == nil && !(AppUtil.addServiceLeisure.gym ?? false) {
//                    AppUtil.addServiceLeisure.gym = true
//                } else {
//                    AppUtil.addServiceLeisure.gym = false
//                }
//            }
//
//            if value == "running" {
//                if AppUtil.addServiceLeisure.running == nil && !(AppUtil.addServiceLeisure.running ?? false) {
//                    AppUtil.addServiceLeisure.running = true
//                } else {
//                    AppUtil.addServiceLeisure.running = false
//                }
//            }
//
//            if value == "steamBath" {
//                if AppUtil.addServiceLeisure.steamBath == nil && !(AppUtil.addServiceLeisure.steamBath ?? false) {
//                    AppUtil.addServiceLeisure.steamBath = true
//                } else {
//                    AppUtil.addServiceLeisure.steamBath = false
//                }
//            }
//
//
//            if value == "lamPost" {
//                if AppUtil.addServiceLeisure.lamPost == nil && !(AppUtil.addServiceLeisure.lamPost ?? false) {
//                    AppUtil.addServiceLeisure.lamPost = true
//                } else {
//                    AppUtil.addServiceLeisure.lamPost = false
//                }
//            }
//
//            if value == "wifi" {
//                if AppUtil.addServiceLeisure.wifi == nil && !(AppUtil.addServiceLeisure.wifi ?? false) {
//                    AppUtil.addServiceLeisure.wifi = true
//                } else {
//                    AppUtil.addServiceLeisure.wifi = false
//                }
//            }
//
//            if value == "tv" {
//                if AppUtil.addServiceLeisure.tv == nil && !(AppUtil.addServiceLeisure.tv ?? false) {
//                    AppUtil.addServiceLeisure.tv = true
//                } else {
//                    AppUtil.addServiceLeisure.tv = false
//                }
//            }
//
//            if value == "Billard" {
//                if AppUtil.addServiceLeisure.billard == nil && !(AppUtil.addServiceLeisure.billard ?? false) {
//                    AppUtil.addServiceLeisure.billard = true
//                } else {
//                    AppUtil.addServiceLeisure.billard = false
//                }
//
//            }
//            if value == "tennisCourt" {
//                if AppUtil.addServiceLeisure.tennisCourt == nil && !(AppUtil.addServiceLeisure.tennisCourt ?? false) {
//                    AppUtil.addServiceLeisure.tennisCourt = true
//                } else {
//                    AppUtil.addServiceLeisure.tennisCourt = false
//                }
//            }
//
//            if value == "airHockeyTable" {
//                if AppUtil.addServiceLeisure.airHockeyTable == nil && !(AppUtil.addServiceLeisure.airHockeyTable ?? false) {
//                    AppUtil.addServiceLeisure.airHockeyTable = true
//                } else {
//                    AppUtil.addServiceLeisure.airHockeyTable = false
//                }
//
//            }
//
//            if value == "soccerField" {
//                if AppUtil.addServiceLeisure.soccerField == nil && !(AppUtil.addServiceLeisure.soccerField ?? false) {
//                    AppUtil.addServiceLeisure.soccerField = true
//                } else {
//                    AppUtil.addServiceLeisure.soccerField = false
//                }
//
//            }
//
//            if value == "volleyBall" {
//                if AppUtil.addServiceLeisure.volleyBall == nil && !(AppUtil.addServiceLeisure.volleyBall ?? false) {
//                    AppUtil.addServiceLeisure.volleyBall = true
//                } else {
//                    AppUtil.addServiceLeisure.volleyBall = false
//                }
//
//            }
//
//            if value == "Trampoline" {
//                if AppUtil.addServiceLeisure.trampoline == nil && !(AppUtil.addServiceLeisure.trampoline ?? false) {
//                    AppUtil.addServiceLeisure.trampoline = true
//                } else {
//                    AppUtil.addServiceLeisure.trampoline = false
//                }
//            }
//
//            if value == "swimmingPoolHeater" {
//                if AppUtil.addServiceLeisure.swimmingPoolHeater == nil && !(AppUtil.addServiceLeisure.swimmingPoolHeater ?? false) {
//                    AppUtil.addServiceLeisure.swimmingPoolHeater = true
//                } else {
//                    AppUtil.addServiceLeisure.swimmingPoolHeater = false
//                }
//            }
//
//            if value == "indoorSwimmingPool" {
//                if AppUtil.addServiceLeisure.indoorSwimmingPool == nil && !(AppUtil.addServiceLeisure.indoorSwimmingPool ?? false) {
//                    AppUtil.addServiceLeisure.indoorSwimmingPool = true
//                } else {
//                    AppUtil.addServiceLeisure.indoorSwimmingPool = false
//                }
//            }
//            if value == "playground" {
//                if AppUtil.addServiceLeisure.playground == nil && !(AppUtil.addServiceLeisure.playground ?? false) {
//                    AppUtil.addServiceLeisure.playground = true
//                } else {
//                    AppUtil.addServiceLeisure.playground = false
//                }
//            }
//
//            if value == "accessInHours" {
//                if AppUtil.addServiceLeisure.accessInHours == nil  {
//                    AppUtil.addServiceLeisure.accessInHours = 24
//                } else {
//                    AppUtil.addServiceLeisure.accessInHours = 24
//                }
//            }
//
//            if value == "outdoorSwimmingPool" {
//                if AppUtil.addServiceLeisure.outdoorSwimmingPool == nil && !(AppUtil.addServiceLeisure.outdoorSwimmingPool ?? false) {
//                    AppUtil.addServiceLeisure.outdoorSwimmingPool = true
//                } else {
//                    AppUtil.addServiceLeisure.outdoorSwimmingPool = false
//                }
//            }
//
//            if value == "weelChaireAccess" {
//                if AppUtil.addServiceLeisure.weelChaireAccess == nil && !(AppUtil.addServiceLeisure.weelChaireAccess ?? false) {
//                    AppUtil.addServiceLeisure.weelChaireAccess = true
//                } else {
//                    AppUtil.addServiceLeisure.weelChaireAccess = false
//                }
//            }
//
//            if value == "parking" {
//                if AppUtil.addServiceLeisure.parking == nil && !(AppUtil.addServiceLeisure.parking ?? false) {
//                    AppUtil.addServiceLeisure.parking = true
//                } else {
//                    AppUtil.addServiceLeisure.parking = false
//                }
//            }
//
//            if value == "privateEntrance" {
//                if AppUtil.addServiceLeisure.privateEntrance == nil && !(AppUtil.addServiceLeisure.privateEntrance ?? false) {
//                    AppUtil.addServiceLeisure.privateEntrance = true
//                } else {
//                    AppUtil.addServiceLeisure.privateEntrance = false
//                }
//            }
//
//            if value == "doorman" {
//                if AppUtil.addServiceLeisure.doorman == nil && !(AppUtil.addServiceLeisure.doorman ?? false) {
//                    AppUtil.addServiceLeisure.doorman = true
//                } else {
//                    AppUtil.addServiceLeisure.doorman = false
//                }
//            }
//
//
//    }
//}
//
//struct AmenitiesScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        AmenitiesScreen()
//    }
//}


//
//  AmenitiesScreen.swift
//  SmartBookings
//
//  Created by Sheheryar on 07/08/2022.
//

import SwiftUI

struct AmenitiesScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        ]
    var sportsTypes: [String] = ["gym","Billard","tennisCourt","airHockeyTable","soccerField","volleyBall","Trampoline","airSlider","sandGames","waterGames"]
    var sportsImages : [String] = ["gym","paperPen","tennisCourt","airhockey","soccerfield","vollyball","trampoline","trampoline","trampoline","Water_games"]

    var Leisure: [String] = ["wifi","tv","playground","steamBath","indoorSwimmingPool","outdoorSwimmingPool","swimmingPoolHeater","hotTub", "airConditioning","Camps","elevator","stage", "speakers","laserLights", "Hairstylist", "spa", "swimmingWithWaterGames"]

    var leisureImages: [String] = ["wifi","Rectangle 81","indoorSwimingpool","outdoorSwimingpool","swimingpool","playground","hottub","wheelchair","hottub","trampoline","Elevator_new","hottub","Speakers","doorman","hottub","trampoline","Water_games"]

    var HomeAmenities: [String] = ["accessInHours","weelChaireAccess","privateEntrance","doorman","parking","saftyBox","running","lamPost"]
    var homeImages : [String] = ["24hour","wheelchair","privateentrance","doorman","Parking_new","safety-box","Parking_new","safety-box"]

    @State var sportsCheck: [Bool] = [false,false,false,false,false,false,false,false,false,false]
    @State var leisureCheck: [Bool] = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    @State var HomeAmenitiesCheck: [Bool] = [false,false,false,false,false,false,false,false]
    
    @State var editsportsCheck: [Bool] = [true,true,true,true,true,true,true,true,true,true]
    @State var editleisureCheck: [Bool] = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]
    @State var editHomeAmenitiesCheck: [Bool] = [true,true,true,true,true,true,true,true]

    var body: some View {
        ZStack {
            VStack {
                TopNavigation(titleText: "Basic Information")
                ScrollView(showsIndicators:false) {
                    VStack{
                        VStack{
                            HStack{
                                Text("Amenities")
                                    .foregroundColor(Color("000000").opacity(0.8))
                                    .font(Font.custom("poppins", size: 17))
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }.padding(.horizontal)

                            HStack{
                                Text("Please select the amenities that are available")
                                    .foregroundColor(Color("000000").opacity(0.6))
                                    .font(Font.custom("poppins", size: 14))
                                    .fontWeight(.regular)
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }.padding(.horizontal)
                                .padding(.top,2)
                        }.padding(.vertical)

                            VStack {

                                if AppUtil.selectedCategory == "Chalets" || AppUtil.selectedCategory == "Chalet" || AppUtil.selectedCategory == "Resorts" || AppUtil.selectedCategory == "Farms" || AppUtil.selectedCategory == "Lounges" {
                                    HStack {
                                        Text("Sports")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 18))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< sportsTypes.count, id: \.self) {item in
                                            AmenetiesCard(callback: {
                                                constructbody(value: sportsTypes[item])
                                            }, text: sportsTypes[item], imageName: sportsImages[item], check: $sportsCheck[item])
                                        }
                                    }

                                    HStack{
                                        Text("Leisure")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< Leisure.count, id: \.self) { item in
                                            if Leisure[item] != "swimmingPoolHeater" &&  Leisure[item] != "Camps" && Leisure[item] != "Hairstylist" && Leisure[item] != "spa" && Leisure[item] != "swimmingWithWaterGames"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: Leisure[item])
                                                }, text: Leisure[item], imageName: leisureImages[item], check: $leisureCheck[item])
                                            }
                                        }
                                    }

                                    HStack {
                                        Text("Home Amenities")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< HomeAmenities.count, id: \.self) { item in
                                            if HomeAmenities[item] != "running"  && HomeAmenities[item] != "lamPost"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: HomeAmenities[item])
                                                }, text: HomeAmenities[item], imageName: homeImages[item], check: $HomeAmenitiesCheck[item])
                                            }
                                        }
                                    }
                                }

                                if AppUtil.selectedCategory == "Stadium" {
                                    HStack{
                                        Text("Sports")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 18))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< sportsTypes.count, id: \.self) {item in
                                            if sportsTypes[item] != "airSlider" && sportsTypes[item] != "sandGames" && sportsTypes[item] != "waterGames"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: sportsTypes[item])
                                                }, text: sportsTypes[item], imageName: sportsImages[item], check: $sportsCheck[item])
                                            }
                                        }
                                    }

                                    HStack {
                                        Text("Home Amenities")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< HomeAmenities.count, id: \.self) { item in
                                            if HomeAmenities[item] != "accessInHours" && HomeAmenities[item] != "privateEntrance" && HomeAmenities[item] != "saftyBox"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: HomeAmenities[item])
                                                }, text: HomeAmenities[item], imageName: homeImages[item], check: $HomeAmenitiesCheck[item])
                                            }
                                        }
                                    }
                                }

                                if AppUtil.selectedCategory == "Apartment" || AppUtil.selectedCategory == "Apartments" {
                                    HStack{
                                        Text("Sports")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 18))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< sportsTypes.count, id: \.self) {item in
                                            if sportsTypes[item] != "soccerField" && sportsTypes[item] != "volleyBall" && sportsTypes[item] != "Trampoline" && sportsTypes[item] != "airSlider" && sportsTypes[item] != "sandGames" && sportsTypes[item] != "waterGames"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: sportsTypes[item])
                                                }, text: sportsTypes[item], imageName: sportsImages[item], check: $sportsCheck[item])
                                            }
                                        }
                                    }

                                    HStack{
                                        Text("Leisure")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< Leisure.count, id: \.self) { item in
                                            if Leisure[item] != "swimmingPoolHeater" &&  Leisure[item] != "Camps" && Leisure[item] != "stage" && Leisure[item] != "laserLights" && Leisure[item] != "swimmingWithWaterGames"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: Leisure[item])
                                                }, text: Leisure[item], imageName: leisureImages[item], check: $leisureCheck[item])
                                            }
                                        }
                                    }
                                    HStack {
                                        Text("Home Amenities")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< HomeAmenities.count, id: \.self) { item in
                                            if HomeAmenities[item] != "running"  && HomeAmenities[item] != "lamPost"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: HomeAmenities[item])
                                                }, text: HomeAmenities[item], imageName: homeImages[item], check: $HomeAmenitiesCheck[item])
                                            }
                                        }
                                    }
                                }

                                if AppUtil.selectedCategory == "Camps" {
                                    HStack{
                                        Text("Sports")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 18))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< sportsTypes.count, id: \.self) {item in
                                            if sportsTypes[item] != "gym" && sportsTypes[item] != "wifi" && sportsTypes[item] != "airHockeyTable" && sportsTypes[item] != "waterGames"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: sportsTypes[item])
                                                }, text: sportsTypes[item], imageName: sportsImages[item], check: $sportsCheck[item])
                                            }
                                        }
                                    }
                                    HStack{
                                        Text("Leisure")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< Leisure.count, id: \.self) { item in
                                            if Leisure[item] != "steamBath" && Leisure[item] != "indoorSwimmingPool" && Leisure[item] != "outdoorSwimmingPool" && Leisure[item] != "swimmingPoolHeater" && Leisure[item] != "hotTub" && Leisure[item] != "Camps" && Leisure[item] != "elevator" && Leisure[item] != "stage" &&  Leisure[item] != "Hairstylist" && Leisure[item] != "spa" && Leisure[item] != "swimmingWithWaterGames" {
                                                AmenetiesCard(callback: {
                                                    constructbody(value: Leisure[item])
                                                }, text: Leisure[item], imageName: leisureImages[item], check: $leisureCheck[item])
                                            }
                                        }
                                    }
                                    HStack {
                                        Text("Home Amenities")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< HomeAmenities.count, id: \.self) { item in
                                            if HomeAmenities[item] != "running" && HomeAmenities[item] != "lamPost" && HomeAmenities[item] != "saftyBox"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: HomeAmenities[item])
                                                }, text: HomeAmenities[item], imageName: homeImages[item], check: $HomeAmenitiesCheck[item])
                                            }
                                        }
                                    }
                                }

                                if AppUtil.selectedCategory == "Wedding_Halls" {
                                    HStack{
                                        Text("Leisure")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< Leisure.count, id: \.self) { item in
                                            if Leisure[item] != "steamBath" &&  Leisure[item] != "indoorSwimmingPool" && Leisure[item] != "outdoorSwimmingPool" && Leisure[item] != "swimmingPoolHeater" && Leisure[item] != "hotTub" && Leisure[item] != "Camps" && Leisure[item] != "Hairstylist" && Leisure[item] != "spa" && Leisure[item] != "swimmingWithWaterGames"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: Leisure[item])
                                                }, text: Leisure[item], imageName: leisureImages[item], check: $leisureCheck[item])
                                            }
                                        }
                                    }

                                    HStack {
                                        Text("Home Amenities")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< HomeAmenities.count, id: \.self) { item in
                                            if HomeAmenities[item] != "running" && HomeAmenities[item] != "lamPost"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: HomeAmenities[item])
                                                }, text: HomeAmenities[item], imageName: homeImages[item], check: $HomeAmenitiesCheck[item])
                                            }
                                        }
                                    }
                                }

                                if AppUtil.selectedCategory == "Hotel"  || AppUtil.selectedCategory == "Hotels"{
                                    HStack{
                                        Text("Sports")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 18))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< sportsTypes.count, id: \.self) {item in
                                            if sportsTypes[item] != "soccerField" && sportsTypes[item] != "volleyBall" && sportsTypes[item] != "Trampoline" && sportsTypes[item] != "airSlider" && sportsTypes[item] != "sandGames" && sportsTypes[item] != "waterGames"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: sportsTypes[item])
                                                }, text: sportsTypes[item], imageName: sportsImages[item], check: $sportsCheck[item])
                                            }
                                        }
                                    }
                                    HStack{
                                        Text("Leisure")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< Leisure.count, id: \.self) { item in
                                            if Leisure[item] != "swimmingPoolHeater" &&  Leisure[item] != "Camps" && Leisure[item] != "stage" && Leisure[item] != "laserLights"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: Leisure[item])
                                                }, text: Leisure[item], imageName: leisureImages[item], check: $leisureCheck[item])
                                            }
                                        }
                                    }
                                    HStack {
                                        Text("Home Amenities")
                                            .foregroundColor(Color("000000").opacity(0.8))
                                            .font(Font.custom("poppins", size: 17))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.horizontal)
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< HomeAmenities.count, id: \.self) { item in
                                            if HomeAmenities[item] != "running" && HomeAmenities[item] != "lamPost"{
                                                AmenetiesCard(callback: {
                                                    constructbody(value: HomeAmenities[item])
                                                }, text: HomeAmenities[item], imageName: homeImages[item], check: $HomeAmenitiesCheck[item])
                                            }
                                        }
                                    }
                                }

                                LoginButton(title: "Done", callback: {
                                    if AppUtil.selectedCategory != "Farms" && AppUtil.selectedCategory != "Lounges" && AppUtil.selectedCategory != "Wedding_Halls" && AppUtil.selectedCategory != "Resorts"  &&  AppUtil.selectedCategory != "Chalets" {
                                        //                                    AppUtil.addServiceLeisure.parking = true
                                    }
                                    serviceManager.addService?.leisure = AppUtil.addServiceLeisure
                                    AppUtil.addserviceObject?.leisure = AppUtil.addServiceLeisure

                                    //                                serviceManager.EditServiceShowdate?.leisure = AppUtil.addServiceLeisure
                                    //                                AppUtil.EditServiceShowdate?.leisure = AppUtil.addServiceLeisure
                                    viewRouter.currentPage = "AddService"
                                }).padding(.vertical,10)
                            }.padding(.vertical)
                        
                    }
                }
                Spacer()
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
      }

    func constructbody(value : String) {
            if value == "spa" {
                if AppUtil.addServiceLeisure.spa == nil && (AppUtil.addServiceLeisure.spa ?? false) {
                    AppUtil.addServiceLeisure.spa = true
                } else {
                    AppUtil.addServiceLeisure.spa = false
                }
            }

            if value == "saftyBox" {
                if AppUtil.addServiceLeisure.saftyBox == nil && !(AppUtil.addServiceLeisure.saftyBox ?? false) {
                    AppUtil.addServiceLeisure.saftyBox = true
                } else {
                    AppUtil.addServiceLeisure.saftyBox = false
                }
            }

            if value == "swimmingWithWaterGames" {
                if AppUtil.addServiceLeisure.swimmingWithWaterGames == nil && !(AppUtil.addServiceLeisure.swimmingWithWaterGames ?? false) {
                    AppUtil.addServiceLeisure.swimmingWithWaterGames = true
                } else {
                    AppUtil.addServiceLeisure.swimmingWithWaterGames = false
                }
            }

            if value == "laserLights" {
                if AppUtil.addServiceLeisure.laserLights == nil && !(AppUtil.addServiceLeisure.laserLights ?? false) {
                    AppUtil.addServiceLeisure.laserLights = true
                } else {
                    AppUtil.addServiceLeisure.laserLights = false
                }
            }

            if value == "Hairstylist" {
                if AppUtil.addServiceLeisure.hairStylist == nil && !(AppUtil.addServiceLeisure.hairStylist ?? false) {
                    AppUtil.addServiceLeisure.hairStylist = true
                } else {
                    AppUtil.addServiceLeisure.hairStylist = false
                }
            }

            if value == "stage" {
                if AppUtil.addServiceLeisure.stage == nil && !(AppUtil.addServiceLeisure.stage ?? false) {
                    AppUtil.addServiceLeisure.stage = true
                } else {
                    AppUtil.addServiceLeisure.stage = false
                }
            }

            if value == "speakers" {
                if AppUtil.addServiceLeisure.speakers == nil && !(AppUtil.addServiceLeisure.speakers ?? false) {
                    AppUtil.addServiceLeisure.speakers = true
                } else {
                    AppUtil.addServiceLeisure.speakers = false
                }
            }


            if value == "airConditioning" {
                if AppUtil.addServiceLeisure.airConditioning == nil && !(AppUtil.addServiceLeisure.airConditioning ?? false) {
                    AppUtil.addServiceLeisure.airConditioning = true
                } else {
                    AppUtil.addServiceLeisure.airConditioning = false
                }
            }

            if value == "elevator" {
                if AppUtil.addServiceLeisure.elevator == nil && !(AppUtil.addServiceLeisure.elevator ?? false) {
                    AppUtil.addServiceLeisure.elevator = true
                } else {
                    AppUtil.addServiceLeisure.elevator = false
                }
            }

            if value == "sandGames" {
                if AppUtil.addServiceLeisure.sandGames == nil && !(AppUtil.addServiceLeisure.sandGames ?? false) {
                    AppUtil.addServiceLeisure.sandGames = true
                } else {
                    AppUtil.addServiceLeisure.sandGames = false
                }
            }

            if value == "waterGames" {
                if AppUtil.addServiceLeisure.waterGames == nil && !(AppUtil.addServiceLeisure.waterGames ?? false) {
                    AppUtil.addServiceLeisure.waterGames = true
                } else {
                    AppUtil.addServiceLeisure.waterGames = false
                }
            }

            if value == "hotTub" {
                if AppUtil.addServiceLeisure.hotTub == nil && !(AppUtil.addServiceLeisure.hotTub ?? false) {
                    AppUtil.addServiceLeisure.hotTub = true
                } else {
                    AppUtil.addServiceLeisure.hotTub = false
                }
            }

            if value == "airSlider" {
                if AppUtil.addServiceLeisure.airSlider == nil && !(AppUtil.addServiceLeisure.airSlider ?? false) {
                    AppUtil.addServiceLeisure.airSlider = true
                } else {
                    AppUtil.addServiceLeisure.airSlider = false
                }
            }

            if value == "gym" {
                if AppUtil.addServiceLeisure.gym == nil && !(AppUtil.addServiceLeisure.gym ?? false) {
                    AppUtil.addServiceLeisure.gym = true
                } else {
                    AppUtil.addServiceLeisure.gym = false
                }
            }

            if value == "running" {
                if AppUtil.addServiceLeisure.running == nil && !(AppUtil.addServiceLeisure.running ?? false) {
                    AppUtil.addServiceLeisure.running = true
                } else {
                    AppUtil.addServiceLeisure.running = false
                }
            }

            if value == "steamBath" {
                if AppUtil.addServiceLeisure.steamBath == nil && !(AppUtil.addServiceLeisure.steamBath ?? false) {
                    AppUtil.addServiceLeisure.steamBath = true
                } else {
                    AppUtil.addServiceLeisure.steamBath = false
                }
            }


            if value == "lamPost" {
                if AppUtil.addServiceLeisure.lamPost == nil && !(AppUtil.addServiceLeisure.lamPost ?? false) {
                    AppUtil.addServiceLeisure.lamPost = true
                } else {
                    AppUtil.addServiceLeisure.lamPost = false
                }
            }

            if value == "wifi" {
                if AppUtil.addServiceLeisure.wifi == nil && !(AppUtil.addServiceLeisure.wifi ?? false) {
                    AppUtil.addServiceLeisure.wifi = true
                } else {
                    AppUtil.addServiceLeisure.wifi = false
                }
            }

            if value == "tv" {
                if AppUtil.addServiceLeisure.tv == nil && !(AppUtil.addServiceLeisure.tv ?? false) {
                    AppUtil.addServiceLeisure.tv = true
                } else {
                    AppUtil.addServiceLeisure.tv = false
                }
            }

            if value == "Billard" {
                if AppUtil.addServiceLeisure.billard == nil && !(AppUtil.addServiceLeisure.billard ?? false) {
                    AppUtil.addServiceLeisure.billard = true
                } else {
                    AppUtil.addServiceLeisure.billard = false
                }
             
            }
            if value == "tennisCourt" {
                if AppUtil.addServiceLeisure.tennisCourt == nil && !(AppUtil.addServiceLeisure.tennisCourt ?? false) {
                    AppUtil.addServiceLeisure.tennisCourt = true
                } else {
                    AppUtil.addServiceLeisure.tennisCourt = false
                }
            }

            if value == "airHockeyTable" {
                if AppUtil.addServiceLeisure.airHockeyTable == nil && !(AppUtil.addServiceLeisure.airHockeyTable ?? false) {
                    AppUtil.addServiceLeisure.airHockeyTable = true
                } else {
                    AppUtil.addServiceLeisure.airHockeyTable = false
                }

            }

            if value == "soccerField" {
                if AppUtil.addServiceLeisure.soccerField == nil && !(AppUtil.addServiceLeisure.soccerField ?? false) {
                    AppUtil.addServiceLeisure.soccerField = true
                } else {
                    AppUtil.addServiceLeisure.soccerField = false
                }

            }

            if value == "volleyBall" {
                if AppUtil.addServiceLeisure.volleyBall == nil && !(AppUtil.addServiceLeisure.volleyBall ?? false) {
                    AppUtil.addServiceLeisure.volleyBall = true
                } else {
                    AppUtil.addServiceLeisure.volleyBall = false
                }

            }

            if value == "Trampoline" {
                if AppUtil.addServiceLeisure.trampoline == nil && !(AppUtil.addServiceLeisure.trampoline ?? false) {
                    AppUtil.addServiceLeisure.trampoline = true
                } else {
                    AppUtil.addServiceLeisure.trampoline = false
                }
            }

            if value == "swimmingPoolHeater" {
                if AppUtil.addServiceLeisure.swimmingPoolHeater == nil && !(AppUtil.addServiceLeisure.swimmingPoolHeater ?? false) {
                    AppUtil.addServiceLeisure.swimmingPoolHeater = true
                } else {
                    AppUtil.addServiceLeisure.swimmingPoolHeater = false
                }
            }

            if value == "indoorSwimmingPool" {
                if AppUtil.addServiceLeisure.indoorSwimmingPool == nil && !(AppUtil.addServiceLeisure.indoorSwimmingPool ?? false) {
                    AppUtil.addServiceLeisure.indoorSwimmingPool = true
                } else {
                    AppUtil.addServiceLeisure.indoorSwimmingPool = false
                }
            }
            if value == "playground" {
                if AppUtil.addServiceLeisure.playground == nil && !(AppUtil.addServiceLeisure.playground ?? false) {
                    AppUtil.addServiceLeisure.playground = true
                } else {
                    AppUtil.addServiceLeisure.playground = false
                }
            }

            if value == "accessInHours" {
                if AppUtil.addServiceLeisure.accessInHours == nil  {
                    AppUtil.addServiceLeisure.accessInHours = 24
                } else {
                    AppUtil.addServiceLeisure.accessInHours = 24
                }
            }

            if value == "outdoorSwimmingPool" {
                if AppUtil.addServiceLeisure.outdoorSwimmingPool == nil && !(AppUtil.addServiceLeisure.outdoorSwimmingPool ?? false) {
                    AppUtil.addServiceLeisure.outdoorSwimmingPool = true
                } else {
                    AppUtil.addServiceLeisure.outdoorSwimmingPool = false
                }
            }

            if value == "weelChaireAccess" {
                if AppUtil.addServiceLeisure.weelChaireAccess == nil && !(AppUtil.addServiceLeisure.weelChaireAccess ?? false) {
                    AppUtil.addServiceLeisure.weelChaireAccess = true
                } else {
                    AppUtil.addServiceLeisure.weelChaireAccess = false
                }
            }

            if value == "parking" {
                if AppUtil.addServiceLeisure.parking == nil && !(AppUtil.addServiceLeisure.parking ?? false) {
                    AppUtil.addServiceLeisure.parking = true
                } else {
                    AppUtil.addServiceLeisure.parking = false
                }
            }

            if value == "privateEntrance" {
                if AppUtil.addServiceLeisure.privateEntrance == nil && !(AppUtil.addServiceLeisure.privateEntrance ?? false) {
                    AppUtil.addServiceLeisure.privateEntrance = true
                } else {
                    AppUtil.addServiceLeisure.privateEntrance = false
                }
            }

            if value == "doorman" {
                if AppUtil.addServiceLeisure.doorman == nil && !(AppUtil.addServiceLeisure.doorman ?? false) {
                    AppUtil.addServiceLeisure.doorman = true
                } else {
                    AppUtil.addServiceLeisure.doorman = false
                }
            }
    }
}

struct AmenitiesScreen_Previews: PreviewProvider {
    static var previews: some View {
        AmenitiesScreen()
    }
}
