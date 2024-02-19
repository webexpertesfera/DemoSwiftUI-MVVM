//
//  SavedScreen.swift
//  manasik
//
//  Created by Sheheryar on 10/08/2022.
//

import SwiftUI

struct SavedScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @State var savedProfiles: [Camp] = []
    @State var showPreloader: Bool = false
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Saved")
                VStack{
                    if AppUtil.userProfile?.role != "Guest"{
                        
                        ScrollView{
                            ForEach(0 ..< savedProfiles.count,id:\.self) { item in
//                           savedProfiles[item].description?.images.count ?? 0 > 0 ? : ""
//                                savedProfiles[item].description?.images[0] ?? ""
                                
                                
                                SearchResultCard(ImageName: savedProfiles[item].description?.images.count ?? 0 > 0 ? savedProfiles[item].description?.images[0] ?? "" : "",
                                                 Name: savedProfiles[item].description?.nameInEnglish ?? "",
                                                 address: savedProfiles[item].address?.address ?? "",
                                                 price: String(savedProfiles[item].price?.dayPrice ?? 0),
                                                 favCheck: .constant(true),
                                                 reviewCount: String( savedProfiles[item].reviews.count),
                                                 ratingNumber: savedProfiles[item].rating ?? 0.0 ,
                                                 callback:{
                                    
                                        })
                                
                                .padding(5)
                                .onTapGesture {
                                    serviceManager.selectedCamp = savedProfiles[item]
                                    viewRouter.currentPage = "SearchedDetail"
                                }
                            }
                        }
                    }else {
                        Spacer()
                        LoginButton(title: "Login", callback: {
                            viewRouter.currentPage = "LoginScreen"
                        })
                        Spacer()
                    }
                    
                }
                
                BottomNavigation()
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
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .onAppear(perform: {
                showPreloader = true
                UserApiUtil.getFavourites(success: { res in
                    showPreloader = false
                    savedProfiles = res
                }, failure: { _ in
                    showPreloader = false
                })
            })
    }
}

struct SavedScreen_Previews: PreviewProvider {
    static var previews: some View {
        SavedScreen()
    }
}
