//
//  EditCancellationPolicyScreen.swift
//  SmartBookings
//
//  Created by Esfera-Macmini on 31/07/23.
//

import SwiftUI

struct EditCancellationPolicyScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @State var cancellationPolicies: [String] = ["Flexible","Moderate","Strict","Non_refundable"]
    @State var checks:[Bool] = [false,false,false,false]
    @State var policyDetails: [String] = ["Flexible Cancellation Policy allows guests to cancel up to 24 hours prior to check-in date and receive a full refund.Sorry you voilate that rule.",
    "Moderate Cancellation polcy allows guests to cancel up to 3 days prior to check-in date and recieve fulll refund.","Strict cancellation policy allows guests to cancel up to 7 days prior to check-in date and receive a full refund",
    "Non refundable cancellation policy allows guests to cancel the reservation but booking fees are non-refundable"]
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText:"Booking Type")
                HStack{
                    Text("Cancellation Policy")
                        .foregroundColor(Color("000000").opacity(0.8))
                        .font(Font.custom("poppins", size: 16))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                HStack{
                    Text("Please select the cancellation policy")
                        .foregroundColor(Color("000000").opacity(0.6))
                        .font(Font.custom("poppins", size: 12))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding(.horizontal,10)
                    .padding(.top,5)
                VStack{
                    VStack{
                        ForEach(0 ..< cancellationPolicies.count,id:\.self) { item in
                            
                            CancelationCard(title: cancellationPolicies[item],detailText: policyDetails[item], check: $checks[item],callback: {
                                setCardCheck(index: item)
                                if cancellationPolicies[item] == "Flexible" {
                                    serviceManager.selectedCancellationType = ServicecanellationPolicy.Flexible.rawValue
                                }
                                if cancellationPolicies[item] == "Moderate" {
                                    serviceManager.selectedCancellationType = ServicecanellationPolicy.Moderate.rawValue
                                }
                                if cancellationPolicies[item] == "Strict" {
                                    serviceManager.selectedCancellationType = ServicecanellationPolicy.Strict.rawValue
                                }
                                if cancellationPolicies[item] == "Non_refundable" {
                                    serviceManager.selectedCancellationType = ServicecanellationPolicy.Non_refundable.rawValue
                                }
                               
                            })
                                .padding(5)
                        }
                    }
                    
                    Spacer()
                    
                    LoginButton(title: "Done", callback: {
                        viewRouter.goBack()
                    })
                        .padding(.bottom,30)
                }
                Spacer()
               // BottomNavigation()
            }
            
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .onAppear(perform: {
                if serviceManager.selectedCancellationType == ServicecanellationPolicy.Moderate.rawValue {
                    setCardCheck(index: 1)
                }
                if serviceManager.selectedCancellationType == ServicecanellationPolicy.Flexible.rawValue {
                    setCardCheck(index: 0)
                }
                if serviceManager.selectedCancellationType == ServicecanellationPolicy.Strict.rawValue {
                    setCardCheck(index: 2)
                }
                if serviceManager.selectedCancellationType == ServicecanellationPolicy.Non_refundable.rawValue {
                    setCardCheck(index: 3)
                }
            })
            
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

struct EditCancellationPolicyScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditCancellationPolicyScreen()
    }
}
