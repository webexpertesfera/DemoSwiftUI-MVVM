//
//  EditSafetyScreen.swift
//  SmartBookings
//
//  Created by Esfera-Macmini on 31/07/23.
//

import SwiftUI

struct EditSafetyScreen: View {
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
                        AppUtil.editserviceObject?.description?.safty = AppUtil.editserviceObject?.description?.safty
                        serviceManager.editserviceObject?.description?.safty = AppUtil.editserviceObject?.description?.safty
                        viewRouter.currentPage = "EditServiceDescription"
                    }).padding(.bottom,30)
                }
               // BottomNavigation()
            }
            
        } .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .onAppear(perform: {
                AppUtil.editserviceObject?.description =  AppUtil.editserviceObject?.description
                serviceManager.editserviceObject?.description = AppUtil.editserviceObject?.description
            })
    }
    
    func constructbody(value : String){
        
        if value == "Carbon Monoxide Alarm"  {
            if AppUtil.editserviceObject?.description?.safty?.carbonMonoxideAlarams == nil && !(AppUtil.editserviceObject?.description?.safty?.carbonMonoxideAlarams ?? false) {
                AppUtil.editserviceObject?.description?.safty?.carbonMonoxideAlarams = true
            } else {
                AppUtil.editserviceObject?.description?.safty?.carbonMonoxideAlarams = false
            }
         
        }
        if value == "Fire Alarm"  {
            if AppUtil.editserviceObject?.description?.safty?.fireAlaram == nil && !(AppUtil.editserviceObject?.description?.safty?.fireAlaram ?? false) {
                AppUtil.editserviceObject?.description?.safty?.fireAlaram = true
            } else {
                AppUtil.editserviceObject?.description?.safty?.fireAlaram = false
            }
         
        }
        
        if value == "Fire Extinguisher"  {
            if AppUtil.editserviceObject?.description?.safty?.fireExtinguisher == nil && !(AppUtil.editserviceObject?.description?.safty?.fireExtinguisher ?? false) {
                AppUtil.editserviceObject?.description?.safty?.fireExtinguisher = true
            } else {
                AppUtil.editserviceObject?.description?.safty?.fireExtinguisher = false
            }
         
        }
        
        if value == "First Aid Kit"  {
            if AppUtil.editserviceObject?.description?.safty?.firstAidKit == nil && !(AppUtil.editserviceObject?.description?.safty?.firstAidKit ?? false) {
                AppUtil.editserviceObject?.description?.safty?.firstAidKit = true
            } else {
                AppUtil.editserviceObject?.description?.safty?.firstAidKit = false
            }
         
        }
        
       
        
    }
}

struct EditSafetyScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditSafetyScreen()
    }
}
