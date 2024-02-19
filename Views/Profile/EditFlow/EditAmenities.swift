//
//  EditAmenities.swift
//  SmartBookings
//
//  Created by Esfera-Macmini on 31/07/23.
//

import SwiftUI

struct EditAmenities: View {
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
                                        //                                    AppUtil.editserviceObject?.leisure?.parking = true
                                    }
                                    serviceManager.editserviceObject?.leisure = AppUtil.editserviceObject?.leisure
                                    AppUtil.editserviceObject?.leisure = AppUtil.editserviceObject?.leisure

                                    //                                serviceManager.EditServiceShowdate?.leisure = AppUtil.editserviceObject?.leisure?
                                    //                                AppUtil.EditServiceShowdate?.leisure = AppUtil.editserviceObject?.leisure?
                                    viewRouter.currentPage = "EditAddService_View"
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
                if AppUtil.editserviceObject?.leisure?.spa == nil && (AppUtil.editserviceObject?.leisure?.spa ?? false) {
                    AppUtil.editserviceObject?.leisure?.spa = true
                } else {
                    AppUtil.editserviceObject?.leisure?.spa = false
                }
            }

            if value == "saftyBox"{
                if AppUtil.editserviceObject?.leisure?.saftyBox == nil && !(AppUtil.editserviceObject?.leisure?.saftyBox ?? false) {
                    AppUtil.editserviceObject?.leisure?.saftyBox = true
                } else {
                    AppUtil.editserviceObject?.leisure?.saftyBox = false
                }
            }

            if value == "swimmingWithWaterGames" {
                if AppUtil.editserviceObject?.leisure?.swimmingWithWaterGames == nil && !(AppUtil.editserviceObject?.leisure?.swimmingWithWaterGames ?? false) {
                    AppUtil.editserviceObject?.leisure?.swimmingWithWaterGames = true
                } else {
                    AppUtil.editserviceObject?.leisure?.swimmingWithWaterGames = false
                }
            }

            if value == "laserLights" {
                if AppUtil.editserviceObject?.leisure?.laserLights == nil && !(AppUtil.editserviceObject?.leisure?.laserLights ?? false) {
                    AppUtil.editserviceObject?.leisure?.laserLights = true
                } else {
                    AppUtil.editserviceObject?.leisure?.laserLights = false
                }
            }

            if value == "Hairstylist" {
                if AppUtil.editserviceObject?.leisure?.hairStylist == nil && !(AppUtil.editserviceObject?.leisure?.hairStylist ?? false) {
                    AppUtil.editserviceObject?.leisure?.hairStylist = true
                } else {
                    AppUtil.editserviceObject?.leisure?.hairStylist = false
                }
            }

            if value == "stage" {
                if AppUtil.editserviceObject?.leisure?.stage == nil && !(AppUtil.editserviceObject?.leisure?.stage ?? false) {
                    AppUtil.editserviceObject?.leisure?.stage = true
                } else {
                    AppUtil.editserviceObject?.leisure?.stage = false
                }
            }

            if value == "speakers" {
                if AppUtil.editserviceObject?.leisure?.speakers == nil && !(AppUtil.editserviceObject?.leisure?.speakers ?? false) {
                    AppUtil.editserviceObject?.leisure?.speakers = true
                } else {
                    AppUtil.editserviceObject?.leisure?.speakers = false
                }
            }

            if value == "airConditioning" {
                if AppUtil.editserviceObject?.leisure?.airConditioning == nil && !(AppUtil.editserviceObject?.leisure?.airConditioning ?? false) {
                    AppUtil.editserviceObject?.leisure?.airConditioning = true
                } else {
                    AppUtil.editserviceObject?.leisure?.airConditioning = false
                }
            }

            if value == "elevator" {
                if AppUtil.editserviceObject?.leisure?.elevator == nil && !(AppUtil.editserviceObject?.leisure?.elevator ?? false) {
                    AppUtil.editserviceObject?.leisure?.elevator = true
                } else {
                    AppUtil.editserviceObject?.leisure?.elevator = false
                }
            }

            if value == "sandGames" {
                if AppUtil.editserviceObject?.leisure?.sandGames == nil && !(AppUtil.editserviceObject?.leisure?.sandGames ?? false) {
                    AppUtil.editserviceObject?.leisure?.sandGames = true
                } else {
                    AppUtil.editserviceObject?.leisure?.sandGames = false
                }
            }

            if value == "waterGames" {
                if AppUtil.editserviceObject?.leisure?.waterGames == nil && !(AppUtil.editserviceObject?.leisure?.waterGames ?? false) {
                    AppUtil.editserviceObject?.leisure?.waterGames = true
                } else {
                    AppUtil.editserviceObject?.leisure?.waterGames = false
                }
            }

            if value == "hotTub" {
                if AppUtil.editserviceObject?.leisure?.hotTub == nil && !(AppUtil.editserviceObject?.leisure?.hotTub ?? false) {
                    AppUtil.editserviceObject?.leisure?.hotTub = true
                } else {
                    AppUtil.editserviceObject?.leisure?.hotTub = false
                }
            }

            if value == "airSlider" {
                if AppUtil.editserviceObject?.leisure?.airSlider == nil && !(AppUtil.editserviceObject?.leisure?.airSlider ?? false) {
                    AppUtil.editserviceObject?.leisure?.airSlider = true
                } else {
                    AppUtil.editserviceObject?.leisure?.airSlider = false
                }
            }

            if value == "gym" {
                if AppUtil.editserviceObject?.leisure?.gym == nil && !(AppUtil.editserviceObject?.leisure?.gym ?? false) {
                    AppUtil.editserviceObject?.leisure?.gym = true
                } else {
                    AppUtil.editserviceObject?.leisure?.gym = false
                }
            }

            if value == "running" {
                if AppUtil.editserviceObject?.leisure?.running == nil && !(AppUtil.editserviceObject?.leisure?.running ?? false) {
                    AppUtil.editserviceObject?.leisure?.running = true
                } else {
                    AppUtil.editserviceObject?.leisure?.running = false
                }
            }

            if value == "steamBath" {
                if AppUtil.editserviceObject?.leisure?.steamBath == nil && !(AppUtil.editserviceObject?.leisure?.steamBath ?? false) {
                    AppUtil.editserviceObject?.leisure?.steamBath = true
                } else {
                    AppUtil.editserviceObject?.leisure?.steamBath = false
                }
            }

            if value == "lamPost" {
                if AppUtil.editserviceObject?.leisure?.lamPost == nil && !(AppUtil.editserviceObject?.leisure?.lamPost ?? false) {
                    AppUtil.editserviceObject?.leisure?.lamPost = true
                } else {
                    AppUtil.editserviceObject?.leisure?.lamPost = false
                }
            }

            if value == "wifi" {
                if AppUtil.editserviceObject?.leisure?.wifi == nil && !(AppUtil.editserviceObject?.leisure?.wifi ?? false) {
                    AppUtil.editserviceObject?.leisure?.wifi = true
                } else {
                    AppUtil.editserviceObject?.leisure?.wifi = false
                }
            }

            if value == "tv" {
                if AppUtil.editserviceObject?.leisure?.tv == nil && !(AppUtil.editserviceObject?.leisure?.tv ?? false) {
                    AppUtil.editserviceObject?.leisure?.tv = true
                } else {
                    AppUtil.editserviceObject?.leisure?.tv = false
                }
            }

            if value == "Billard" {
                if AppUtil.editserviceObject?.leisure?.billard == nil && !(AppUtil.editserviceObject?.leisure?.billard ?? false) {
                    AppUtil.editserviceObject?.leisure?.billard = true
                } else {
                    AppUtil.editserviceObject?.leisure?.billard = false
                }
             
            }
            if value == "tennisCourt" {
                if AppUtil.editserviceObject?.leisure?.tennisCourt == nil && !(AppUtil.editserviceObject?.leisure?.tennisCourt ?? false) {
                    AppUtil.editserviceObject?.leisure?.tennisCourt = true
                } else {
                    AppUtil.editserviceObject?.leisure?.tennisCourt = false
                }
            }

            if value == "airHockeyTable" {
                if AppUtil.editserviceObject?.leisure?.airHockeyTable == nil && !(AppUtil.editserviceObject?.leisure?.airHockeyTable ?? false) {
                    AppUtil.editserviceObject?.leisure?.airHockeyTable = true
                } else {
                    AppUtil.editserviceObject?.leisure?.airHockeyTable = false
                }

            }

            if value == "soccerField" {
                if AppUtil.editserviceObject?.leisure?.soccerField == nil && !(AppUtil.editserviceObject?.leisure?.soccerField ?? false) {
                    AppUtil.editserviceObject?.leisure?.soccerField = true
                } else {
                    AppUtil.editserviceObject?.leisure?.soccerField = false
                }
            }

            if value == "volleyBall" {
                if AppUtil.editserviceObject?.leisure?.volleyBall == nil && !(AppUtil.editserviceObject?.leisure?.volleyBall ?? false) {
                    AppUtil.editserviceObject?.leisure?.volleyBall = true
                } else {
                    AppUtil.editserviceObject?.leisure?.volleyBall = false
                }
            }

            if value == "Trampoline" {
                if AppUtil.editserviceObject?.leisure?.trampoline == nil && !(AppUtil.editserviceObject?.leisure?.trampoline ?? false) {
                    AppUtil.editserviceObject?.leisure?.trampoline = true
                } else {
                    AppUtil.editserviceObject?.leisure?.trampoline = false
                }
            }

            if value == "swimmingPoolHeater" {
                if AppUtil.editserviceObject?.leisure?.swimmingPoolHeater == nil && !(AppUtil.editserviceObject?.leisure?.swimmingPoolHeater ?? false) {
                    AppUtil.editserviceObject?.leisure?.swimmingPoolHeater = true
                } else {
                    AppUtil.editserviceObject?.leisure?.swimmingPoolHeater = false
                }
            }

            if value == "indoorSwimmingPool" {
                if AppUtil.editserviceObject?.leisure?.indoorSwimmingPool == nil && !(AppUtil.editserviceObject?.leisure?.indoorSwimmingPool ?? false) {
                    AppUtil.editserviceObject?.leisure?.indoorSwimmingPool = true
                } else {
                    AppUtil.editserviceObject?.leisure?.indoorSwimmingPool = false
                }
            }
            if value == "playground" {
                if AppUtil.editserviceObject?.leisure?.playground == nil && !(AppUtil.editserviceObject?.leisure?.playground ?? false) {
                    AppUtil.editserviceObject?.leisure?.playground = true
                } else {
                    AppUtil.editserviceObject?.leisure?.playground = false
                }
            }

            if value == "accessInHours" {
                if AppUtil.editserviceObject?.leisure?.accessInHours == nil  {
                    AppUtil.editserviceObject?.leisure?.accessInHours = 24
                } else {
                    AppUtil.editserviceObject?.leisure?.accessInHours = 24
                }
            }

            if value == "outdoorSwimmingPool" {
                if AppUtil.editserviceObject?.leisure?.outdoorSwimmingPool == nil && !(AppUtil.editserviceObject?.leisure?.outdoorSwimmingPool ?? false) {
                    AppUtil.editserviceObject?.leisure?.outdoorSwimmingPool = true
                } else {
                    AppUtil.editserviceObject?.leisure?.outdoorSwimmingPool = false
                }
            }

            if value == "weelChaireAccess" {
                if AppUtil.editserviceObject?.leisure?.weelChaireAccess == nil && !(AppUtil.editserviceObject?.leisure?.weelChaireAccess ?? false) {
                    AppUtil.editserviceObject?.leisure?.weelChaireAccess = true
                } else {
                    AppUtil.editserviceObject?.leisure?.weelChaireAccess = false
                }
            }

            if value == "parking" {
                if AppUtil.editserviceObject?.leisure?.parking == nil && !(AppUtil.editserviceObject?.leisure?.parking ?? false) {
                    AppUtil.editserviceObject?.leisure?.parking = true
                } else {
                    AppUtil.editserviceObject?.leisure?.parking = false
                }
            }

            if value == "privateEntrance" {
                if AppUtil.editserviceObject?.leisure?.privateEntrance == nil && !(AppUtil.editserviceObject?.leisure?.privateEntrance ?? false) {
                    AppUtil.editserviceObject?.leisure?.privateEntrance = true
                } else {
                    AppUtil.editserviceObject?.leisure?.privateEntrance = false
                }
            }

            if value == "doorman" {
                if AppUtil.editserviceObject?.leisure?.doorman == nil && !(AppUtil.editserviceObject?.leisure?.doorman ?? false) {
                    AppUtil.editserviceObject?.leisure?.doorman = true
                } else {
                    AppUtil.editserviceObject?.leisure?.doorman = false
                }
            }
    }
}



struct EditAmenities_Previews: PreviewProvider {
    static var previews: some View {
        EditAmenities()
    }
}
