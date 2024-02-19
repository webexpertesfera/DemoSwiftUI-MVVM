//
//  CitySearchList.swift
//  SmartBookings
//
//  Created by Esfera-Macmini on 23/03/23.
//

import SwiftUI
struct CitySearchList: View {
    var title: String = "Lorem Ipsum Hotel"
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .frame(width: UIScreen.main.bounds.width - 50, height: 40, alignment: .center)
//            .foregroundColor(Color("White"))
            .shadow(color: Color("FFFFFF"), radius: 2, x: 0, y: 1)
            .overlay(
                HStack{
                    VStack{
                        Group {
                            HStack{
                                Text(title)
                                .foregroundColor(Color("000000").opacity(0.4))
                                .font(Font.custom("poppins", size: 16))
                                .fontWeight(.regular)
                                .lineSpacing(20)
                                .multilineTextAlignment(.leading)
                                Spacer()
                            }
                    }
                        .padding(.bottom,1)
                    }
                    Spacer()
                   
                }.padding(.horizontal)
            )
       }
 }

struct CitySearchList_view: PreviewProvider {
    static var previews: some View {
        CitySearchList()
    }
}
