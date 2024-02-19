//
//  ViewAllServiceimageVC.swift
//  SmartBookings
//
//  Created by Esfera-Macmini on 07/07/23.
//

import SwiftUI
import Combine
import UIKit

struct ViewAllServiceimageVC: View {

    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @State var pickerResult: [UIImage] = AppUtil.pickerResult

    @State var showImagePicker: Bool = false
    @State var togglepopup: Bool = false
    @State var doIWantThisViewToShow: Bool = true
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
               VStack{
                    TopNavigation(titleText:"Service All Image")
                    ScrollView( showsIndicators: false){
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(0 ..< AppUtil.pickerResult.count,id:\.self){ item in
                                    Image(uiImage: AppUtil.pickerResult[item])
                                        .resizable()
                                        .frame(width: 170, height: 150, alignment: .center)
                                        .cornerRadius(10)
                                    
                            }
                            
                        }
                    }
                }.frame(width: UIScreen.main.bounds.width - 20)
                        .padding(5)

        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .keyboardAdaptive()

    }
}

struct ViewAllServiceimageVC_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllServiceimageVC()
    }
}


struct ViewAllServiceimage: View {
    var imageName: String = "Group 7084"
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 22)
                .foregroundColor(Color("White"))
                .frame(width: 150, height: 160, alignment: .center)
                .overlay(
                    VStack{
                        AsyncImage(url: URL(string: imageName)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                            
                        } placeholder: {
                            //                                ProgressView()
                            Image("Group 3587")
                                .resizable()
                                .cornerRadius(5)
                        }.scaledToFit()
                        
                        Spacer()
                        
                    }
                )
        }
        
    }
 }
