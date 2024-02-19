//
//  EditBookingInfoDetails.swift
//  SmartBookings
//
//  Created by Esfera-Macmini on 31/07/23.
//

import SwiftUI
import Combine
import UIKit

struct EditBookingInfoDetails: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager

    @State var section: String = AppUtil.validateVariable(AppUtil.editserviceObject?.roomsGuest?.section ?? 0)
    @State var doubleBed: String = AppUtil.validateVariable(AppUtil.editserviceObject?.roomsGuest?.doubleBed ?? 0)
    @State var singleBed: String = AppUtil.validateVariable(AppUtil.editserviceObject?.roomsGuest?.singleBed ?? 0)
    @State var bathrooms: String = AppUtil.validateVariable(AppUtil.editserviceObject?.roomsGuest?.bathrooms ?? 0)
    @State var maxGuest: String = AppUtil.validateVariable(AppUtil.editserviceObject?.roomsGuest?.maxGuest ?? 0)
    @State var numOfTents: String = AppUtil.validateVariable(AppUtil.editserviceObject?.unitsAndGuest?.numOfTents ?? 0)
    @State var numOfMajlesTents: String = AppUtil.validateVariable(AppUtil.editserviceObject?.unitsAndGuest?.numOfMajlesTents ?? 0)
    @State var numOfUnits: String = AppUtil.validateVariable(AppUtil.editserviceObject?.roomsGuest?.numberOfUnits ?? 0)
    @State var numOfChildrens: String = AppUtil.validateVariable(AppUtil.editserviceObject?.roomsGuest?.numberOfChild ?? 0)
  
    @State var bedrooms: String = AppUtil.validateVariable(AppUtil.editserviceObject?.roomsGuest?.bedrooms ?? 0)
    @State var stands: String = AppUtil.validateVariable(AppUtil.editserviceObject?.roomsGuest?.stands ?? 0)
    @State var dressingRooms: String = AppUtil.validateVariable(AppUtil.editserviceObject?.roomsGuest?.dressingRooms ?? 0)
    @State var maleRooms: String = AppUtil.validateVariable(AppUtil.editserviceObject?.roomsGuest?.maleRooms ?? 0)
    @State var femaleRooms: String = AppUtil.validateVariable(AppUtil.editserviceObject?.roomsGuest?.femaleRooms ?? 0)
    @State var maxSittingCapacity: String = AppUtil.validateVariable(AppUtil.editserviceObject?.roomsGuest?.maxSittingCapacity ?? 0)
    @State var totalEntities: String = AppUtil.validateVariable(AppUtil.editserviceObject?.totalEntities ?? 0)
    
    @State var livingRoom: Bool = AppUtil.editserviceObject?.unitsAndGuest?.livingRoom ?? false
    @State var indoorSeating: Bool = AppUtil.editserviceObject?.roomsGuest?.indoorSeating ?? false
    @State var outdoorSeating: Bool = AppUtil.editserviceObject?.roomsGuest?.outdoorSeating ?? false
    @State var additionalSeating: Bool = AppUtil.editserviceObject?.roomsGuest?.additionSeating ?? false
    @State var roomType: String = AppUtil.editserviceObject?.roomsGuest?.roomType ?? ""
    
//    MARK: - Hotel, camps
    
    @State var hotelroomType: String = AppUtil.editserviceObject?.unitsAndGuest?.roomType ?? ""
    @State var numRooms: String = AppUtil.validateVariable(AppUtil.editserviceObject?.unitsAndGuest?.numberAdults ?? 0)
    @State var numAdults: String = AppUtil.validateVariable(AppUtil.editserviceObject?.unitsAndGuest?.numberAdults ?? 0)
    @State var numberChildren: String = AppUtil.validateVariable(AppUtil.editserviceObject?.unitsAndGuest?.numberChildren ?? 0)
    @State var hotelsingleBed: String = AppUtil.validateVariable(AppUtil.editserviceObject?.unitsAndGuest?.singleBed ?? 0)
    @State var hoteldoubleBed: String = AppUtil.validateVariable(AppUtil.editserviceObject?.unitsAndGuest?.doubleBed ?? 0)
    @State var hotelmaxguest: String = AppUtil.validateVariable(AppUtil.editserviceObject?.unitsAndGuest?.maxGuest ?? 0)
    @State var hotelbathrooms: String = AppUtil.validateVariable(AppUtil.editserviceObject?.unitsAndGuest?.bathrooms ?? 0)
    @State var hotelsection: String = AppUtil.validateVariable(AppUtil.editserviceObject?.unitsAndGuest?.section ?? 0)
    
    @State var hotelindoorSeating: Bool = AppUtil.editserviceObject?.unitsAndGuest?.indoorSeating ?? false
    @State var hoteloutdoorSeating: Bool = AppUtil.editserviceObject?.unitsAndGuest?.outdoorSeating ?? false
    @State var hoteladditionalSeating: Bool = AppUtil.editserviceObject?.unitsAndGuest?.additionSeating ?? false
    
    



//    @State var numRooms: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.numberAdults ?? 0)
//    @State var numAdults: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.numberAdults ?? 0)
//    @State var numberOfChildren: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.numberChildren ?? 0)
//    @State var section: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.section ?? 0)
//    @State var doubleBed: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.doubleBed ?? 0)
//    @State var livingRoom: Bool = AppUtil.addserviceObject?.unitsAndGuest?.livingRoom ?? false
//    @State var singleBed: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.singleBeds ?? 0)
//    @State var bathrooms: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.bathrooms ?? 0)
//    @State var maxGuest: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.maxGuest ?? 0)
//    @State var numOfTents: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.numOfTents ?? 0)
//    @State var numOfMajlesTents: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.numOfMajlesTents ?? 0)
//    @State var numOfUnits: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.numberUnits ?? 0)
//    @State var numOfChildrens: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.numberChildren ?? 0)
//    @State var roomType: String = AppUtil.addserviceObject?.unitsAndGuest?.roomType ?? ""
//    @State var indoorSeating: Bool = AppUtil.addserviceObject?.unitsAndGuest?.indoorSeating ?? false
//    @State var outdoorSeating: Bool = AppUtil.addserviceObject?.unitsAndGuest?.outdoorSeating ?? false
//    @State var additionalSeating: Bool = AppUtil.addserviceObject?.unitsAndGuest?.additionSeating ?? false
//    @State var bedrooms: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.bedrooms ?? 0 )
//    @State var stands: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.stands ?? 0 )
//    @State var dressingRooms: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.dressingRoom ?? 0 )
//    @State var maleRooms: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.maleRooms ?? 0 )
//    @State var femaleRooms: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.femaleRooms ?? 0 )
//    @State var maxSittingCapacity: String = AppUtil.validateVariable(AppUtil.addserviceObject?.unitsAndGuest?.maxSittingCapacity ?? 0 )
//    @State var totalEntities: String = AppUtil.validateVariable(AppUtil.addserviceObject?.totalEntities ?? 0 )
    
    @State private var keyboardHeight: CGFloat = 0
    @State private var offsetValue: CGFloat = 0.0
    @State var togglepopup: Bool = false
    
    
    var body: some View {
        ZStack{
            VStack {
                TopNavigation(titleText:"Basic Information")
                VStack {
                    VStack {
                        HStack {
                            Text("Room & Guests")
                                .foregroundColor(Color("000000").opacity(0.8))
                                .font(Font.custom("poppins", size: 16))
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                            Spacer()
                        }.padding(.horizontal,30)
                        HStack {
                            Text("Please select the available rooms & guests")
                                .foregroundColor(Color("000000").opacity(0.6))
                                .font(Font.custom("poppins", size: 12))
                                .fontWeight(.regular)
                                .multilineTextAlignment(.center)
                            Spacer()
                        }.padding(.horizontal,30)
                    }
                    VStack {
                        ScrollView(showsIndicators: false){
                            VStack {

                                if AppUtil.selectedCategory == "Chalets" {
                                        ProfileTextfield(placeHolder: "Section", textValue: $section,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Bedrooms", textValue: $bedrooms,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Double Bed", textValue: $doubleBed,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Single Bed", textValue: $singleBed,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Max Guest", textValue: $maxGuest,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Bathrooms", textValue: $bathrooms,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        
                                        VStack{
                                            HStack{
                                                Toggle(isOn: $indoorSeating) {
                                                    Text("Indoor Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        } .padding(.top,5)
                                        
                                        VStack {
                                            HStack{
                                                Toggle(isOn: $outdoorSeating) {
                                                    Text("Outdoor Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        }.padding(.top,5)
                                        
                                        VStack{
                                            HStack{
                                                Toggle(isOn: $additionalSeating) {
                                                    Text("Additional Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        }.padding(.top,5)
                                    
                                }
                                
                                if AppUtil.selectedCategory == "Resorts" {
                                        ProfileTextfield(placeHolder: "Section", textValue: $section,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Max Guest", textValue: $maxGuest,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Bathrooms", textValue: $bathrooms,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Double Bed", textValue: $doubleBed,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Single Bed", textValue: $singleBed,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        
                                        VStack {
                                            HStack{
                                                Toggle(isOn: $indoorSeating) {
                                                    Text("Indoor Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        } .padding(.top,5)
                                        
                                        
                                        VStack {
                                            HStack {
                                                Toggle(isOn: $outdoorSeating) {
                                                    Text("Outdoor Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        }.padding(.top,5)
                                        
                                        VStack{
                                            HStack{
                                                Toggle(isOn: $additionalSeating) {
                                                    Text("Additional Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        }.padding(.top,5)
                                    
                                }
                                
                                if AppUtil.selectedCategory == "Stadium" {
                                        ProfileTextfield(placeHolder: "Dressing Rooms", textValue: $dressingRooms,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Stands", textValue: $stands,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Max Guest", textValue: $maxGuest,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Bathrooms", textValue: $bathrooms,keyboardType: .numberPad)
                                            .padding(.top,5)
                                }
                                
                                if AppUtil.selectedCategory == "Apartment" || AppUtil.selectedCategory == "Apartments"{
                                    
                                        ProfileTextfield(placeHolder: "Room Type", textValue: $roomType)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Number of Units", textValue: $numOfChildrens,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Number of Children", textValue: $numOfChildrens,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Number of Adults", textValue: $numAdults,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Single Bed", textValue: $singleBed,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Bathrooms", textValue: $bathrooms,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        
                                        VStack{
                                            HStack{
                                                Toggle(isOn: $livingRoom){
                                                    Text("Living Room")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        }
                                }
                                
                                
                                if AppUtil.selectedCategory == "Lounges"{
                                        ProfileTextfield(placeHolder: "Section", textValue: $section,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Max Guest", textValue: $maxGuest,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Bathrooms", textValue: $bathrooms,keyboardType: .numberPad)
                                        
                                        VStack{
                                            HStack{
                                                Toggle(isOn: $indoorSeating) {
                                                    Text("Indoor Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        }.padding(.top,5)
                                        
                                        VStack{
                                            HStack{
                                                Toggle(isOn: $outdoorSeating) {
                                                    Text("Outdoor Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        }.padding(.top,5)
                                        
                                        VStack {
                                            HStack{
                                                Toggle(isOn: $additionalSeating) {
                                                    Text("Additional Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        }.padding(.top,5)
                                }
                                
                                
                                if AppUtil.selectedCategory == "Camps" {
                                        ProfileTextfield(placeHolder: "Section", textValue: $hotelsection,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Number of Tents", textValue: $numOfTents,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Number of Majlis Tents", textValue: $numOfMajlesTents,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Double Bed", textValue: $hoteldoubleBed,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Single Bed", textValue: $hotelsingleBed,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Max Guest", textValue: $hotelmaxguest,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Bathrooms", textValue: $hotelbathrooms,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        
                                        VStack {
                                            HStack{
                                                Toggle(isOn: $hotelindoorSeating) {
                                                    Text("Indoor Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        } .padding(.top,5)
                                        
                                        VStack{
                                            HStack{
                                                Toggle(isOn: $hoteloutdoorSeating) {
                                                    Text("Outdoor Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        }.padding(.top,5)
                                    }
                                
                                
                                if AppUtil.selectedCategory == "Wedding_Halls" {
                                        ProfileTextfield(placeHolder: "Section", textValue: $section)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Male Rooms", textValue: $maleRooms,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Female Rooms", textValue: $femaleRooms,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Max Sitting Capacity", textValue: $maxSittingCapacity,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Max Guest", textValue: $maxGuest,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Bathrooms", textValue: $bathrooms,keyboardType: .numberPad)
                                    
                                }
                                
                                if AppUtil.selectedCategory == "Farms" {
                                        ProfileTextfield(placeHolder: "Section", textValue: $section,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Bedrooms", textValue: $bedrooms,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Double Bed", textValue: $doubleBed,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Single Bed", textValue: $singleBed,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Max Guest", textValue: $maxGuest,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Bathrooms", textValue: $bathrooms,keyboardType: .numberPad)
                                        
                                        VStack {
                                            HStack {
                                                Toggle(isOn: $indoorSeating) {
                                                    Text("Indoor Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        } .padding(.top,5)
                                        
                                        
                                        VStack{
                                            HStack{
                                                Toggle(isOn: $outdoorSeating) {
                                                    Text("Outdoor Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        }.padding(.top,5)
                                        
                                        VStack {
                                            HStack{
                                                Toggle(isOn: $additionalSeating) {
                                                    Text("Additional Seating")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        }.padding(.top,5)
                                    
                                }
                                
                                if AppUtil.selectedCategory == "Hotel" || AppUtil.selectedCategory == "Hotels" {
                                        ProfileTextfield(placeHolder: "Num of Rooms", textValue: $numRooms)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Room Type", textValue: $hotelroomType)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Number of Units", textValue: $numOfUnits,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Number of Children", textValue: $numberChildren,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Number of Adults", textValue: $numAdults,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Single Bed", textValue: $hotelsingleBed,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        ProfileTextfield(placeHolder: "Bathrooms", textValue: $hotelbathrooms,keyboardType: .numberPad)
                                            .padding(.top,5)
                                        
                                        VStack {
                                            HStack{
                                                Toggle(isOn: $livingRoom) {
                                                    Text("Living Room")
                                                        .foregroundColor(Color("000000").opacity(0.7))
                                                        .font(Font.custom("poppins", size: 15))
                                                        .fontWeight(.regular)
                                                        .multilineTextAlignment(.center)
                                                }
                                            }.padding(.horizontal)
                                        }
                                }
                                
                                    LoginButton(title: "Next", callback: {
                                        let unitsAndGuest = UnitsAndGuest()
                                        if AppUtil.selectedCategory == "Hotel" || AppUtil.selectedCategory == "Hotels" {

                                            unitsAndGuest.bathrooms = Int(hotelbathrooms)
                                            unitsAndGuest.singleBed = Int(hotelsingleBed)
                                            unitsAndGuest.numRooms = Int(numRooms)
                                            unitsAndGuest.roomType = hotelroomType
//                                          unitsAndGuest.numberUnits = Int(numOfUnits)
                                            unitsAndGuest.numberChildren = Int(numberChildren)
                                            unitsAndGuest.numberAdults = Int(numAdults)
                                            unitsAndGuest.livingRoom = livingRoom
//                                          unitsAndGuest.numberUnits != 0 &&

                                            if unitsAndGuest.bathrooms != 0 &&  unitsAndGuest.singleBed != 0 &&  unitsAndGuest.roomType != "" &&  unitsAndGuest.numberChildren != 0 && unitsAndGuest.numberAdults != 0 {
                                                AppUtil.addserviceObject?.unitsAndGuest = unitsAndGuest
                                                serviceManager.addService?.unitsAndGuest = unitsAndGuest
                                                viewRouter.currentPage = "EditAmenities"
                                            } else {
                                                togglepopup.toggle()
                                            }
                                            
                                            
                                        } else if AppUtil.selectedCategory == "Stadium" {
                                            unitsAndGuest.dressingRoom = Int(dressingRooms)
                                            unitsAndGuest.bathrooms = Int(bathrooms)
                                            unitsAndGuest.stands = Int(stands)
                                            unitsAndGuest.maxGuest = Int(maxGuest)
                                            
                                            if  unitsAndGuest.dressingRoom != 0 &&  unitsAndGuest.bathrooms != 0 &&  unitsAndGuest.stands != 0
                                                    &&  unitsAndGuest.maxGuest != 0 {
                                                AppUtil.addserviceObject?.unitsAndGuest = unitsAndGuest
                                                AppUtil.addserviceObject?.totalEntities = Int(totalEntities)
                                                serviceManager.addService?.totalEntities = Int(totalEntities)
                                                serviceManager.addService?.unitsAndGuest = unitsAndGuest
                                                viewRouter.currentPage = "EditAmenities"
                                            } else {
                                                togglepopup.toggle()
                                            }
                                            
                                        } else if AppUtil.selectedCategory == "Wedding_Halls" {
                                            unitsAndGuest.section = Int(section)
                                            unitsAndGuest.bathrooms = Int(bathrooms)
                                            unitsAndGuest.maleRooms = Int(maleRooms)
                                            unitsAndGuest.femaleRooms = Int(femaleRooms)
                                            unitsAndGuest.maxSittingCapacity = Int(maxSittingCapacity)
                                            unitsAndGuest.maxGuest = Int(maxGuest)
                                            //Ekta Ios

                                            if  section != "" && bathrooms != "" && maleRooms != "" && femaleRooms != "" && maxSittingCapacity != "" && maxGuest != ""  {
                                                AppUtil.addserviceObject?.unitsAndGuest = unitsAndGuest
                                                
                                                serviceManager.addService?.unitsAndGuest = unitsAndGuest
                                                AppUtil.addserviceObject?.totalEntities = Int(totalEntities)
                                                serviceManager.addService?.totalEntities = Int(totalEntities)
                                                
                                                viewRouter.currentPage = "EditAmenities"
                                            } else {
                                                togglepopup.toggle()
                                            }
                                        } else if AppUtil.selectedCategory == "Apartment"  || AppUtil.selectedCategory == "Apartments"{
                                            
                                            unitsAndGuest.bathrooms = Int(bathrooms)
                                            unitsAndGuest.singleBed = Int(singleBed)
                                            unitsAndGuest.roomType = roomType
                                            //  unitsAndGuest.numberUnits = Int(numOfUnits)
                                            unitsAndGuest.numberChildren = Int(numOfChildrens)
                                            unitsAndGuest.numberAdults = Int(numAdults)
                                            unitsAndGuest.livingRoom = livingRoom
                                            
                                            if bathrooms != "" &&  singleBed != "" && numAdults != ""  {
                                                AppUtil.addserviceObject?.unitsAndGuest = unitsAndGuest
                                                serviceManager.addService?.unitsAndGuest = unitsAndGuest
                                                viewRouter.currentPage = "EditAmenities"
                                            } else {
                                                togglepopup.toggle()
                                            }
                                            
                                        } else if AppUtil.selectedCategory == "Camps" {
                                            unitsAndGuest.section = Int(hotelsection)
                                            //   unitsAndGuest.numberUnits = Int(numOfUnits)
                                            unitsAndGuest.outdoorSeating = hoteloutdoorSeating
                                            unitsAndGuest.indoorSeating = hotelindoorSeating
                                            unitsAndGuest.numOfMajlesTents = Int(numOfMajlesTents)
                                            unitsAndGuest.maxGuest = Int(hotelmaxguest)
                                            unitsAndGuest.doubleBed = Int(hoteldoubleBed)
                                            unitsAndGuest.singleBed = Int(hotelsingleBed)
                                            unitsAndGuest.bathrooms = Int(hotelbathrooms)

                                            if hotelbathrooms != "" && hotelsingleBed != ""  && hotelsection != "" && hoteldoubleBed != "" && hotelmaxguest != "" {
                                                AppUtil.addserviceObject?.unitsAndGuest = unitsAndGuest
                                                serviceManager.addService?.unitsAndGuest = unitsAndGuest
                                                viewRouter.currentPage = "EditAmenities"
                                            } else {
                                                togglepopup.toggle()
                                            }
                                            
                                        } else if AppUtil.selectedCategory == "Chalets" {
                                            unitsAndGuest.section = Int(section)
                                            unitsAndGuest.bedrooms = Int(bedrooms)
                                            unitsAndGuest.doubleBed = Int(doubleBed)
                                            unitsAndGuest.singleBed = Int(singleBed)
                                            unitsAndGuest.outdoorSeating = indoorSeating
                                            unitsAndGuest.indoorSeating = outdoorSeating
                                            unitsAndGuest.additionSeating = additionalSeating
                                            unitsAndGuest.maxGuest = Int(maxGuest)
                                            unitsAndGuest.bathrooms = Int(bathrooms)

                                            if bathrooms != "" && singleBed != ""  && section != "" && doubleBed != "" && maxGuest != "" {
                                                AppUtil.addserviceObject?.unitsAndGuest = unitsAndGuest
                                                serviceManager.addService?.unitsAndGuest = unitsAndGuest
                                                viewRouter.currentPage = "EditAmenities"
                                            } else {
                                                togglepopup.toggle()
                                            }
                                            
                                        } else if AppUtil.selectedCategory == "Farms" {
                                            unitsAndGuest.section = Int(section)
                                            unitsAndGuest.bedrooms = Int(bedrooms)
                                            unitsAndGuest.doubleBed = Int(doubleBed)
                                            unitsAndGuest.singleBed = Int(singleBed)
                                            unitsAndGuest.outdoorSeating = outdoorSeating
                                            unitsAndGuest.indoorSeating = indoorSeating
                                            unitsAndGuest.additionSeating = additionalSeating
                                            unitsAndGuest.maxGuest = Int(maxGuest)
                                            unitsAndGuest.bathrooms = Int(bathrooms)

                                            if bathrooms != "" && singleBed != ""  && section != "" && doubleBed != "" && maxGuest != "" {
                                                AppUtil.addserviceObject?.unitsAndGuest = unitsAndGuest
                                                
                                                serviceManager.addService?.unitsAndGuest = unitsAndGuest
                                                
                                                viewRouter.currentPage = "EditAmenities"
                                            } else {
                                                togglepopup.toggle()
                                            }
                                        } else if AppUtil.selectedCategory == "Lounges" {
                                            unitsAndGuest.section = Int(section)
                                            unitsAndGuest.outdoorSeating = outdoorSeating
                                            unitsAndGuest.indoorSeating = indoorSeating
                                            unitsAndGuest.additionSeating = additionalSeating
                                            unitsAndGuest.maxGuest = Int(maxGuest)
                                            unitsAndGuest.bathrooms = Int(bathrooms)

                                            if section != "" && maxGuest != ""{
                                                AppUtil.addserviceObject?.unitsAndGuest = unitsAndGuest
                                                
                                                serviceManager.addService?.unitsAndGuest = unitsAndGuest
                                                
                                                viewRouter.currentPage = "EditAmenities"
                                            } else {
                                                togglepopup.toggle()
                                            }
                                            
                                        } else if AppUtil.selectedCategory == "Resorts" {
                                            unitsAndGuest.section = Int(section)
                                            unitsAndGuest.outdoorSeating = outdoorSeating
                                            unitsAndGuest.indoorSeating = indoorSeating
                                            unitsAndGuest.additionSeating = additionalSeating
                                            unitsAndGuest.maxGuest = Int(maxGuest)
                                            unitsAndGuest.bathrooms = Int(bathrooms)
                                            unitsAndGuest.doubleBed = Int(doubleBed)
                                            unitsAndGuest.singleBed = Int(singleBed)
                                            unitsAndGuest.bedrooms = Int(bedrooms)
                                            if section != "" && maxGuest != "" {
                                                AppUtil.addserviceObject?.unitsAndGuest = unitsAndGuest
                                                serviceManager.addService?.unitsAndGuest = unitsAndGuest
                                                viewRouter.currentPage = "EditAmenities"
                                            } else {
                                                togglepopup.toggle()
                                            }
                                        }
                                        
                                        else {
                                            unitsAndGuest.bathrooms = Int(bathrooms)
                                            unitsAndGuest.singleBed = Int(singleBed)
//                                          unitsAndGuest.numberUnits = Int(numOfUnits)
                                            unitsAndGuest.numberChildren = Int(numOfChildrens)
                                            unitsAndGuest.numRooms = Int(numRooms)
                                            unitsAndGuest.section = Int(section)
                                            unitsAndGuest.doubleBed = Int(doubleBed)
                                            unitsAndGuest.maxGuest = Int(maxGuest)
                                            unitsAndGuest.outdoorSeating = outdoorSeating
                                            unitsAndGuest.indoorSeating = indoorSeating
                                            unitsAndGuest.bedrooms = Int(bedrooms)
                                            unitsAndGuest.additionSeating = additionalSeating
                                            
                                            if bathrooms != "" && singleBed != ""   && numRooms != "" && section != "" && doubleBed != "" && maxGuest != "" && bedrooms != "" {
                                                
                                                AppUtil.addserviceObject?.unitsAndGuest = unitsAndGuest
                                                serviceManager.addService?.unitsAndGuest = unitsAndGuest
                                                viewRouter.currentPage = "EditAmenities"
                                                
                                            } else {
                                                togglepopup.toggle()
                                            }
                                        }
                                    })
                                    .padding(.bottom,30)
//                                }
                            }.padding()
                                .padding(.top,10)
                        }
                    }
                }.keyboardAdaptive()
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
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        .ignoresSafeArea(.all)
        .background(Color("F2F5F9"))
        .keyboardAdaptive()
        .onTapGesture{
            hideKeyboard()
        }
    }
}

struct EditBookingInfoDetails_Previews: PreviewProvider {
    static var previews: some View {
        EditBookingInfoDetails()
    }
}
