//
//  BasicInformation.swift
//  SmartBookings
//
//  Created by Sheheryar on 04/06/2022.
//

import SwiftUI

struct BasicInformation: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var checks: [Bool] = [false,false,false,false,false,false,false,false,false,false]
    var types: [String] = ["Chalets","Resorts","Stadium","Apartment","Lounges","Camps",
                           "Wedding halls","Hotel","Farms"]
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Basic Information")
                ScrollView(showsIndicators:false) {
                    VStack{
                        VStack{
                            HStack{
                                Text("Service Type")
                                    .foregroundColor(Color("000000").opacity(0.8))
                                    .font(Font.custom("poppins", size: 16))
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }.padding(.horizontal)
                            
                            HStack{
                                Text("Please select the service type from the list")
                                    .foregroundColor(Color("000000").opacity(0.6))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }.padding(.horizontal)
                                .padding(.top,2)
                        }.padding(.vertical)
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(0 ..< (AppUtil.categorieslistt?.categories?.count ?? 0), id: \.self) { item in
                                
                                if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                                    if language == "ar"{
                                        BasicinfoCard(text:  AppUtil.categorieslistt?.categories![item].category_name_ar ?? "",
                                                      check: $checks[item], callback: {
                                            setCardCheck(index: item)
                                            AppUtil.selectedCategory = AppUtil.categorieslistt?.categories![item].type ?? ""
                                            serviceManager.addService?.categoryId = AppUtil.categorieslistt?.categories![item]._id ?? ""
                                            AppUtil.addserviceObject?.categoryId = AppUtil.categorieslistt?.categories![item]._id ?? ""
                                        })
                                    }else{
                                        BasicinfoCard(text:  AppUtil.categorieslistt?.categories![item].category ?? "",
                                                      check: $checks[item], callback: {
                                            setCardCheck(index: item)
                                            AppUtil.selectedCategory = AppUtil.categorieslistt?.categories![item].type ?? ""
                                            serviceManager.addService?.categoryId = AppUtil.categorieslistt?.categories![item]._id ?? ""
                                            AppUtil.addserviceObject?.categoryId = AppUtil.categorieslistt?.categories![item]._id ?? ""
                                        })
                                    }

                                } else {
                                    BasicinfoCard(text:  AppUtil.categorieslistt?.categories![item].category ?? "",
                                                  check: $checks[item], callback: {
                                        setCardCheck(index: item)
                                        AppUtil.selectedCategory = AppUtil.categorieslistt?.categories![item].type ?? ""
                                        serviceManager.addService?.categoryId = AppUtil.categorieslistt?.categories![item]._id ?? ""
                                        AppUtil.addserviceObject?.categoryId = AppUtil.categorieslistt?.categories![item]._id ?? ""
                                    })
                                }
                                
                                
                             
                                
//                                BasicinfoCard(text:  AppUtil.categories![item].category ?? "",
//                                              check: $checks[item], callback: {
//                                    setCardCheck(index: item)
//                                    AppUtil.selectedCategory = AppUtil.categories![item].type ?? ""
//                                    serviceManager.addService?.categoryId = AppUtil.categories?[item]._id ?? ""
//                                    AppUtil.addserviceObject?.categoryId = AppUtil.categories?[item]._id ?? ""
//
//                                })
                            }
                        }
                    }
                }
                Spacer()
                
                LoginButton(title: "Next", callback: {
                //    serviceManager.addService?.vender = AppUtil.userProfile?._id
                    viewRouter.currentPage = "BasicInfoDetail"
                }).padding(.bottom,30)
                
                //BottomNavigation()
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        .ignoresSafeArea(.all)
        .background(Color("F2F5F9"))
    }
    
    func setCardCheck(index: Int) {
       
        for i in  0..<checks.count {
            if i == index {
                checks[i] = true
            } else {
                checks[i] = false
            }
        }
    }
}

struct BasicInformation_Previews: PreviewProvider {
    static var previews: some View {
        BasicInformation()
    }
}
