//
//  AddOnScreen.swift
//  SmartBookings
//
//  Created by Sheheryar on 08/06/2022.
//

import SwiftUI

struct AddOnScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @State var sleepoverPrice: String = ""
    @State var BirthdayArrangements: String = ""
    @State var WeddingArrangements: String = ""
    @State var sleepOverCheck: Bool = true
    @State var BirthdayCheck: Bool = true
    @State var WeddingCheck: Bool = true
    @State var PhotographerCheck: Bool = true
    @State var buffetsCheck: Bool = true
    @State var weddingCakeCheck: Bool = true
    @State var weddingCake: String = ""
    @State var Photographer: String = ""
    @State var Buffets: String = ""
    @State var togglepopup = false
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText:"Price Details")
                HStack{
                    Text("Add-ons")
                        .foregroundColor(Color("000000").opacity(0.8))
                        .font(Font.custom("poppins", size: 16))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                HStack{
                    Text("Please select Add-ons")
                        .foregroundColor(Color("000000").opacity(0.6))
                        .font(Font.custom("poppins", size: 12))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                    .padding(.top,5)
                VStack{
                    Group{
                        HStack{
                            
                            Circle()
                                .frame(width: 25, height: 25, alignment: .center)
                                .foregroundColor(Color("White"))
                                .shadow(radius: 1)
                                .opacity(0)
                            
                            Text("Name")
                                .foregroundColor(Color("000000").opacity(0.7))
                                .font(Font.custom("poppins", size: 15))
                                .fontWeight(.semibold)
                                
                            Spacer()
                            
                            Text("Price")
                                .foregroundColor(Color("000000").opacity(0.7))
                                .font(Font.custom("poppins", size: 15))
                                .fontWeight(.semibold)
                                .padding(.trailing,30)
                            
                        }
                        
                        if AppUtil.selectedCategory != "Chalets" {
                            HStack{
                                Circle()
                                    .frame(width: 25, height: 25, alignment: .center)
                                    .foregroundColor(Color(sleepOverCheck ?  "White" : "FEBB12" ))
                                    .shadow(radius: 1)
                                    .onTapGesture {
                                        sleepOverCheck.toggle()
                                    }
                                    
                                
                                Text("Sleepover")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 13))
                                    .fontWeight(.medium)
                                
                                Spacer()
                                
                                RoundedRectangle(cornerRadius: 40)
                                    .frame(width: 92, height: 30, alignment: .center)
                                    .foregroundColor(sleepOverCheck ? Color("AAAAAA") : Color("White"))
                                    .shadow(radius: 1)
                                    .overlay(
                                        TextField("", text: $sleepoverPrice)
                                            .disabled(sleepOverCheck ? true : false)
                                            .keyboardType(.numberPad)
                                            .padding(.leading)
                                    )
                            }
                        }
                       
                        
                        HStack{
                            Circle()
                                .frame(width: 25, height: 25, alignment: .center)
                                .foregroundColor(Color(BirthdayCheck  ? "White" : "FEBB12"))
                                .shadow(radius: 1)
                                .onTapGesture {
                                    BirthdayCheck.toggle()
                                }
                            
                            Text("Birthday Arrangements")
                                .foregroundColor(Color("000000").opacity(0.7))
                                .font(Font.custom("poppins", size: 13))
                                .fontWeight(.medium)
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 40)
                                .frame(width: 92, height: 30, alignment: .center)
                                .foregroundColor(BirthdayCheck ? Color("AAAAAA") : Color("White"))
                                .shadow(radius: 1)
                                .overlay(
                                    TextField("", text: $BirthdayArrangements)
                                        .disabled(BirthdayCheck ? true : false)
                                        .keyboardType(.numberPad)
                                        .padding(.leading)
                                )
                            
                        }
                        
                        HStack{
                            Circle()
                                .frame(width: 25, height: 25, alignment: .center)
                                .foregroundColor(Color(WeddingCheck  ? "White" : "FEBB12"))
                                .shadow(radius: 1)
                                .onTapGesture {
                                    WeddingCheck.toggle()
                                }
                            
                            Text("Wedding Arrangements")
                                .foregroundColor(Color("000000").opacity(0.7))
                                .font(Font.custom("poppins", size: 13))
                                .fontWeight(.medium)
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 40)
                                .frame(width: 92, height: 30, alignment: .center)
                                .foregroundColor(WeddingCheck ? Color("AAAAAA") : Color("White"))
                                .shadow(radius: 1)
                                .overlay(
                                    TextField("", text: $WeddingArrangements)
                                        .disabled(WeddingCheck ? true : false)
                                        .keyboardType(.numberPad)
                                        .padding(.leading)
                                )
                            
                        }
                        
                        HStack{
                            Circle()
                                .frame(width: 25, height: 25, alignment: .center)
                                .foregroundColor(Color(buffetsCheck ? "White" : "FEBB12"))
                                .shadow(radius: 1)
                                .onTapGesture {
                                    buffetsCheck.toggle()
                                }
                            
                            Text("Buffets")
                                .foregroundColor(Color("000000").opacity(0.7))
                                .font(Font.custom("poppins", size: 13))
                                .fontWeight(.medium)
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 40)
                                .frame(width: 92, height: 30, alignment: .center)
                                .foregroundColor(buffetsCheck ? Color("AAAAAA") : Color("White"))
                                .shadow(radius: 1)
                                .overlay(
                                    TextField("", text: $Buffets)
                                        .disabled(buffetsCheck ? true : false)
                                        .keyboardType(.numberPad)
                                        .padding(.leading)
                                )
                            
                        }
                        
                        if AppUtil.selectedCategory == "Wedding_Halls" {
                            
//                            HStack{
//                                Circle()
//                                    .frame(width: 25, height: 25, alignment: .center)
//                                    .foregroundColor(Color(weddingCakeCheck  ? "White" : "FEBB12"))
//                                    .shadow(radius: 1)
//                                    .onTapGesture {
//                                        weddingCakeCheck.toggle()
//                                    }
//
//                                Text("Wedding Cake")
//                                    .foregroundColor(Color("000000").opacity(0.7))
//                                    .font(Font.custom("poppins", size: 13))
//                                    .fontWeight(.medium)
//
//                                Spacer()
//
//                                RoundedRectangle(cornerRadius: 40)
//                                    .frame(width: 92, height: 30, alignment: .center)
//                                    .foregroundColor(Color("White"))
//                                    .shadow(radius: 1)
//                                    .overlay(
//                                        TextField("", text: $weddingCake)
//                                            .disabled(weddingCakeCheck ? true : false)
//                                            .keyboardType(.numberPad)
//                                            .padding(.leading)
//                                    )
//
//                            }
                            
//                            HStack{
//                                Circle()
//                                    .frame(width: 25, height: 25, alignment: .center)
//                                    .foregroundColor(Color(PhotographerCheck  ? "White" : "FEBB12"))
//                                    .shadow(radius: 1)
//                                    .onTapGesture {
//                                        PhotographerCheck.toggle()
//                                    }
//
//                                Text("Photographer")
//                                    .foregroundColor(Color("000000").opacity(0.7))
//                                    .font(Font.custom("poppins", size: 13))
//                                    .fontWeight(.medium)
//
//                                Spacer()
//
//                                RoundedRectangle(cornerRadius: 40)
//                                    .frame(width: 92, height: 30, alignment: .center)
//                                    .foregroundColor(Color("White"))
//                                    .shadow(radius: 1)
//                                    .overlay(
//                                        TextField("", text: $Photographer)
//                                            .disabled(PhotographerCheck ? true : false)
//                                            .keyboardType(.numberPad)
//                                            .padding(.leading)
//                                    )
//
//                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    LoginButton(title: "Review Service", callback: {
                        let addOnsobj =  AddOns()
                        
                        if AppUtil.selectedCategory != "Stadium" {
                            if AppUtil.selectedCategory == "Hotel" || AppUtil.selectedCategory == "Hotels" {
                                addOnsobj.weddingArrangements = WeddingArrangements
                                
                               // if WeddingArrangements != "" {
                                    AppUtil.addserviceObject?.addOns = addOnsobj
                                    serviceManager.addService?.addOns = addOnsobj
                                    
                                    viewRouter.currentPage = "ReviewService"
//                                } else {
//                                    togglepopup.toggle()
//                                }
                                
                               
                                
                            }
                            else if AppUtil.selectedCategory == "Resorts" {
                                addOnsobj.birthdayArrangements = BirthdayArrangements
                                addOnsobj.sleepover = sleepoverPrice
                               
                               
                                addOnsobj.weddingArrangements = WeddingArrangements
                                
                                AppUtil.addserviceObject?.addOns = addOnsobj
                                serviceManager.addService?.addOns = addOnsobj
                                
                                viewRouter.currentPage = "ReviewService"
                                
                            }
                            else if AppUtil.selectedCategory == "Farms"  {
                                addOnsobj.birthdayArrangements = BirthdayArrangements
                                addOnsobj.sleepover = sleepoverPrice
                               // addOnsobj.buffets = []
                                addOnsobj.weddingArrangements = WeddingArrangements
                                
                                AppUtil.addserviceObject?.addOns = addOnsobj
                                serviceManager.addService?.addOns = addOnsobj
                                
                                viewRouter.currentPage = "ReviewService"
                                
                            }
                            else if AppUtil.selectedCategory == "Wedding_Halls" {
//                                addOnsobj.Photographer = true
//                                addOnsobj.weddingCake = true
                                
                                AppUtil.addserviceObject?.addOns = addOnsobj
                                serviceManager.addService?.addOns = addOnsobj
                                
                                viewRouter.currentPage = "ReviewService"
                            }
                            else if AppUtil.selectedCategory == "Chalets" {
                                addOnsobj.birthdayArrangements = BirthdayArrangements
                            //    addOnsobj.sleepover = sleepoverPrice
                               // addOnsobj.buffets = []
                                addOnsobj.weddingArrangements = WeddingArrangements
                                AppUtil.addserviceObject?.addOns = addOnsobj
                                serviceManager.addService?.addOns = addOnsobj
                                
                                viewRouter.currentPage = "ReviewService"
                            }
                            else {
                                addOnsobj.birthdayArrangements = BirthdayArrangements
                                addOnsobj.sleepover = sleepoverPrice
                               // addOnsobj.buffets = []
                                addOnsobj.weddingArrangements = WeddingArrangements
                                
                                
                                AppUtil.addserviceObject?.addOns = addOnsobj
                                serviceManager.addService?.addOns = addOnsobj
                                
                                viewRouter.currentPage = "ReviewService"
                            }
                        }
                        else {
                            viewRouter.currentPage = "ReviewService"
                        }
                    })
                        .padding(.bottom,30)
                    

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
            .keyboardAdaptive()
    }
}

struct AddOnScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddOnScreen()
    }
}
