//
//  PriceDetailScreen.swift
//  SmartBookings
//
//  Created by Sheheryar on 07/06/2022.
//

import SwiftUI

struct PriceDetailScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @State var fromDate: Date = Date()
    @State var Weekdays: String = AppUtil.validateVariable(AppUtil.addserviceObject?.price?.weekendPrice ?? 0)
    @State var dayPrice: String = AppUtil.validateVariable(AppUtil.addserviceObject?.price?.dayPrice ?? 0)
    @State var Sunday: String = AppUtil.validateVariable(AppUtil.addserviceObject?.price?.sundayPrice ?? 0)
    @State var Monday: String = AppUtil.validateVariable(AppUtil.addserviceObject?.price?.mondayPrice ?? 0)
    @State var Tuesday: String = AppUtil.validateVariable(AppUtil.addserviceObject?.price?.tuesdayPrice ?? 0)
    @State var Wednesday: String = AppUtil.validateVariable(AppUtil.addserviceObject?.price?.wednesdayPrice ?? 0)
    @State var Thursday: String = AppUtil.validateVariable(AppUtil.addserviceObject?.price?.thrusdayPrice ?? 0)
    @State var Friday: String = AppUtil.validateVariable(AppUtil.addserviceObject?.price?.fridayPrice ?? 0)
    @State var Saturday: String = ""
    @State var hourPrice: String = ""
    @State var availableFrom: Date = Date()
    @State var availableTill: Date = Date()
    @State var setdate: Date = Date()
    @State var setTime: Date = Date()
    
    @State var checkInTime: Date = Date()
    @State var checkOutTime: Date = Date()
    @State var openFrom: Date = Date()
    @State var openTo: Date = Date()
    @State var weekdaysCheck = true
    @State var daysPrice = true
    @State var thursdayCheck: Bool = true
    @State var fridayCheck: Bool = true
    @State var saturdayCheck: Bool = true
    @State var errorMessage: String = ""
    @State var togglepopup: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText:"Price Details")
                HStack{
                    Text("Pricing")
                        .foregroundColor(Color("000000").opacity(0.8))
                        .font(Font.custom("poppins", size: 16))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                HStack{
                    Text("Please enter the pricing for your service")
                        .foregroundColor(Color("000000").opacity(0.6))
                        .font(Font.custom("poppins", size: 12))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                    .padding(.top,5)
                ScrollView(showsIndicators:false){
                    VStack{
                        if AppUtil.selectedCategory != "Stadium" {
                 
                            if daysPrice{
                                Group {
                                    HStack{
                                         Circle()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(Color("White"))
                                            .shadow(radius: 1)
                                            .opacity(0)
                                        
                                        Text("Name")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 15))
                                            .fontWeight(.semibold)
                                            
                                        Spacer()
                                        
                                        Text("Price")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 15))
                                            .fontWeight(.semibold)
                                            .padding(.trailing,30)
                                    }
                                    
                                    HStack {
                                        
                                        Circle()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(daysPrice ? Color("White") : Color("FEBB12"))
                                            .shadow(radius: 1)
                                            .onTapGesture {
                                                daysPrice.toggle()
                                                dayPrice = ""
                                            }
                                        
                                        Text("Days Price")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 40)
                                            .frame(width: 92, height: 30, alignment: .center)
                                            .foregroundColor(daysPrice ? Color("AAAAAA") : Color("White"))
                                            .shadow(radius: 1)
                                            .overlay(
                                                TextField("", text: $dayPrice)
                                                    .disabled(daysPrice ? true : false)
                                                    .keyboardType(.numberPad)
                                                    .padding(.leading)
                                            )
                                        }
                                    
                                    HStack{
                                        Circle()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(weekdaysCheck ? Color("White") : Color("FEBB12"))
                                            .shadow(radius: 1)
                                            .onTapGesture {
                                                weekdaysCheck.toggle()
                                                Weekdays = ""
                                            }
                                        
                                        Text("Weekdays( Sun to Wed )")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 40)
                                            .frame(width: 92, height: 30, alignment: .center)
                                            .foregroundColor(weekdaysCheck ? Color("AAAAAA") : Color("White"))
                                            .shadow(radius: 1)
                                            .overlay(
                                                TextField("", text: $Weekdays)
                                                    .disabled(weekdaysCheck ? true : false)
                                                    .keyboardType(.numberPad)
                                                    .padding(.leading)
                                            )
                                     }
                                    
                                    
                                    
                                        HStack{
                                            Circle()
                                                .frame(width: 25, height: 25, alignment: .center)
                                                .foregroundColor(weekdaysCheck ? Color("White") : Color("FEBB12"))
                                                .shadow(radius: 1)
                                            
                                            Text("Sunday")
                                                .foregroundColor(Color("000000").opacity(0.7))
                                                .font(Font.custom("poppins", size: 13))
                                                .fontWeight(.medium)
                                            
                                            Spacer()
                                            
                                            RoundedRectangle(cornerRadius: 40)
                                                .frame(width: 92, height: 30, alignment: .center)
                                                .foregroundColor(weekdaysCheck ? Color("AAAAAA") : Color("White"))
                                                .shadow(radius: 1)
                                                .overlay(
                                                    TextField("", text: $Weekdays)
                                                        .disabled(true)
                                                        .disabled(weekdaysCheck ? true : false)
                                                        .keyboardType(.numberPad)
                                                        .padding(.leading)
                                                )
                                         }

                                    
                                        HStack{
                                            Circle()
                                                .frame(width: 25, height: 25, alignment: .center)
                                                .foregroundColor(weekdaysCheck ? Color("White") : Color("FEBB12"))
                                                .shadow(radius: 1)
                                            
                                            Text("Monday")
                                                .foregroundColor(Color("000000").opacity(0.7))
                                                .font(Font.custom("poppins", size: 13))
                                                .fontWeight(.medium)
                                            
                                            Spacer()
                                            
                                            RoundedRectangle(cornerRadius: 40)
                                                .frame(width: 92, height: 30, alignment: .center)
                                                .foregroundColor(weekdaysCheck ? Color("AAAAAA") : Color("White"))
                                                .shadow(radius: 1)
                                                .overlay(
                                                    TextField("", text: $Weekdays)
                                                        .disabled(true)
                                                        .disabled(weekdaysCheck ? true : false)
                                                        .keyboardType(.numberPad)
                                                        .padding(.leading)
                                                )
                                            
                                        }
                                        
                                        HStack{
                                          
                                            Circle()
                                                .frame(width: 25, height: 25, alignment: .center)
                                                .foregroundColor(weekdaysCheck ? Color("White") : Color("FEBB12"))
                                                .shadow(radius: 1)
                                            
                                            Text("Tuesday")
                                                .foregroundColor(Color("000000").opacity(0.7))
                                                .font(Font.custom("poppins", size: 13))
                                                .fontWeight(.medium)
                                            
                                            Spacer()
                                            
                                            RoundedRectangle(cornerRadius: 40)
                                                .frame(width: 92, height: 30, alignment: .center)
                                                .foregroundColor(weekdaysCheck ? Color("AAAAAA") : Color("White"))
                                                .shadow(radius: 1)
                                                .overlay(
                                                    TextField("", text: $Weekdays)
                                                        .disabled(true)
                                                        .disabled(weekdaysCheck ? true : false)
                                                        .keyboardType(.numberPad)
                                                        .padding(.leading)
                                                )
                                            
                                        }
                                        
                                        HStack{
                                          
                                            Circle()
                                                .frame(width: 25, height: 25, alignment: .center)
                                                .foregroundColor(weekdaysCheck ? Color("White") : Color("FEBB12"))
                                                .shadow(radius: 1)
                                            
                                            Text("Wednesday")
                                                .foregroundColor(Color("000000").opacity(0.7))
                                                .font(Font.custom("poppins", size: 13))
                                                .fontWeight(.medium)
                                            
                                            Spacer()
                                            
                                            RoundedRectangle(cornerRadius: 40)
                                                .frame(width: 92, height: 30, alignment: .center)
                                                .foregroundColor(weekdaysCheck ? Color("AAAAAA") : Color("White"))
                                                .shadow(radius: 1)
                                                .overlay(
                                                    TextField("", text: $Weekdays)
                                                        .disabled(true)
                                                        .disabled(weekdaysCheck ? true : false)
                                                        .keyboardType(.numberPad)
                                                        .padding(.leading)
                                                )
                                        }
                                }
                                .padding(.horizontal)
                                
                                Group {

                                    HStack{
                                        Circle()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(thursdayCheck ? Color("White") : Color("FEBB12"))
                                            .shadow(radius: 1)
                                            .onTapGesture {
                                                thursdayCheck.toggle()
                                                Thursday = ""
                                            }
                                        
                                        Text("Thursday")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 40)
                                            .frame(width: 92, height: 30, alignment: .center)
                                            .foregroundColor(thursdayCheck ? Color("AAAAAA") : Color("White"))
                                            .shadow(radius: 1)
                                            .overlay(
                                                TextField("", text: $Thursday)
                                                    .disabled(thursdayCheck ? true : false)
                                                    .keyboardType(.numberPad)
                                                    .padding(.leading)
                                            )
                                        
                                    }
                                    
                                    HStack{
                                        Circle()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(fridayCheck ? Color("White") : Color("FEBB12"))
                                            .shadow(radius: 1)
                                            .onTapGesture {
                                                fridayCheck.toggle()
                                                Friday = ""
                                            }
                                        
                                        Text("Friday")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 40)
                                            .frame(width: 92, height: 30, alignment: .center)
                                            .foregroundColor(fridayCheck ? Color("AAAAAA") : Color("White"))
                                            .shadow(radius: 1)
                                            .overlay(
                                                TextField("", text: $Friday)
                                                    .disabled(fridayCheck ? true : false)
                                                    .keyboardType(.numberPad)
                                                    .padding(.leading)
                                            )
                                        
                                    }
                                    
                                    HStack{
                                        Circle()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(saturdayCheck ? Color("White") : Color("FEBB12"))
                                            .shadow(radius: 1)
                                            .onTapGesture {
                                                saturdayCheck.toggle()
                                                Saturday = ""
                                            }
                                        
                                        Text("Saturday")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 40)
                                            .frame(width: 92, height: 30, alignment: .center)
                                            .foregroundColor(saturdayCheck ? Color("AAAAAA") : Color("White"))
                                            .shadow(radius: 1)
                                            .overlay(
                                                TextField("", text: $Saturday)
                                                    .disabled(saturdayCheck ? true : false)
                                                    .keyboardType(.numberPad)
                                                    .padding(.leading)
                                            )
                                        
                                    }
                                    
                                    
                                }.padding(.horizontal)

                                Divider()
                                    .padding(.vertical)
                                
                            
                            } else {
                                Group {
                                    
                                    HStack{
                                         Circle()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(Color("White"))
                                            .shadow(radius: 1)
                                            .opacity(0)
                                        
                                        Text("Name")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 15))
                                            .fontWeight(.semibold)
                                            
                                        Spacer()
                                        
                                        Text("Price")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 15))
                                            .fontWeight(.semibold)
                                            .padding(.trailing,30)
                                    }

                                    HStack{
                                        Circle()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(daysPrice ? Color("White") : Color("FEBB12"))
                                            .shadow(radius: 1)
                                            .onTapGesture {
                                                daysPrice.toggle()
                                                dayPrice = ""
                                            }
                                        
                                        Text("Days Price")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 40)
                                            .frame(width: 92, height: 30, alignment: .center)
                                            .foregroundColor(daysPrice ? Color("AAAAAA") : Color("White"))
                                            .shadow(radius: 1)
                                            .overlay(
                                                TextField("", text: $dayPrice)
                                                    .disabled(daysPrice ? true : false)
                                                    .keyboardType(.numberPad)
                                                    .padding(.leading)
                                            )
                                        }
                                    
                                    HStack{
                                        Circle()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(daysPrice ? Color("White") : Color("FEBB12"))
                                            .shadow(radius: 1)
                                        
                                        Text("Weekdays( Sun to Wed )")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 40)
                                            .frame(width: 92, height: 30, alignment: .center)
                                            .foregroundColor(daysPrice ? Color("AAAAAA") : Color("White"))
                                            .shadow(radius: 1)
                                            .overlay(
                                                TextField("", text: $dayPrice)
                                                    .disabled(true)
                                                    .disabled(daysPrice ? true : false)
                                                    .keyboardType(.numberPad)
                                                    .padding(.leading)
                                               )
                                     }
                                    
                                    
                                    
                                        HStack{
                                            Circle()
                                                .frame(width: 25, height: 25, alignment: .center)
                                                .foregroundColor(daysPrice ? Color("White") : Color("FEBB12"))
                                                .shadow(radius: 1)
                                            
                                            Text("Sunday")
                                                .foregroundColor(Color("000000").opacity(0.7))
                                                .font(Font.custom("poppins", size: 13))
                                                .fontWeight(.medium)
                                            
                                            Spacer()
                                            
                                            RoundedRectangle(cornerRadius: 40)
                                                .frame(width: 92, height: 30, alignment: .center)
                                                .foregroundColor(daysPrice ? Color("AAAAAA") : Color("White"))
                                                .shadow(radius: 1)
                                                .overlay(
                                                    TextField("", text: $dayPrice)
                                                        .disabled(true)
                                                        .disabled(daysPrice ? true : false)
                                                        .keyboardType(.numberPad)
                                                        .padding(.leading)
                                                )
                                         }

                                    
                                        HStack{
                                            Circle()
                                                .frame(width: 25, height: 25, alignment: .center)
                                                .foregroundColor(daysPrice ? Color("White") : Color("FEBB12"))
                                                .shadow(radius: 1)
                                            
                                            Text("Monday")
                                                .foregroundColor(Color("000000").opacity(0.7))
                                                .font(Font.custom("poppins", size: 13))
                                                .fontWeight(.medium)
                                            
                                            Spacer()
                                            
                                            RoundedRectangle(cornerRadius: 40)
                                                .frame(width: 92, height: 30, alignment: .center)
                                                .foregroundColor(daysPrice ? Color("AAAAAA") : Color("White"))
                                                .shadow(radius: 1)
                                                .overlay(
                                                    TextField("", text: $dayPrice)
                                                        .disabled(true)
                                                        .disabled(daysPrice ? true : false)
                                                        .keyboardType(.numberPad)
                                                        .padding(.leading)
                                                )
                                            
                                        }
                                        
                                        HStack{
                                          
                                            Circle()
                                                .frame(width: 25, height: 25, alignment: .center)
                                                .foregroundColor(daysPrice ? Color("White") : Color("FEBB12"))
                                                .shadow(radius: 1)
                                            
                                            Text("Tuesday")
                                                .foregroundColor(Color("000000").opacity(0.7))
                                                .font(Font.custom("poppins", size: 13))
                                                .fontWeight(.medium)
                                            
                                            Spacer()
                                            
                                            RoundedRectangle(cornerRadius: 40)
                                                .frame(width: 92, height: 30, alignment: .center)
                                                .foregroundColor(daysPrice ? Color("AAAAAA") : Color("White"))
                                                .shadow(radius: 1)
                                                .overlay(
                                                    TextField("", text: $dayPrice)
                                                        .disabled(true)
                                                        .disabled(daysPrice ? true : false)
                                                        .keyboardType(.numberPad)
                                                        .padding(.leading)
                                                )
                                            
                                        }
                                        
                                        HStack{
                                          
                                            Circle()
                                                .frame(width: 25, height: 25, alignment: .center)
                                                .foregroundColor(daysPrice ? Color("White") : Color("FEBB12"))
                                                .shadow(radius: 1)
                                            
                                            Text("Wednesday")
                                                .foregroundColor(Color("000000").opacity(0.7))
                                                .font(Font.custom("poppins", size: 13))
                                                .fontWeight(.medium)
                                            
                                            Spacer()
                                            
                                            RoundedRectangle(cornerRadius: 40)
                                                .frame(width: 92, height: 30, alignment: .center)
                                                .foregroundColor(daysPrice ? Color("AAAAAA") : Color("White"))
                                                .shadow(radius: 1)
                                                .overlay(
                                                    TextField("", text: $dayPrice)
                                                        .disabled(true)
                                                        .disabled(daysPrice ? true : false)
                                                        .keyboardType(.numberPad)
                                                        .padding(.leading)
                                                      
                                                )
                                            
                                        }
                                }
                                .padding(.horizontal)
                                
                                
                                Group {

                                    HStack{
                                        Circle()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(daysPrice ? Color("White") : Color("FEBB12"))
                                            .shadow(radius: 1)
                                            
                                        
                                        Text("Thursday")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 40)
                                            .frame(width: 92, height: 30, alignment: .center)
                                            .foregroundColor(daysPrice ? Color("AAAAAA") : Color("White"))
                                            .shadow(radius: 1)
                                            .overlay(
                                                TextField("", text: $dayPrice)
                                                    .disabled(true)
                                                    .disabled(daysPrice ? true : false)
                                                    .keyboardType(.numberPad)
                                                    .padding(.leading)
                                            )
                                        
                                    }
                                    
                                    HStack{
                                        Circle()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(daysPrice ? Color("White") : Color("FEBB12"))
                                            .shadow(radius: 1)
                                           
                                        
                                        Text("Friday")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 40)
                                            .frame(width: 92, height: 30, alignment: .center)
                                            .foregroundColor(daysPrice ? Color("AAAAAA") : Color("White"))
                                            .shadow(radius: 1)
                                            .overlay(
                                                TextField("", text: $dayPrice)
                                                    .disabled(true)
                                                    .disabled(daysPrice ? true : false)
                                                    .keyboardType(.numberPad)
                                                    .padding(.leading)
                                            )
                                        
                                    }
                                    
                                    HStack{
                                        Circle()
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .foregroundColor(daysPrice ? Color("White") : Color("FEBB12"))
                                            .shadow(radius: 1)
                                           
                                        
                                        Text("Saturday")
                                            .foregroundColor(Color("000000").opacity(0.7))
                                            .font(Font.custom("poppins", size: 13))
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 40)
                                            .frame(width: 92, height: 30, alignment: .center)
                                            .foregroundColor(daysPrice ? Color("AAAAAA") : Color("White"))
                                            .shadow(radius: 1)
                                            .overlay(
                                                TextField("", text: $dayPrice)
                                                    .disabled(true)
                                                    .disabled(daysPrice ? true : false)
                                                    .keyboardType(.numberPad)
                                                    .padding(.leading)
                                            )
                                        
                                    }
                                    
                                    
                                }.padding(.horizontal)
                                
                                Divider()
                                    .padding(.vertical)

                            }
                            
                        }
                       
                        if AppUtil.selectedCategory != "Stadium" {
                            VStack{
                                Text("How long the service will be open for booking?")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 14))
                                    .fontWeight(.regular)
                                    .padding(.horizontal)
                                
                                VStack{
                                    RoundedRectangle(cornerRadius: 97)
                                        .frame(width: UIScreen.main.bounds.width - 50, height: 70, alignment: .center)
                                        .foregroundColor(Color("White"))
                                        .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 2)
                                        .overlay(
                                            ZStack{
                                                DatePicker("label", selection: $availableFrom, displayedComponents: [.date])
                                                               .datePickerStyle(CompactDatePickerStyle())
                                                               .environment(\.locale, .init(identifier:"en"))
                                                               .labelsHidden()
                                               
//                                                    HStack{
//                                                        Text(AppUtil.getDateInString(availableFrom))
//                                                            .font(Font.custom("poppins", size: 15))
//                                                            .foregroundColor(Color("000000").opacity(0.5))
//                                                            .fontWeight(.regular)
//
//                                                        Spacer()
//
//
//                                                    }.userInteractionDisabled()
//                                                    .padding(.horizontal,30)
                                                
                                            }
                                            
                                        )
                                    
                                    RoundedRectangle(cornerRadius: 97)
                                        .frame(width: UIScreen.main.bounds.width - 50, height: 70, alignment: .center)
                                        .foregroundColor(Color("White"))
                                        .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 2)
                                        .overlay(
                                            ZStack{
                                                DatePicker("label", selection: $availableTill, displayedComponents: [.date])
                                                               .datePickerStyle(CompactDatePickerStyle())
                                                               .environment(\.locale, .init(identifier:"en"))
                                                               .labelsHidden()
                                               
//                                                    HStack{
//                                                        Text(AppUtil.getDateInString(availableTill))
//                                                            .font(Font.custom("poppins", size: 15))
//                                                            .foregroundColor(Color("000000").opacity(0.5))
//                                                            .fontWeight(.regular)
//
//                                                        Spacer()
//
//
//                                                    }.userInteractionDisabled()
//                                                    .padding(.horizontal,30)
//                                                    .padding(.top)
                                                
                                            }
                                            
                                        )
                                }
                            }
                        }
                        else {
                            VStack{
                                
                                VStack{
                                    RoundedRectangle(cornerRadius: 97)
                                        .frame(width: UIScreen.main.bounds.width - 50, height: 70, alignment: .center)
                                        .foregroundColor(Color("White"))
                                        .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 2)
                                        .overlay(
                                            ZStack{
                                                DatePicker("label", selection: $setdate, displayedComponents: [.date])
                                                               .datePickerStyle(CompactDatePickerStyle())
                                                               .environment(\.locale, .init(identifier:"en"))
                                                               .labelsHidden()
                                               
//                                                    HStack{
//                                                        Text(AppUtil.getDateInString(setdate))
//                                                            .font(Font.custom("poppins", size: 15))
//                                                            .foregroundColor(Color("000000").opacity(0.5))
//                                                            .fontWeight(.regular)
//
//                                                        Spacer()
//
//
//                                                    }.userInteractionDisabled()
//                                                    .padding(.horizontal,30)
                                                
                                            }
                                            
                                        )
                                    
                                    RoundedRectangle(cornerRadius: 97)
                                        .frame(width: UIScreen.main.bounds.width - 50, height: 70, alignment: .center)
                                        .foregroundColor(Color("White"))
                                        .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 2)
                                        .overlay(
                                            ZStack{
                                                DatePicker("label", selection: $setTime, displayedComponents: [.date])
                                                               .datePickerStyle(CompactDatePickerStyle())
                                                               .environment(\.locale, .init(identifier:"en"))
                                                               .labelsHidden()
                                               
//                                                    HStack{
//                                                        Text(AppUtil.getDateInString(setTime))
//                                                            .font(Font.custom("poppins", size: 15))
//                                                            .foregroundColor(Color("000000").opacity(0.5))
//                                                            .fontWeight(.regular)
//
//                                                        Spacer()
//
//
//                                                    }.userInteractionDisabled()
//                                                    .padding(.horizontal,30)
//                                                    .padding(.top)
                                                
                                            }
                                            
                                        )
                                    
                                    ProfileTextfield(placeHolder: "Hour Price", textValue: $hourPrice,keyboardType: .numberPad)
                                }
                              
                            }
                        }
                      
                       
                        Divider()
                            .padding(.vertical)
                        
                        if AppUtil.selectedCategory != "Stadium" {
                            VStack{
                                Text("Select Check-in & Check-out times")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 14))
                                    .fontWeight(.regular)
                                    .padding(.horizontal)
                                
                                VStack{
                                    RoundedRectangle(cornerRadius: 97)
                                        .frame(width: UIScreen.main.bounds.width - 50, height: 70, alignment: .center)
                                        .foregroundColor(Color("White"))
                                        .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 2)
                                        .overlay(
                                            ZStack{
                                                DatePicker("label", selection: $checkInTime, displayedComponents: [.hourAndMinute])
                                                               .datePickerStyle(CompactDatePickerStyle())
                                                               .environment(\.locale, .init(identifier:"en"))
                                                               .labelsHidden()
    //                                                HStack{
    //                                                    Text(AppUtil.getTimeInString(checkInTime))
    //                                                        .font(Font.custom("poppins", size: 15))
    //                                                        .foregroundColor(Color("000000").opacity(0.5))
    //                                                        .fontWeight(.regular)
    //                                                    Spacer()
    //                                                }.userInteractionDisabled()
    //                                                .padding(.horizontal,30)
    //                                                .padding(.top)
                                            }
                                        )
                                    RoundedRectangle(cornerRadius: 97)
                                        .frame(width: UIScreen.main.bounds.width - 50, height: 70, alignment: .center)
                                        .foregroundColor(Color("White"))
                                        .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 2)
                                        .overlay(
                                            ZStack{
                                                DatePicker("label", selection: $checkOutTime, displayedComponents: [.hourAndMinute])
                                                               .datePickerStyle(CompactDatePickerStyle())
                                                               .environment(\.locale, .init(identifier:"en"))
                                                               .labelsHidden()
                                               
    //                                                HStack{
    //                                                    Text(AppUtil.getTimeInString(checkOutTime))
    //                                                        .font(Font.custom("poppins", size: 15))
    //                                                        .foregroundColor(Color("000000").opacity(0.5))
    //                                                        .fontWeight(.regular)
    //
    //                                                    Spacer()
    //
    //
    //                                                }.userInteractionDisabled()
    //                                                .padding(.horizontal,30)
    //                                                .padding(.top)
                                                
                                            }
                                            
                                        )
                                }
                            }
                            
                            Divider()
                                .padding(.vertical)
                        }
                        
                        
                      
                        
                        VStack{
                            Text("Open From & Open To")
                                .foregroundColor(Color("000000").opacity(0.7))
                                .font(Font.custom("poppins", size: 14))
                                .fontWeight(.regular)
                                .padding(.horizontal)
                            
                            VStack{
                                RoundedRectangle(cornerRadius: 97)
                                    .frame(width: UIScreen.main.bounds.width - 50, height: 70, alignment: .center)
                                    .foregroundColor(Color("White"))
                                    .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 2)
                                    .overlay(
                                        ZStack{
                                            DatePicker("label", selection: $openFrom)
                                                           .datePickerStyle(CompactDatePickerStyle())
                                                           .environment(\.locale, .init(identifier:"en"))
                                                           .labelsHidden()
                                           
//                                                HStack{
//                                                    Text(AppUtil.getTimeInString(checkInTime))
//                                                        .font(Font.custom("poppins", size: 15))
//                                                        .foregroundColor(Color("000000").opacity(0.5))
//                                                        .fontWeight(.regular)
//
//                                                    Spacer()
//
//
//                                                }.userInteractionDisabled()
//                                                .padding(.horizontal,30)
//                                                .padding(.top)
                                            
                                        }
                                        
                                    )
                                
                                RoundedRectangle(cornerRadius: 97)
                                    .frame(width: UIScreen.main.bounds.width - 50, height: 70, alignment: .center)
                                    .foregroundColor(Color("White"))
                                    .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 2)
                                    .overlay(
                                        ZStack{
                                            DatePicker("label", selection: $openTo)
                                                           .datePickerStyle(CompactDatePickerStyle())
                                                           .environment(\.locale, .init(identifier:"en"))
                                                           .labelsHidden()
                                           
//                                                HStack{
//                                                    Text(AppUtil.getTimeInString(checkOutTime))
//                                                        .font(Font.custom("poppins", size: 15))
//                                                        .foregroundColor(Color("000000").opacity(0.5))
//                                                        .fontWeight(.regular)
//
//                                                    Spacer()
//
//
//                                                }.userInteractionDisabled()
//                                                .padding(.horizontal,30)
//                                                .padding(.top)
                                            
                                        }
                                        
                                    )
                            }
                        }
                        
                        LoginButton(title: "Next", callback: {
                            let obj = Price()
                            let objCheckIn = Check()
                            
                            obj.openTo = AppUtil.getDateInString(openTo)
                            obj.openFrom =  AppUtil.getDateInString(openFrom)
                            
                            if AppUtil.selectedCategory == "Stadium" {
                                obj.setdate = AppUtil.getDateInString(setdate)
                                obj.setTime = AppUtil.getDateInString(setTime)
                                obj.hourPrice = Int(hourPrice)
                                
                                if hourPrice == "" {
                                    errorMessage = "Enter Price"
                                    togglepopup.toggle()
                                    return
                                }
                            }
                            else {
                                if daysPrice{
                                    if weekdaysCheck {
                                        obj.dayPrice = Int(Weekdays)
                                        obj.tuesdayPrice = Int(Weekdays)
                                        obj.mondayPrice = Int(Weekdays)
                                        obj.sundayPrice = Int(Weekdays)
                                        obj.wednesdayPrice = Int(Weekdays)
                                        obj.thrusdayPrice = Int(Thursday)
                                        obj.fridayPrice = Int(Friday)
                                        
                                    } else {
                                        
                                        obj.dayPrice = Int(Weekdays)
                                        obj.tuesdayPrice = Int(Weekdays)
                                        obj.mondayPrice = Int(Weekdays)
                                        obj.sundayPrice = Int(Weekdays)
                                        obj.wednesdayPrice = Int(Weekdays)
                                        obj.thrusdayPrice = Int(Thursday)
                                        obj.fridayPrice = Int(Friday)
                                    }

                                }else{
                                        obj.dayPrice = Int(dayPrice)
                                        obj.tuesdayPrice = Int(dayPrice)
                                        obj.mondayPrice = Int(dayPrice)
                                        obj.sundayPrice = Int(dayPrice)
                                        obj.wednesdayPrice = Int(dayPrice)
                                        obj.thrusdayPrice = Int(dayPrice)
                                        obj.fridayPrice = Int(dayPrice)
                                
                                }
                            }
                            
                            objCheckIn.checkInTime =  AppUtil.getAmPmTime(checkInTime) //AppUtil.getTimeInString(checkInTime)
                            objCheckIn.checkOutTime = AppUtil.getAmPmTime(checkOutTime) //AppUtil.getTimeInString(checkOutTime)
                            
                            AppUtil.addserviceObject?.price = obj
                            AppUtil.addserviceObject?.check = objCheckIn
                            
                            serviceManager.addService?.price = AppUtil.addserviceObject?.price
                            serviceManager.addService?.check =  AppUtil.addserviceObject?.check
                            let booking = BookingSetting()
                            AppUtil.addserviceObject?.bookingSetting = booking
                            viewRouter.currentPage = "BookingSettingsScreen"
                        })
                          .padding(.bottom,30)
                    }
                }
                //BottomNavigation()
                    
            }
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
            .keyboardAdaptive()
    }
}

struct PriceDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        PriceDetailScreen()
    }
}
