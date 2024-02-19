//
//  AddService.swift
//  SmartBookings
//
//  Created by Sheheryar on 04/06/2022.
//

import SwiftUI

struct AddService: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    var body: some View {
        ZStack {
            VStack {
                TopNavigation(titleText: "Add Service")
                ScrollView(showsIndicators:false) {
                    VStack {
//                        viewRouter.currentPage = "AddService"
                        HStack{
                            Text("Please add details for new service")
                                .font(Font.custom("poppins", size: 16))
                                .foregroundColor(Color("000000").opacity(0.8))
                                .fontWeight(.semibold)
                            Spacer()
                        }.frame(width: UIScreen.main.bounds.width - 50)
                            AddServiceCard (
                                imageName: "informationImage",
                                title: "Basic Information",
                                description: "",
                                number: "1",
                                check: serviceManager.addService?.leisure != nil ? .constant(true) : .constant(false))
                            .padding(.top)
                            .onTapGesture {
                                viewRouter.currentPage = "BasicInformation"
                            }
                            
                            AddServiceCard(
                                imageName: "serviceDescription",
                                title: "Service Description",
                                description: "",
                                number: "2",
                                check: serviceManager.addService?.address != nil ? .constant(true) : .constant(false))
                            .padding(.top)
                            .onTapGesture{
                                if AppUtil.addserviceObject?.leisure != nil {
                                    if AppUtil.selectedCategory == "Stadium" {
                                        viewRouter.currentPage = "SafetyScreen"
                                    } else {
                                        viewRouter.currentPage = "RulesScreen"
                                    }
                                }
                            }
                            AddServiceCard(
                                imageName: "priceTag",
                                title: "Price Details",
                                description: "",
                                number: "3",
                                check: .constant(false))
                            .padding(.top)
                            .onTapGesture {
                                if  AppUtil.addserviceObject?.address != nil {
                                    viewRouter.currentPage = "PriceDetailScreen"
                                }
                            }
                        
                    }
                    .padding()
                }
                BottomNavigation()
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
    }
}

struct AddService_Previews: PreviewProvider {
    static var previews: some View {
        AddService()
    }
}
