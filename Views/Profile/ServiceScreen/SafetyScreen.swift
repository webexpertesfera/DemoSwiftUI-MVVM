//
//  SafetyScreen.swift
//  SmartBookings
//
//  Created by Sheheryar on 04/06/2022.
//

import SwiftUI

struct SafetyScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @State var safetyTypes: [String] = ["Carbon Monoxide Alarm","Fire Alarm","Fire Extinguisher","First Aid Kit"]
    @State var imageName: [String] = ["CO2ALARM","FIREALARM","FireExtinguisher","firstAid"]
    @State var safety: [Bool] = [false,false,false,false]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        ]
    
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText:"Safety")
                VStack{
                    HStack{
                        Text("Safety")
                            .foregroundColor(Color("000000").opacity(0.8))
                            .font(Font.custom("poppins", size: 18))
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }.padding(.horizontal,10)
                    HStack{
                        Text("Please select the safety types")
                            .foregroundColor(Color("000000").opacity(0.6))
                            .font(Font.custom("poppins", size: 14))
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }.padding(.horizontal,10)
                        .padding(.top,5)
                }
                ScrollView(showsIndicators:false){
                    VStack{
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(0 ..< safetyTypes.count, id: \.self) { item in
                                if AppUtil.selectedCategory == "Stadium" && safetyTypes[item] != "Fire Alarm" {
                                    SafetyCard(title: safetyTypes[item],
                                               imageName: imageName[item],
                                               check: $safety[item],callback: {
                                        constructbody(value: safetyTypes[item])
                                    })
                                } else if AppUtil.selectedCategory != "Stadium" {
                                    SafetyCard(title: safetyTypes[item],
                                               imageName: imageName[item],
                                               check: $safety[item],callback: {
                                        constructbody(value: safetyTypes[item])
                                    })
                                }
                                
                                   
                            }
                        }
                    }.padding(.top)
                    
                    LoginButton(title: "Next", callback: {
                        AppUtil.addserviceObject?.description?.safty = AppUtil.addserviceSafety
                        serviceManager.addService?.description?.safty = AppUtil.addserviceSafety
                        viewRouter.currentPage = "ServiceDescription"
                    }).padding(.bottom,30)
                }
               // BottomNavigation()
            }
            
        } .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .onAppear(perform: {
                AppUtil.addserviceObject?.description =  AppUtil.addServiceDescription
                serviceManager.addService?.description = AppUtil.addserviceObject?.description
            })
    }
    
    func constructbody(value : String){
        
        if value == "Carbon Monoxide Alarm"  {
            if AppUtil.addserviceSafety.carbonMonoxideAlarams == nil && !(AppUtil.addserviceSafety.carbonMonoxideAlarams ?? false) {
                AppUtil.addserviceSafety.carbonMonoxideAlarams = true
            } else {
                AppUtil.addserviceSafety.carbonMonoxideAlarams = false
            }
         
        }
        if value == "Fire Alarm"  {
            if AppUtil.addserviceSafety.fireAlaram == nil && !(AppUtil.addserviceSafety.fireAlaram ?? false) {
                AppUtil.addserviceSafety.fireAlaram = true
            } else {
                AppUtil.addserviceSafety.fireAlaram = false
            }
         
        }
        
        if value == "Fire Extinguisher"  {
            if AppUtil.addserviceSafety.fireExtinguisher == nil && !(AppUtil.addserviceSafety.fireExtinguisher ?? false) {
                AppUtil.addserviceSafety.fireExtinguisher = true
            } else {
                AppUtil.addserviceSafety.fireExtinguisher = false
            }
         
        }
        
        if value == "First Aid Kit"  {
            if AppUtil.addserviceSafety.firstAidKit == nil && !(AppUtil.addserviceSafety.firstAidKit ?? false) {
                AppUtil.addserviceSafety.firstAidKit = true
            } else {
                AppUtil.addserviceSafety.firstAidKit = false
            }
         
        }
        
       
        
    }
}

struct SafetyScreen_Previews: PreviewProvider {
    static var previews: some View {
        SafetyScreen()
    }
}
