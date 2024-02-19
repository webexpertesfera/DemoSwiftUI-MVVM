//
//  EditRulesScreen.swift
//  SmartBookings
//
//  Created by Esfera-Macmini on 31/07/23.
//

import SwiftUI

struct EditRulesScreen: View {
    @State var popuptoggle: Bool = false
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @State var eventPartiesAllowed: Bool = AppUtil.editserviceObject?.description?.rules?.eventPartiesAllowed ?? false
    @State var PetsAllowed: Bool = AppUtil.editserviceObject?.description?.rules?.petsAllowed ?? false
    @State var SmokingAllowed: Bool = AppUtil.editserviceObject?.description?.rules?.smokingAllowed ?? false
    @State var SuitableforChildrens: Bool = false
    @State var Suitableforgrooms: Bool = AppUtil.editserviceObject?.description?.rules?.suitableForGrooms ?? false
    @State var SuitablforInfants: Bool = false
    @State var addRules: String = ""
    @State var additionalRules: [String] = []
    
    init() {
        UITextView.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Service Description")
                VStack{
                    HStack{
                        Text("Rules")
                            .foregroundColor(Color("000000").opacity(0.8))
                            .font(Font.custom("poppins", size: 16))
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }.padding(.horizontal,30)
                    HStack {
                        Text("Please set the house rules for your service")
                            .foregroundColor(Color("000000").opacity(0.6))
                            .font(Font.custom("poppins", size: 12))
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }.padding(.horizontal,30)
                }
                ScrollView(showsIndicators:false){
                    
                    VStack {
                        if AppUtil.selectedCategory == "Hotel" ||  AppUtil.selectedCategory == "Hotels" {
                            
                            RuleCard(title: "Smoking Allowed",toggle: $SmokingAllowed)
                            
                        } else {
                            
                            RuleCard(title: "Events & Parties allowed",toggle: $eventPartiesAllowed)
                            RuleCard(title: "Pets Allowed",toggle: $PetsAllowed)
                           
                            RuleCard(title: "Suitable for Childrens (2-14)",toggle: $SuitableforChildrens)
                            RuleCard(title: "Suitable for grooms",toggle: $Suitableforgrooms)
                            RuleCard(title: "Suitable for Infants (Under 2)",toggle: $SuitablforInfants)
                        }
                        
                        if additionalRules.count > 0 {
                            ForEach( 0 ..< additionalRules.count,id:\.self) { ind  in
                                RuleCard(title: additionalRules[ind] ,toggle: .constant(true))
                            }
                        }
                    }
                    
                    HStack {
                        Text("+ Add Additional Rules")
                            .foregroundColor(Color("FEBB12"))
                            .font(Font.custom("poppins", size: 16))
                            .fontWeight(.semibold)
                            .onTapGesture {
                                popuptoggle.toggle()
                            }
                        Spacer()
                    }.padding(.horizontal,20)
                        .padding(.vertical)
                    
                    LoginButton(title: "Next", callback: {
                        
                        if AppUtil.selectedCategory == "Hotel" {
                            AppUtil.editserviceObject?.description?.rules?.smokingAllowed = SmokingAllowed
                            AppUtil.editserviceObject?.description?.rules?.additionalRules = additionalRules
                          
                        } else {
                            AppUtil.editserviceObject?.description?.rules?.smokingAllowed = SmokingAllowed
                            AppUtil.editserviceObject?.description?.rules?.eventPartiesAllowed = eventPartiesAllowed
                            
                            AppUtil.editserviceObject?.description?.rules?.petsAllowed = PetsAllowed
                            AppUtil.editserviceObject?.description?.rules?.suitableForChildrens = 2
                            AppUtil.editserviceObject?.description?.rules?.suitableForGrooms = Suitableforgrooms
                            AppUtil.editserviceObject?.description?.rules?.suitableForInfants = 2
                            
                            if AppUtil.selectedCategory != "Lounges"
                            {
                                AppUtil.editserviceObject?.description?.rules?.additionalRules = additionalRules
                            }
                        }
                        
                        
                        AppUtil.editserviceObject?.description?.rules = AppUtil.editserviceObject?.description?.rules
                       
                        AppUtil.editserviceObject?.description =  AppUtil.editserviceObject?.description
                        serviceManager.editserviceObject?.description = AppUtil.editserviceObject?.description
                        viewRouter.currentPage = "EditSafetyScreen"
                    })
                            .padding(.bottom,30)
                    }
                Spacer()
               // BottomNavigation()
            }
            if popuptoggle {
                ZStack{
                    VStack {}
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("000000"))
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.6)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: UIScreen.main.bounds.width - 20, height: 450, alignment: .center)
                        .foregroundColor(Color("F2F5F9"))
                        .shadow(color: Color("000000"), radius: 2, x: 0, y: 1)
                        .overlay(
                            VStack{
                                HStack{
                                    Spacer()
                                    Image("CrossIcon")
                                        .resizable()
                                        .frame(width: 26, height: 26, alignment: .center)
                                        .onTapGesture{
                                            popuptoggle = false
                                        }
                                }.padding(.horizontal)
                                    .padding(.top)
                                Text("Add Additional Rule")
                                    .foregroundColor(Color("000000").opacity(0.8))
                                    .font(Font.custom("poppins", size: 18))
                                    .fontWeight(.bold)
                                
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: UIScreen.main.bounds.width - 50, height: 175, alignment: .center)
                                    .foregroundColor(Color("White"))
                                    .shadow(radius: 1)
                                    .overlay(
                                        VStack{
                                            
                                            TextEditor(text: $addRules)
                                                .lineSpacing(10)
                                                .keyboardType(.asciiCapable)
                                                .autocapitalization(.words)
                                                .disableAutocorrection(true)
                                                .cornerRadius(30)
                                        }.padding(.horizontal)
                                            .padding(.top)
                                    )
                                

                                RoundedRectangle(cornerRadius: 100)
                                    .frame(width: 200, height: 70, alignment: .center)
                                    .foregroundColor(Color("FEBB12"))
                                    .overlay(
                                      Text("Done")
                                        .foregroundColor(Color("04304B"))
                                        .font(Font.custom("poppins", size: 20))
                                        .fontWeight(.regular)
                                    ).onTapGesture {
                                        additionalRules.append(addRules)
                                        popuptoggle.toggle()
                                    }.padding(.vertical,5)
                                    
                                
                                Spacer()
                                
                            }
                        )
                }
            }
           
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
    }
}

struct EditRulesScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditRulesScreen()
    }
}
