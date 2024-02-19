//
//  BookingSettingsScreen.swift
//  SmartBookings
//
//  Created by Sheheryar on 08/06/2022.
//

import SwiftUI

struct BookingSettingsScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @State var togglepopup: Bool = false
    @State var bookingFor: String = AppUtil.addserviceObject?.bookingSetting?.bookingFor ?? ""
    @State var securityDeposit: Bool = AppUtil.addserviceObject?.bookingSetting?.securityDeposit ?? false
    @State var lastMinuteDeposit: Bool = AppUtil.addserviceObject?.bookingSetting?.lastMinuteDiscount ?? false
    @State var securityDepositAmount: String = ""
    @State var days: String = AppUtil.validateVariable(AppUtil.addserviceObject?.bookingSetting?.days ?? 0)
    @State var percentage: String = AppUtil.validateVariable(AppUtil.addserviceObject?.bookingSetting?.discountPercentage ?? 0)
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText:"Booking Settings")
                HStack{
                    Text("Booking Settings")
                        .foregroundColor(Color("000000").opacity(0.8))
                        .font(Font.custom("poppins", size: 16))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                HStack{
                    Text("Please select the booking settings")
                        .foregroundColor(Color("000000").opacity(0.6))
                        .font(Font.custom("poppins", size: 12))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                    .padding(.top,5)
                HStack{
                    Text("Category")
                        .foregroundColor(Color("000000").opacity(0.8))
                        .font(Font.custom("poppins", size: 16))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                    .padding(.vertical,5)
                ScrollView(showsIndicators:false){
                    HStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 110, height: 115, alignment: .center)
                            .foregroundColor(Color(bookingFor == serviceBookingFor.Families_and_Singles.rawValue ? "FEBB12" : "White"))
                            .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
                            .overlay(
                                VStack{
                                    VStack{
                                        Image("FamiliesAndSingle")
                                            .scaledToFit()
                                    }.frame(width: 45, height: 30, alignment: .center)
                                  
                                        
                                    
                                    Text("Families & Singles")
                                        .foregroundColor(Color("000000").opacity(0.7))
                                        .font(Font.custom("poppins", size: 15))
                                        .fontWeight(.regular)
                                        .multilineTextAlignment(.center)

                                }.onTapGesture {
                                    bookingFor = serviceBookingFor.Families_and_Singles.rawValue
                                    AppUtil.addserviceObject?.bookingSetting?.bookingFor = bookingFor
                                }
                            )
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 110, height: 115, alignment: .center)
                            .foregroundColor(Color(bookingFor == serviceBookingFor.Only_families.rawValue ? "FEBB12" : "White"))
                            .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
                            .overlay(
                                VStack{
                                    VStack{
                                        Image("FamilyOnly")
                                            .scaledToFit()
                                    }.frame(width: 38, height: 41, alignment: .center)
                                  
                                        
                                    
                                    Text("Families Only")
                                        .foregroundColor(Color("000000").opacity(0.7))
                                        .font(Font.custom("poppins", size: 15))
                                        .fontWeight(.regular)
                                        .multilineTextAlignment(.center)

                                }.onTapGesture {
                                    bookingFor = serviceBookingFor.Only_families.rawValue
                                    AppUtil.addserviceObject?.bookingSetting?.bookingFor = bookingFor
                                }
                            )
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 110, height: 115, alignment: .center)
                            .foregroundColor(Color(bookingFor == serviceBookingFor.ladies.rawValue  ? "FEBB12" : "White"))
                            .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
                            .overlay(
                                VStack{
                                    VStack{
                                        Image("LadyOnly")
                                            .scaledToFit()
                                    }.frame(width: 34, height: 49, alignment: .center)
                                  
                                        
                                    
                                    Text("Ladies Only")
                                        .foregroundColor(Color("000000").opacity(0.7))
                                        .font(Font.custom("poppins", size: 15))
                                        .fontWeight(.regular)
                                        .multilineTextAlignment(.center)

                                }.onTapGesture {
                                    bookingFor = serviceBookingFor.ladies.rawValue
                                    AppUtil.addserviceObject?.bookingSetting?.bookingFor = bookingFor
                                }
                            )
                    }
                    .padding(.horizontal)
                    
                    VStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: UIScreen.main.bounds.width - 70, height: 72, alignment: .center)
                            .foregroundColor(Color("White"))
                            .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
                            .overlay(
                                VStack{
                                    HStack{
                                        Text("Booking Type")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 16))
                                            .fontWeight(.regular)
                                        Spacer()
                                    }.padding(.horizontal)
                                    HStack{
                                        Text(serviceManager.selectedBookingType == "24-Hour" ? "24-Hour Request" : "Instant Booking")
                                            .foregroundColor(Color("000000").opacity(0.5))
                                            .font(Font.custom("poppins", size: 11))
                                            .fontWeight(.regular)
                                        Spacer()
                                    }.padding(.horizontal)
                                }
                            
                            ).onTapGesture{
                                viewRouter.currentPage = "BookingTypes"
                            }
                        
                        
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: UIScreen.main.bounds.width - 70, height: 72, alignment: .center)
                            .foregroundColor(Color("White"))
                            .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
                            .overlay(
                                VStack{
                                    HStack{
                                        Text("Cancellation Policy ")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 16))
                                            .fontWeight(.regular)
                                        Spacer()
                                    }.padding(.horizontal)
                                    HStack{
                                        Text(serviceManager.selectedCancellationType ?? "")
                                            .foregroundColor(Color("000000").opacity(0.5))
                                            .font(Font.custom("poppins", size: 11))
                                            .fontWeight(.regular)
                                        Spacer()
                                    }.padding(.horizontal)
                                }
                            
                            ).onTapGesture{
                                viewRouter.currentPage = "CancellationPolicyScreen"
                            }
                        
                        
                    }.padding(.vertical)
                   
                    VStack{
                        HStack{
                            Toggle(isOn: $securityDeposit) {
                                Text("Security Deposit")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 15))
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center)
                            }
                        }.padding(.horizontal)
                    }
                    
                    if securityDeposit {
                        HStack{
                            Text("Minimum Deposit Amount")
                                .foregroundColor(Color("000000").opacity(0.7))
                                .font(Font.custom("poppins", size: 13))
                                .fontWeight(.medium)
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 40)
                                .frame(width: 92, height: 30, alignment: .center)
                                .foregroundColor(Color("White"))
                                .shadow(radius: 1)
                                .overlay(
                                    TextField("", text: $securityDepositAmount)
                                        .keyboardType(.numberPad)
                                        .padding(.leading)
                                )
                        }.padding(.horizontal)
                            .padding(.vertical,10)
                    }
                    
                    VStack{
                        HStack{
                            Toggle(isOn: $lastMinuteDeposit) {
                                Text("Last Minute Discount")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 15))
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center)
                            }
                        }.padding(.horizontal)
                    }
                    
                    if lastMinuteDeposit {
                        HStack{
                            Text("Discount Percentage")
                                .foregroundColor(Color("000000").opacity(0.7))
                                .font(Font.custom("poppins", size: 13))
                                .fontWeight(.medium)
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 40)
                                .frame(width: 92, height: 30, alignment: .center)
                                .foregroundColor(Color("White"))
                                .shadow(radius: 1)
                                .overlay(
                                    TextField("", text: $percentage)
                                        .keyboardType(.numberPad)
                                        .padding(.leading)
                                )
                        }.padding(.horizontal)
                            .padding(.vertical,10)
                        HStack{
                            Text("Days")
                                .foregroundColor(Color("000000").opacity(0.7))
                                .font(Font.custom("poppins", size: 13))
                                .fontWeight(.medium)
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 40)
                                .frame(width: 92, height: 30, alignment: .center)
                                .foregroundColor(Color("White"))
                                .shadow(radius: 1)
                                .overlay(
                                    TextField("", text: $days)
                                        .keyboardType(.numberPad)
                                        .padding(.leading)
                                )
                        }.padding(.horizontal)
                            .padding(.vertical,10)
                    }
                    
                    HStack{
                        
                        Text("")
                            .foregroundColor(Color("000000").opacity(0.5))
                            .font(Font.custom("poppins", size: 12))
                            .fontWeight(.regular)
                            .multilineTextAlignment(.leading)
                            .frame(width: 300)
                        
                        Spacer()
                        
                    }.padding(.horizontal)
                    
                    LoginButton(title: "Next", callback: {
                        
                        let booking = BookingSetting()
                     
                        booking.bookingFor = bookingFor

                        if serviceManager.selectedCancellationType != "" && serviceManager.selectedBookingType != ""  {
                            booking.bookingType = serviceManager.selectedBookingType
                            booking.securityAmount = Int(securityDepositAmount)
                            booking.securityDeposit = securityDeposit
                            booking.lastMinuteDiscount = lastMinuteDeposit
                            booking.days = Int(days)
                            booking.discountPercentage = Int(percentage)
                            booking.canellationPolicy = serviceManager.selectedCancellationType
                            AppUtil.addserviceObject?.bookingSetting = booking
                            serviceManager.addService?.bookingSetting = booking
                            
                            if  AppUtil.addserviceObject?.bookingSetting?.bookingFor != "" {
                                viewRouter.currentPage = "AddOnScreen"
                            } else {
                                togglepopup.toggle()
                            }
                        } else {
                            togglepopup.toggle()
                        }
                        
                       
                        
                    })
                       // .padding(.bottom,30)
                    
                  
                }
                
            }
            .keyboardAdaptive()
            
            if togglepopup {
                ZStack{
                    
                    VStack {}
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("000000"))
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.6)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 330, alignment: .center)
                        .foregroundColor(Color("White"))
                        .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 1)
                        .overlay(
                            VStack{
                                VStack{
                                    Image("informationIcon")
                                        .scaledToFit()
                                }
                                .frame(width: 108, height: 110, alignment: .center)
                                .padding(.top)
                                
                                Text("Error?")
                                    .foregroundColor(Color("000000"))
                                    .font(Font.custom("poppins", size: 20))
                                    .fontWeight(.bold)
                                
                                Text("Please input all fields")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                    .padding(.top,1)
                                
                                HStack{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 70)
                                            .foregroundColor(Color("White"))
                                        
                                        RoundedRectangle(cornerRadius: 70)
                                            .stroke(Color("707070"),lineWidth: 1)
                                            .overlay(
                                                    Text("OK")
                                                        .foregroundColor(Color("000000").opacity(0.4))
                                                        .font(Font.custom("poppins", size: 18))
                                                        .fontWeight(.regular)
                                            )
                                        
                                    }.frame(width: 120, height: 35, alignment: .center)
                                        .onTapGesture{
                                            togglepopup.toggle()
                                        }
                                    
                                   
                                }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .padding(.vertical)
                                    
                                
                            }
                        )

                }
            }
            
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .onAppear(perform: {
                
                if AppUtil.addserviceObject?.bookingSetting?.bookingFor != nil {
                    bookingFor = AppUtil.addserviceObject?.bookingSetting?.bookingFor ?? ""
                } else {
                  bookingFor =  serviceBookingFor.Families_and_Singles.rawValue
                }
                               
                securityDepositAmount = String(AppUtil.addserviceObject?.bookingSetting?.securityAmount ?? 0)
                securityDeposit = AppUtil.addserviceObject?.bookingSetting?.securityDeposit ?? false
                lastMinuteDeposit =  AppUtil.addserviceObject?.bookingSetting?.lastMinuteDiscount ?? false
            }).onTapGesture {
                hideKeyboard()
            }
         }
    }

struct BookingSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        BookingSettingsScreen()
    }
}
