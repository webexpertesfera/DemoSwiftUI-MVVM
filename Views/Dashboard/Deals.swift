//
//  Deals.swift
//  manasik
//
//  Created by Sheheryar on 29/05/2022.
//

import SwiftUI

struct Deals: View {
    @State var dealsList: [DealObject] = []
    @State var showPreloader: Bool = false
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Deals")
                VStack{
                    ScrollView{
                        ForEach(0 ..< dealsList.count,id:\.self) { item in
                            DealCard(Name: dealsList[item].dealName,
                                     location: dealsList[item].location, expiry:  AppUtil.getDateOnly(format: AppUtil.ONLY_DATE_THREE_FORMAT, dateValue: dealsList[item].expiryDate), ImageName: dealsList[item].categoryImage )
                                .padding(5)
                        }
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
                UserApiUtil.getDeals(success: { result in
                    dealsList = result
                    showPreloader = false
                }, failure: { _ in
                    showPreloader = false
                })
            })
    }
}

struct Deals_Previews: PreviewProvider {
    static var previews: some View {
        Deals()
    }
}
