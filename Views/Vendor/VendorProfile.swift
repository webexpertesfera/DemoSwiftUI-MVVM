//
//  VendorProfile.swift
//  SmartBookings
//
//  Created by Sheheryar on 28/05/2022.
//

import SwiftUI

struct VendorProfile: View {
    @EnvironmentObject var serviceManager: ServiceManager
    var textColor: String = "000000"
    var textColor2: String = "000000"
    @State var pickerResult: [UIImage] = []

    
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Vendor Profile")
                VStack{
                    VStack{
                        if AppUtil.selectedVendor?.file != "" && pickerResult.count == 0 {
                            AsyncImage(url: URL(string: AppUtil.selectedVendor?.file ?? "")) { image in
                                image.resizable()
                                    .clipShape(Circle())
                                    .scaledToFit()
                                    .frame(width: 120, height: 125, alignment: .center)
                            } placeholder: {
                               Image("VendorProfileImage")
                                    .resizable()
                                    .frame(width: 120, height: 125, alignment: .center)
                            }
                        }
                        
                        if pickerResult.count > 0 {
                            Image(uiImage: pickerResult[0])
                                .resizable()
                                .clipShape(Circle())
                                .scaledToFit()
                                .frame(width: 120, height: 125, alignment: .center)
                        }
                        Text("\(AppUtil.selectedVendor?.firstName ?? "")" + " " + "\(AppUtil.selectedVendor?.lastName ?? "")")
                            .font(Font.custom("poppins", size: 20))
                            .foregroundColor(Color(textColor).opacity(0.8))
                            .fontWeight(.semibold)
                        
                        HStack{
                            Spacer()
                            VStack{
                                Text("Joined")
                                    .font(Font.custom("poppins", size: 12))
                                    .foregroundColor(Color(textColor).opacity(0.4))
                                    .fontWeight(.regular)
                                    .padding(.bottom,2)
                                
                                Text(AppUtil.getDateOnly(format: "", dateValue: AppUtil.selectedVendor?.requestedAt ?? ""))
                                    .font(Font.custom("poppins", size: 14))
                                    .foregroundColor(Color(textColor).opacity(0.8))
                                    .fontWeight(.semibold)
                                    
                            }.padding(.trailing,30)
                            
                            VStack{
                                Text("Services")
                                    .font(Font.custom("poppins", size: 12))
                                    .foregroundColor(Color(textColor).opacity(0.4))
                                    .fontWeight(.regular)
                                    .padding(.bottom,2)
                                
                                Text(String(AppUtil.selectedVendor?.numberOfservices ?? 0))
                                    .font(Font.custom("poppins", size: 14))
                                    .foregroundColor(Color(textColor).opacity(0.8))
                                    .fontWeight(.semibold)
                                    
                            }.padding(.leading,30)
                            
                           
                            Spacer()
                            
                        }.padding(.vertical,5)
                        
                        VStack{
                            HStack{
                                StarsView2(rating: 4, maxRating: 5, size: 16)
                                Text(String(AppUtil.reviews.count))
                                    .font(Font.custom("poppins", size: 8))
                                    .foregroundColor(Color(textColor).opacity(0.6))
                                    .fontWeight(.regular)
                            }
                        }
                        
                        Divider()
                            .padding(.vertical)
                        HStack{
                            Text("Reviews")
                                .font(Font.custom("poppins", size: 19))
                                .foregroundColor(Color(textColor).opacity(0.8))
                                .fontWeight(.semibold)
                                
                            Text(String(AppUtil.reviews.count))
                                .font(Font.custom("poppins", size: 7))
                                .foregroundColor(Color(textColor2).opacity(0.6))
                                .fontWeight(.regular)
                            Spacer()
                        }.padding(.horizontal)
                        
                        ScrollView(showsIndicators: false){
                            
                            VStack{
                                
                                ForEach( 0 ..< AppUtil.reviews.count  ,id:\.self) { rev in
                                    ReviewCard(comment: AppUtil.reviews[rev].comment ?? "",
                                               rating: AppUtil.reviews[rev].rating ?? 0)
                                        .padding(5)
                                }
                            }
                            
                        }
                    }
                }
                BottomNavigation()
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            
    }
}

struct VendorProfile_Previews: PreviewProvider {
    static var previews: some View {
        VendorProfile()
    }
}
