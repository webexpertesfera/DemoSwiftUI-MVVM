//
//  EditAddService_View.swift
//  SmartBookings
//
//  Created by Esfera-Macmini on 31/07/23.
//

import SwiftUI

struct EditAddService_View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    var body: some View {
        ZStack {
            VStack {
                TopNavigation(titleText: " Edit Add Service")
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
                        
                            AddServiceCard(
                                imageName: "informationImage",
                                title: "Basic Information",
                                description: "",
                                number: "1",
                                check: .constant(true))
                            .padding(.top)
                            .onTapGesture {
                                AppUtil.selectedCategory = serviceManager.selectedService?.category?.type ?? ""
                                viewRouter.currentPage = "EditBookingInfoDetails"
                            }
                            
                            AddServiceCard (
                                imageName: "serviceDescription",
                                title: "Service Description",
                                description: "",
                                number: "2",
                                check: .constant(true))
                            .padding(.top)
                            .onTapGesture {
//                                if AppUtil.addserviceObject?.leisure != nil {
                                    if AppUtil.selectedCategory == "Stadium" {
                                        viewRouter.currentPage = "EditSafetyScreen"
                                    } else {
                                        viewRouter.currentPage = "EditRulesScreen"
                                    }
//                                }
                            }
                            AddServiceCard (
                                imageName: "priceTag",
                                title: "Price Details",
                                description: "",
                                number: "3",
                                check: .constant(false))
                            .padding(.top)
                            .onTapGesture {
//                                if AppUtil.addserviceObject?.address != nil {
                                    viewRouter.currentPage = "EditPriceDetailScreen"
//                                }
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

struct EditAddService_View_Previews: PreviewProvider {
    static var previews: some View {
        EditAddService_View()
    }
}
