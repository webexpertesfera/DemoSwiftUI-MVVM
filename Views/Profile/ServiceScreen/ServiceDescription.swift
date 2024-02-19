//
//  ServiceDescription.swift
//  SmartBookings
//
//  Created by Sheheryar on 05/06/2022.
//

import SwiftUI
import Combine
import UIKit
struct ServiceDescription: View {
    @State private var keyboardHeight: CGFloat = 0
    @State private var offsetValue: CGFloat = 0.0
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @State var serviceNameEnglish: String = AppUtil.addserviceObject?.description?.nameInEnglish ?? ""
    @State var serviceNameArabic: String = AppUtil.addserviceObject?.description?.nameInArabic ?? ""
    @State var phonenumber: String = AppUtil.validateVariable(AppUtil.addserviceObject?.description?.secondryPhone ?? 0)
    @State var area: String = AppUtil.validateVariable(AppUtil.addserviceObject?.description?.areaSqm ?? 0)
   
    @State var descriptionEnglish: String = AppUtil.addserviceObject?.description?.descriptionInEnglish ?? ""
    @State var descriptionArabic: String = AppUtil.addserviceObject?.description?.descriptionInArabic ?? ""
    @State var pickerResult: [UIImage] = AppUtil.pickerResult
    
    @State var showImagePicker: Bool = false
    @State var togglepopup: Bool = false
    @State var imagecount: Bool = false

    
    @AppStorage("isOn") private var isOn : Bool = false //@AppStorage syncs this value with UserDefaults automatically
    @State private var showText = false

    
    var body: some View {
        ZStack {
           
               VStack{
                    TopNavigation(titleText:"Service Description")
                    VStack{
                        HStack{
                            Text("Service Description")
                                .foregroundColor(Color("000000").opacity(0.8))
                                .font(Font.custom("poppins", size: 16))
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                        }.padding(.horizontal,10)
                        HStack{
                            Text("Please select the safety types")
                                .foregroundColor(Color("000000").opacity(0.6))
                                .font(Font.custom("poppins", size: 12))
                                .fontWeight(.regular)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                        }.padding(.horizontal,10)
                            .padding(.top,5)
                    }
                    ScrollView( showsIndicators: false){
                        VStack{
                            Group {
                                ProfileTextfield(placeHolder: "Service Name (English)", textValue: $serviceNameEnglish, keyboardType: .default)
                                RoundedRectangle(cornerRadius: 97)
                                    .frame(width: UIScreen.main.bounds.width - 50, height: 70, alignment: .center)
                                    .foregroundColor(Color("White"))
                                    .shadow(color: Color("000000").opacity(0.2), radius: 2, x: 0, y: 2)
                                    .overlay(
                                        VStack{
                                            HStack{
                                                TextField("Service Name (Arabic)", text: $serviceNameArabic)
                                                    .font(Font.custom("poppins", size: 15))
                                                    .foregroundColor(Color("000000"))
                                                    .keyboardType(.default)
                                                    .environment(\.layoutDirection, .rightToLeft)
                                            }.padding(.horizontal,30)
                                        }
                                    )
                                ProfileTextfield(placeHolder: "Secondary Phone Number", textValue: $phonenumber, keyboardType: .phonePad)
                                ProfileTextfield(placeHolder: "Area in Square Meters", textValue: $area, keyboardType: .default)

                            } .padding(.top)
                            HStack{
                                Text("Description in English")
                                    .foregroundColor(Color("000000").opacity(0.6))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                                
                            }.padding(.horizontal,20)
                                .padding(.top,5)
                            
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: UIScreen.main.bounds.width - 50, height: 175, alignment: .center)
                                .foregroundColor(Color("White"))
                                .shadow(radius: 1)
                                .overlay(
                                    VStack{
                                        
                                        TextEditor(text: $descriptionEnglish)
                                            .lineSpacing(10)
                                            .keyboardType(.default)
                                           // .keyboardType(.asciiCapable)
                                            .autocapitalization(.words)
                                            .disableAutocorrection(true)
                                            .cornerRadius(30)
                                    }.padding(.horizontal)
                                        .padding(.top)
                                )
                            
                            HStack{
                                Text("Description in Arabic")
                                    .foregroundColor(Color("000000").opacity(0.6))
                                    .font(Font.custom("poppins", size: 12))
                                    .fontWeight(.regular)
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                            }.padding(.horizontal,20)
                                .padding(.top,5)
                            
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: UIScreen.main.bounds.width - 50, height: 175, alignment: .center)
                                .foregroundColor(Color("White"))
                                .shadow(radius: 1)
                                .overlay(
                                    VStack {
                                        TextEditor(text: $descriptionArabic)
                                            .lineSpacing(10)
                                           // .keyboardType(.asciiCapable)
                                            .autocapitalization(.words)
                                            .keyboardType(.default)
                                            .disableAutocorrection(true)
                                            .cornerRadius(30)
                                            .environment(\.layoutDirection, .rightToLeft)
                                    }.padding(.horizontal)
                                        .padding(.top)
                                )
                            
                            
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: UIScreen.main.bounds.width - 50, height: 150, alignment: .center)
                                .foregroundColor(Color("White"))
                                .shadow(color: Color("000000").opacity(0.2), radius: 1, x: 0, y: 2)
                                .overlay(
                                    VStack{
                                        Text("Add Service Images")
                                            .font(Font.custom("poppins", size: 15))
                                            .foregroundColor(Color("000000"))
                                            .fontWeight(.regular)
                                        
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(Color("FEBB12"))
                                            .frame(width: 120, height: 47, alignment: .center)
                                            .overlay(
                                                Text("Add Images")
                                                    .font(Font.custom("poppins", size: 14))
                                                    .foregroundColor(Color("04304B"))
                                                    .fontWeight(.medium)
                                                
                                            ).onTapGesture {
                                                showImagePicker.toggle()
                                            }
                                        //                                        if doIWantThisViewToShow{
                                        //                                            Text("View All")
                                        //                                                .font(Font.custom("poppins", size: 14))
                                        //                                                .foregroundColor(Color("04304B"))
                                        //                                                .fontWeight(.regular)
                                        //                                                .padding(.top, 10)
                                        //                                                .hidden()
                                        ////                                                .onTapGesture {
                                        ////                                                    viewRouter.currentPage = "ViewAllServiceimageVC"
                                        ////                                                }
                                        //                                        }
                                        
//                                        if showText { //only show the text if showText == true
                                        
                                        if pickerResult.count >= 5 {
                                            Text("view more")
                                            .onTapGesture {
                                              viewRouter.currentPage = "ViewAllServiceimageVC"
                                               AppUtil.pickerResult = pickerResult
                                           }
                                        }
                                    }
                                    
                                ).padding(.top)
                            
                            if pickerResult.count > 0 {
                                HStack{
                                    ScrollView(.horizontal) {
                                        HStack{
                                            ForEach(0 ..< pickerResult.count,id:\.self){ item in
                                                if item >= 5 {

                                                } else {
                                                    Image(uiImage: pickerResult[item])
                                                        .resizable()
                                                        .frame(width: 150, height: 150, alignment: .center)
                                                        .cornerRadius(10)
                                                    
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding(5)
                        
                        
                        LoginButton(title: "Next", callback: {
                            
                            AppUtil.pickerResult = pickerResult
                            AppUtil.addserviceObject?.description?.areaSqm = Int(area)
                            AppUtil.addserviceObject?.description?.nameInArabic = serviceNameArabic
                            AppUtil.addserviceObject?.description?.nameInEnglish = serviceNameEnglish
                            AppUtil.addserviceObject?.description?.secondryPhone = Int(phonenumber)
//                            AppUtil.addserviceObject?.description?.secondryPhone = phonenumber

                            AppUtil.addserviceObject?.description?.descriptionInEnglish = descriptionEnglish
                            AppUtil.addserviceObject?.description?.descriptionInArabic = descriptionArabic
                            
                            if serviceNameEnglish != "" && descriptionEnglish != "" && phonenumber != "" {
                                serviceManager.addService?.description = AppUtil.addserviceObject?.description
                                if pickerResult.count > 4 {
                                    AppUtil.pickerResult = pickerResult
                                    viewRouter.currentPage = "ServiceLocation"
                                } else {
                                   imagecount.toggle()
                                }
                            } else {
                                togglepopup.toggle()
                            }
                            
                        }).padding(.bottom,30)
                        
                    }
                    
                   // BottomNavigation()
                }
                .sheet(isPresented: $showImagePicker) {
                    PhotoPicker(images: $pickerResult, selectionLimit: 15)
                }
            
            if imagecount {
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
                                
                                .frame(width: 90, height: 90, alignment: .center)
                                .padding(.top)
                                
                                Text("Smartbooking")
                                    .foregroundColor(Color("000000"))
                                    .font(Font.custom("poppins", size: 20))
                                    .fontWeight(.bold)
                                
                                Text("Please select at list 5 images")
                                    .foregroundColor(Color("000000").opacity(0.7))
                                    .font(Font.custom("poppins", size: 15))
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
                                            imagecount.toggle()
                                        }
                                }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .padding(.vertical)
                                    
                                
                            }
                        )

                }
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
            .onTapGesture{
                hideKeyboard()
            }
        //            .onReceive(Publishers.keyboardHeight) {
        //                self.keyboardHeight = $0
        //
        //            }
    }
}

struct ServiceDescription_Previews: PreviewProvider {
    static var previews: some View {
        ServiceDescription()
    }
}

struct KeyboardAdaptive: ViewModifier {
    @State private var bottomPadding: CGFloat = 0
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.bottom, self.bottomPadding)
                .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    let keyboardTop = geometry.frame(in: .global).height - keyboardHeight
                    let focusedTextInputBottom = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
                    self.bottomPadding = max(0, focusedTextInputBottom - keyboardTop - geometry.safeAreaInsets.bottom)
                }
            
        }
    }
}

extension View {
    func keyboardAdaptive() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAdaptive())
    }
}



extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

extension UIResponder {
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }
    
    private static weak var _currentFirstResponder: UIResponder?
    
    @objc private func findFirstResponder(_ sender: Any) {
        UIResponder._currentFirstResponder = self
    }
    
    var globalFrame: CGRect? {
        guard let view = self as? UIView else { return nil }
        return view.superview?.convert(view.frame, to: nil)
    }
}
