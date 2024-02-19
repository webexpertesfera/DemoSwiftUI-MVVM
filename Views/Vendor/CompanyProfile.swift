//
//  CompanyProfile.swift
//  SmartBookings
//
//  Created by Sheheryar on 09/06/2022.
//

import Combine
import MobileCoreServices
import SwiftUI
import UniformTypeIdentifiers

struct CompanyProfile: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var firstName: String = AppUtil.userProfile?.firstName ?? ""
    @State var lastName: String = AppUtil.userProfile?.lastName ?? ""
    @State var mobileNo: String = String(AppUtil.userProfile?.phone ?? 0)
    @State var email: String = AppUtil.userProfile?.email ?? ""
    @State var dob: String = ""
    @State var address: String = AppUtil.userProfile?.address ?? ""
    @State var nationality: String = AppUtil.userProfile?.nationality ?? ""
    @State var idNumber: String = AppUtil.userProfile?.commId ?? ""
    @State var ComIDNumber: String = ""
    @State var showPreloader: Bool = false

    @State var showImagePicker: Bool = false
    @State var pickerResult: [UIImage] = []
    
    @State var IDshowImagePicker: Bool = false
    @State var IDpickerResult: [UIImage] = []
    
    var body: some View {
        ZStack{
            VStack{
                TopNavigation(titleText: "Become Vendor")
                
                HStack{
                    Text("I Represent the")
                        .foregroundColor(Color("000000").opacity(0.9))
                        .font(Font.custom("poppins", size: 20))
                        .fontWeight(.semibold)
                    
                    Text("Company")
                        .foregroundColor(Color("FEBB12"))
                        .font(Font.custom("poppins", size: 20))
                        .fontWeight(.semibold)
                }.padding(.vertical)
                
                HStack{
                    Text("Please enter the details")
                        .foregroundColor(Color("FEBB12"))
                        .font(Font.custom("poppins", size: 18))
                        .fontWeight(.regular)
                    
                    Spacer()
                }.padding(.horizontal)
                ScrollView(showsIndicators:false){
                         Group{
                            VStack(alignment: .leading) {
                                Text("First Name")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))

                                ProfileTextfield(placeHolder: "First Name", textValue: $firstName)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Last Name")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                ProfileTextfield(placeHolder: "Last Name", textValue: $lastName)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Mobile Number")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                ProfileTextfield(placeHolder: "Mobile Number", textValue: $mobileNo,verified: true,keyboardType: .numberPad)
                            }
                                                       
                            VStack(alignment: .leading) {
                                Text("Email")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                ProfileTextfield(placeHolder: "Email", textValue: $email,verified: true,keyboardType: .emailAddress)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Address")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                ProfileTextfield(placeHolder: "Address", textValue: $address)
                            }
                              
                            VStack(alignment: .leading) {
                                Text("Nationality")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                ProfileTextfield(placeHolder: "Nationality", textValue: $nationality)
                            }

                            VStack(alignment: .leading) {
                                Text("Commercial ID No")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                ProfileTextfield(placeHolder: "Commercial ID No", textValue: $idNumber)
                             }
                        
                            VStack(alignment: .leading) {
                                Text("ID Number")
                                    .font(.headline)
                                    .font(Font.custom("poppins", size: 16))
                                    .foregroundColor(Color("000000").opacity(0.7))
                                ProfileTextfield(placeHolder: "ID Number", textValue: $ComIDNumber)
                             }
                        
                    }.padding(.vertical,5)
                                        
                    HStack{
                        Text("Upload Commercial ID")
                            .font(.headline)
                            .font(Font.custom("poppins", size: 16))
                            .foregroundColor(Color("000000").opacity(0.7))
                        
                        Spacer()
                    }.padding(.horizontal)
                    
                    HStack{
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 150, height: 50, alignment: .center)
                            .foregroundColor(Color("White"))
                            .shadow(radius: 1)
                            .overlay(
                                Text("Upload photo")
                                    .foregroundColor(Color("FEBB12"))
                                    .font(Font.custom("poppins", size: 16))
                                    .fontWeight(.regular)
                            ).onTapGesture {
                                showImagePicker.toggle()
                            }
                       }
                    
                    if pickerResult.count > 0 {
                        Image(uiImage: pickerResult[0])
                            .resizable()
                            .cornerRadius(20)
                            .scaledToFit()
                            .frame(width: 200, height: 170, alignment: .center)
                      }
                    
                    HStack{
                        Text("Upload ID Photo")
                            .font(.headline)
                            .font(Font.custom("poppins", size: 16))
                            .foregroundColor(Color("000000").opacity(0.7))
                        Spacer()
                    }.padding(.horizontal)
                    
                    HStack{
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 150, height: 50, alignment: .center)
                            .foregroundColor(Color("White"))
                            .shadow(radius: 1)
                            .overlay(
                                Text("Upload photo")
                                    .foregroundColor(Color("FEBB12"))
                                    .font(Font.custom("poppins", size: 16))
                                    .fontWeight(.regular)
                            ).onTapGesture {
                                IDshowImagePicker.toggle()
                            }
                      }
                    
                    
                    if IDpickerResult.count > 0 {
                        Image(uiImage: IDpickerResult[0])
                            .resizable()
                            .cornerRadius(20)
                            .scaledToFit()
                            .frame(width: 200, height: 170, alignment: .center)
                       
                    }

                    LoginButton(title: "Done", callback: {
                        showPreloader = true
                        AppUtil.userProfile?.firstName = firstName
                        AppUtil.userProfile?.lastName = lastName
                        AppUtil.userProfile?.phone = Int(mobileNo)
                        AppUtil.userProfile?.nationality = nationality
                        AppUtil.userProfile?.email = email
                        AppUtil.userProfile?.address = address
                        AppUtil.userProfile?.commId = idNumber
                        AppUtil.userProfile?.nationality = nationality
                        
                        let requestObject = CompanyRequest()
                        requestObject.firstName = firstName
                        requestObject.lastName = lastName
                        requestObject.phone = mobileNo
                        requestObject.email = email
                        requestObject.address = address
                        requestObject.commId = idNumber
                        requestObject.idNumber = idNumber
                        requestObject.nationality = nationality
                        
                        
                        if pickerResult.count > 0 {
                            print("sbfhsdfbdsf", pickerResult.count)
                                UserApiUtil.uploadImageForService(paramName: "images", fileName: "hotel1", image: pickerResult,success: { res in
                                print("dfijsndfsdf", res)
                                let image = res[0]
                                requestObject.file = image
                                print("Image service", image)
                                VendorApiUtil.becomeCompany(body: requestObject, success: { _ in
                                    viewRouter.currentPage = "RequestSubmitScreen"
                                }, failure: { _ in
                                    showPreloader = false
                                    print("sdfbfbdsfbduffds")
                                })
                            }, failure: { _ in
                                showPreloader = false
                                print("skjbfhsbfsdh*****")
                            })
                        }else {
                            showPreloader = true
                            VendorApiUtil.becomeCompany(body: requestObject, success: { _ in
                                viewRouter.currentPage = "RequestSubmitScreen"
                            }, failure: { _ in
                                showPreloader = false
                                print("/**********sdfdfsdfsd*****")
                            })
                        }
                        
                        if IDpickerResult.count > 0 {
                            print("sbfhsdfbdsf", IDpickerResult.count)
                            UserApiUtil.uploadImageForService(paramName: "images", fileName: "hotel1", image: IDpickerResult,success: { res in
                                print("dfijsndfsdf", res)
                                let image = res[0]
                                requestObject.uploadIdPhoto = image
                                print("Image service", image)
                                VendorApiUtil.becomeCompany(body: requestObject, success: { _ in
                                    viewRouter.currentPage = "RequestSubmitScreen"
                                }, failure: { _ in
                                    showPreloader = false
                                    print("sdfbfbdsfbduffds")
                                })
                            }, failure: { _ in
                                showPreloader = false
                                print("skjbfhsbfsdh*****")
                            })
                        }else {
                            showPreloader = true
                            VendorApiUtil.becomeCompany(body: requestObject, success: { _ in
                                viewRouter.currentPage = "RequestSubmitScreen"
                            }, failure: { _ in
                                showPreloader = false
                                print("/**********sdfdfsdfsd*****")
                            })
                        }

                    }).padding(.vertical)
                }
            }
            .sheet(isPresented: $showImagePicker) {
                PhotoPicker(images: $pickerResult, selectionLimit: 1)
            }
            
            .sheet(isPresented: $IDshowImagePicker) {
                PhotoPicker(images: $IDpickerResult, selectionLimit: 1)
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
            .keyboardAdaptive()
    }
}

struct CompanyProfile_Previews: PreviewProvider {
    static var previews: some View {
        CompanyProfile()
    }
}

struct DocumentPicker: UIViewControllerRepresentable {
    @Binding var documentUrl: String
    func makeCoordinator() -> Coordinator {
        return DocumentPicker.Coordinator(parent1: self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(documentTypes: [kUTTypePDF as String], in: .import)
        picker.allowsMultipleSelection = false
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_: UIDocumentPickerViewController, context _: UIViewControllerRepresentableContext<DocumentPicker>) {}

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: DocumentPicker

        init(parent1: DocumentPicker) {
            parent = parent1
        }

        func documentPicker(_: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            if !urls.isEmpty {
                do {
                
                
                    let documentData = try Data(contentsOf: urls.first!)
                    AppUtil.documentsData = documentData
                    self.parent.documentUrl = urls.first!.lastPathComponent
//                    NewAPIUtil.uploadDocument(file: documentData, mimeType: AppUtil.getMimeType(for: documentData), documentExtension: urls.first!.pathExtension, success: { result in
//                        print("\(result)")
//                        print("\(result.data)")
//                        self.parent.documentUrl = result.data
//                    }, failure: { f in
//                        print(f)
//                    })
                } catch {
                    print(error)
                }
            }
        }
    }
}
