//
//  Dashboard.swift
//  SmartBookings
//
//  Created by Sheheryar on 19/05/2022.
//

import SwiftUI
import SocketIO

struct Dashboard: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var serviceManager: ServiceManager
    @ObservedObject var locationSearchService = LocationSearchService()

    @State private var pagecontrolTracker: Int = 0
    @State var textColor: String = "000000"
    @State var showPreloader: Bool = false
    @State var selectedDate = Date()

    @State var MainBannerIndex = Int()
    @State var BannersIndex = Int()
    @State var MainBannersCount = Int()
    
    
    
    
    @State var activeImageIndex = Int()
    let imageSwitchTimer = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()
    
    @State var camps : [Camp] = []
    var buttonbg: String = "FEBB12"
    var Categories: [String] = ["Group 7084","Group 7099","Group 7133","Group 7134","Group 7445","Group 7451","Group 7990","Group 7992","Group 8082"]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
//                    Image("Group 2")
                  Image("Group 8234")
                        .scaledToFit()
                    Spacer()
                    Image("Group 6806")
                        .scaledToFit()
                        .overlay(
                            
                            NotificationCountView(
                                value: .constant(AppUtil.appSettings.notificationCount ?? 0),
                                foreground: .white,
                                background: .red
                            )
                        )
                        .padding(.top)
                        .onTapGesture {
                          viewRouter.currentPage = "NotificationScreen"
                        }
                    
                }.padding(.horizontal,15)
                    .padding(.vertical,20)
                
                ScrollView(showsIndicators: false) {
                    VStack{
                        HStack{
                            Text("Find the")
                                .font(Font.custom("poppins", size: 23))
                                .foregroundColor(Color(textColor))
                                .bold()
                            Spacer()
                        }
                        HStack{
                            Text("Best option for you")
                                .font(Font.custom("poppins", size: 23))
                                .foregroundColor(Color(textColor))
                                .bold()
                            Spacer()
                        }
                    }.frame(width: UIScreen.main.bounds.width - 30)
                        .padding(.vertical,5)
                    
                    if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                        if language == "ar" {
                            SearchBar(searchQuery: .constant(""),caption: "بحث")
                                .onTapGesture {
                                    viewRouter.currentPage = "SearchArea"
                                }
                        } else {
                            SearchBar(searchQuery: .constant(""),caption: "Search Hotel, Resorts Farms")
                                .onTapGesture {
                                    viewRouter.currentPage = "SearchArea"
                                }
                            
                        }
                    } else {
                        SearchBar(searchQuery: .constant(""),caption: "Search Hotel, Resorts Farms")
                            .onTapGesture {
                                viewRouter.currentPage = "SearchArea"
                            }
                    }

                    ScrollViewReader { scrollProxy in
                        HStack(spacing: 5){
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack{
                                    ForEach(0 ..< (serviceManager.categorieslistt?.mainBanner?.count ?? 0),id:\.self) { item in
                                        mainbanners(imageBanner: serviceManager.categorieslistt?.mainBanner?[item].mobileImage ?? "")
                                            .padding(.horizontal)
                                            .task {
                                                self.MainBannerIndex = item
                                            }
                                    }.onTapGesture {
                                        let twUrl = URL(string: serviceManager.categorieslistt?.mainBanner?[self.MainBannerIndex].link ?? "")!
                                        let twUrlWeb = URL(string: serviceManager.categorieslistt?.mainBanner?[self.MainBannerIndex].link ?? "")!
                                        if UIApplication.shared.canOpenURL(twUrl){
                                           UIApplication.shared.open(twUrl, options: [:],completionHandler: nil)
                                        }else{
                                           UIApplication.shared.open(twUrlWeb, options: [:], completionHandler: nil)
                                        }
                                      }
                                }
                            }
                            
                        }.onReceive(imageSwitchTimer) { _ in
                            self.activeImageIndex = (self.activeImageIndex + 1)%4
                          //  self.activeImageIndex = (self.activeImageIndex + 1)%self.MainBannersCount
                            withAnimation {
                                scrollProxy.scrollTo(self.activeImageIndex) // scroll to next .id
                            }
                        }
                    }

                    HStack(spacing: 5){
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                            ForEach(0 ..< (serviceManager.categorieslistt?.banner?.count ?? 0),id:\.self) { item in
                                    banners(imageBanner: serviceManager.categorieslistt?.banner?[item].mobileImage ?? "")
                                        .padding(.horizontal)
                                        .task {
                                            self.BannersIndex = item
                                        }
                                }.onTapGesture {
                                    let twUrl = URL(string: serviceManager.categorieslistt?.banner?[self.BannersIndex].link ?? "")!
                                    let twUrlWeb = URL(string: serviceManager.categorieslistt?.banner?[self.BannersIndex].link ?? "")!
                                    if UIApplication.shared.canOpenURL(twUrl){
                                       UIApplication.shared.open(twUrl, options: [:],completionHandler: nil)
                                    }else{
                                       UIApplication.shared.open(twUrlWeb, options: [:], completionHandler: nil)
                                    }
                                }
                            }
                        }.padding()
                    }
                    
                    VStack{
                        HStack{
                            Text("Choose Category")
                                .font(Font.custom("poppins", size: 15))
                                .foregroundColor(Color(textColor).opacity(0.8))
                                .fontWeight(.regular)
                                .padding(.leading)
                            Spacer()
                        }
                        
                        if serviceManager.categorieslistt?.categories?.count ?? 0 > 0 {
                            LazyVGrid(columns: columns, spacing: 20) {

                                if let language = UserDefaults.standard.value(forKey: Keys.language) as? String {
                                    if language == "ar"{
                                        ForEach(0 ..< (AppUtil.categorieslistt?.categories?.count ?? 0), id: \.self) { item in
                                            DashboardCards(title: AppUtil.categorieslistt?.categories?[item].category_name_ar ?? "",
                                                           imageName: AppUtil.categorieslistt?.categories?[item].image ?? "")
                                            .onTapGesture {
                                                serviceManager.selectedCategoryId =  AppUtil.categorieslistt?.categories?[item]._id ?? ""
                                                serviceManager.selectedIndex = item + 1
                                                serviceManager.selectedType = AppUtil.categorieslistt?.categories?[item].type ?? ""
                                                viewRouter.currentPage = "SearchArea"
                                            }
                                        }
                                    }else{
                                        ForEach(0 ..< (AppUtil.categorieslistt?.categories?.count ?? 0), id: \.self) { item in
                                            DashboardCards(title: AppUtil.categorieslistt?.categories?[item].category ?? "",
                                                           imageName: AppUtil.categorieslistt?.categories?[item].image ?? "")
                                            .onTapGesture {
                                                serviceManager.selectedCategoryId =  AppUtil.categorieslistt?.categories?[item]._id ?? ""
                                                serviceManager.selectedIndex = item + 1
                                                serviceManager.selectedType =  AppUtil.categorieslistt?.categories?[item].type ?? ""
                                                viewRouter.currentPage = "SearchArea"
                                            }
                                        }
                                    }

                                } else {
                                    ForEach(0 ..< (AppUtil.categorieslistt?.categories?.count ?? 0), id: \.self) { item in
                                        DashboardCards(title: AppUtil.categorieslistt?.categories?[item].category ?? "",
                                                       imageName: AppUtil.categorieslistt?.categories?[item].image ?? "")
                                        .onTapGesture {
                                            serviceManager.selectedCategoryId =  AppUtil.categorieslistt?.categories?[item]._id ?? ""
                                            serviceManager.selectedIndex = item + 1
                                            serviceManager.selectedType =  AppUtil.categorieslistt?.categories?[item].type ?? ""
                                            viewRouter.currentPage = "SearchArea"
                                        }
                                    }
                                }
                            }
                        }
                        
                    }.frame(width: UIScreen.main.bounds.width - 20)
                    if camps.count > 0 {
                        VStack{
                            HStack{
                                Text("Recommended For you")
                                    .font(Font.custom("poppins", size: 13))
                                    .foregroundColor(Color(textColor).opacity(0.8))
                                    .fontWeight(.regular)
                                    .padding(.leading)
                                Spacer()
                            }.padding(.leading)
                                .offset(y:20)
                            
                            ScrollView(.horizontal) {
                                HStack{
                                    
                                    ForEach(0 ..< camps.count,id:\.self) { _ in
                                        RecomHotelsCards()
                                    }
                                }.padding()
                            }.padding(.trailing,20)
                        }
                    }
                    
                }.padding(.top)
                
                BottomNavigation()
            }
            
            if showPreloader {
                VStack {}
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("FFFFFF"))
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.6)
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("FEBB12")))
                    .scaleEffect(x: 4, y: 4, anchor: .center)
            }
            
        } .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea(.all)
            .background(Color("F2F5F9"))
            .task {
                UserApiUtil.getSettings(success: { res in
                    AppUtil.appSettings = res
                    print("dsghydshfsdfsd", AppUtil.appSettings)
                }, failure: { _ in
                    
                })
                
                    UserApiUtil.getCategories(success: { result in
                        showPreloader = false
                        AppUtil.categorieslistt = result
                        DispatchQueue.main.async {
                            serviceManager.categorieslistt = result
                            self.MainBannersCount = result.mainBanner?.count ?? 0
                            print("self.MainBannersCount",self.MainBannersCount)
                        }

                    }, failure: { _ in
                        showPreloader = false
                    })
                print("fdsfdsfdsfdsfdffs")
            }


            .onAppear(perform: {
                
                if AppUtil.userProfile != nil {
                    showPreloader = true
                    let defaults = UserDefaults.standard
                    defaults.set(AppUtil.userProfile?._id, forKey: Keys.userID)
//                    print("User profile id", AppUtil.userProfile?._id )
                    if let token = defaults.value(forKey: Keys.userID) as? String {
                        print("userID token : \(token)")
                    }
                    
                    if AppUtil.categorieslistt == nil {
                        UserApiUtil.getCategories(success: { result in
                            showPreloader = false
                            AppUtil.categorieslistt = result
                            DispatchQueue.main.async {
                                serviceManager.categorieslistt = result
                                self.MainBannersCount = result.mainBanner?.count ?? 0
                                print("self.MainBannersCount",self.MainBannersCount)
                            }
                            
                        }, failure: { _ in
                            showPreloader = false
                        })
                    } else {
                        DispatchQueue.main.async {
                            serviceManager.categorieslistt = AppUtil.categorieslistt
                            self.MainBannersCount = serviceManager.categorieslistt?.mainBanner?.count ?? 0
                            print("self.MainBannersCount",self.MainBannersCount)
                            showPreloader = false
                        }
                    }
                    
                    UserApiUtil.getRecommended(success: { res in
                        camps = res
                    }, failure: { _ in
                        
                    })
                    
                    SocketHelper.shared.connectSocket {
                        (success) in
                        
                        print("success")
                    }
                    
                } else {
                    showPreloader = true
                    UserApiUtil.getProfile(success: { res in
                        AppUtil.userProfile = res
                        let defaults = UserDefaults.standard
                        defaults.set(AppUtil.userProfile?._id, forKey: Keys.userID)
                        if let token = defaults.value(forKey: Keys.userID) as? String {
                            print("userID: \(token)")
                        }
                        
                        if AppUtil.categorieslistt == nil   {
                            UserApiUtil.getCategories(success: { result in
                                showPreloader = false
                                AppUtil.categorieslistt = result
                                DispatchQueue.main.async {
                                    serviceManager.categorieslistt = result
                                    self.MainBannersCount = result.mainBanner?.count ?? 0
                                    print("self.MainBannersCount",self.MainBannersCount)
                                    SocketHelper.shared.connectSocket {
                                        (success) in
                                        print("success socket ")
                                    }
                                }
                            }, failure: { _ in
                                showPreloader = false
                            })
                        } else {
                            DispatchQueue.main.async {
                                serviceManager.categorieslistt = AppUtil.categorieslistt
                                self.MainBannersCount = serviceManager.categorieslistt?.mainBanner?.count ?? 0
                                print("self.MainBannersCount",self.MainBannersCount)
                                showPreloader = false
                            }
                        }
                        
                        UserApiUtil.getRecommended(success: { res in
                            camps = res
                        }, failure: { _ in
                            
                        })
                        
                    }, failure: { _ in
                        showPreloader = false
                    })
                }
                
            })
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}



struct NotificationCountView : View {
  
  @Binding var value: Int
  @State var foreground: Color = .white
  @State var background: Color = .red
  
  private let size = 25.0
  private let x = 25.0
  private let y = 0.0
  
  var body: some View {
    ZStack {
      Capsule()
        .fill(background)
        .frame(width: size * widthMultplier(), height: size, alignment: .topTrailing)
        .position(x: x, y: y)
      
      if hasTwoOrLessDigits() {
              Text("\(value)")
                .foregroundColor(foreground)
                .font(Font.caption)
                .position(x: x, y: y)
                .font(Font.custom("poppins", size: 18))
                .environment(\.locale, .init(identifier:"en"))
          
      } else {
        Text("99+")
          .foregroundColor(foreground)
          .font(Font.caption)
          .frame(width: size * widthMultplier(), height: size, alignment: .center)
          .position(x: x, y: y)
          .font(Font.custom("poppins", size: 18))
          .environment(\.locale, .init(identifier:"en"))
      }
    }
    .opacity(value == 0 ? 0 : 1)
  }
  
  // showing more than 99 might take too much space, rather display something like 99+
  func hasTwoOrLessDigits() -> Bool {
    return value < 100
  }
  
  func widthMultplier() -> Double {
    if value < 10 {
      // one digit
      return 1.0
    } else if value < 100 {
      // two digits
      return 1.5
    } else {
      // too many digits, showing 99+
      return 2.0
    }
  }
}




//struct Dashboard: View {
//
//    @EnvironmentObject var viewRouter: ViewRouter
//    @EnvironmentObject var serviceManager: ServiceManager
//    @ObservedObject var locationSearchService = LocationSearchService()
//    @State var textColor: String = "000000"
//    @State var showPreloader: Bool = false
//    @State var camps : [Camp] = []
//    var buttonbg: String = "FEBB12"
//    var Categories: [String] = ["Group 7084","Group 7099","Group 7133","Group 7134","Group 7445","Group 7451","Group 7990","Group 7992","Group 8082"]
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//
//    var body: some View {
//        ZStack {
//            VStack {
//                Spacer()
//                HStack {
//                    Image("Group 2")
//                    //                   Image("Group 8234")
//                        .scaledToFit()
//                    Spacer()
//                    Image("Group 6806")
//                        .scaledToFit()
//                        .padding(.top)
//                        .onTapGesture {
//                            viewRouter.currentPage = "NotificationScreen"
//                        }
//
//                }.padding(.horizontal,15)
//                    .padding(.vertical,40)
//
//                ScrollView(showsIndicators: false) {
//                    VStack{
//                        HStack{
//                            Text("Find the")
//                                .font(Font.custom("poppins", size: 23))
//                                .foregroundColor(Color(textColor))
//                                .bold()
//                            Spacer()
//                        }
//                        HStack{
//                            Text("Best option for you")
//                                .font(Font.custom("poppins", size: 23))
//                                .foregroundColor(Color(textColor))
//                                .bold()
//                            Spacer()
//                        }
//                    }.frame(width: UIScreen.main.bounds.width - 30)
//                        .padding(.vertical,5)
//
//                    SearchBar(searchQuery: .constant(""),caption: "Search Hotel, Resorts Farms")
//                        .onTapGesture {
//                            viewRouter.currentPage = "SearchArea"
//                        }
//                    //carousel
//                    HStack{
//                        Image("Group 7913")
//                            .resizable()
//                            .frame(width: UIScreen.main.bounds.width - 50, height: 142, alignment: .center)
//                            .cornerRadius(20)
//                            .scaledToFit()
//
//                    }.padding(.vertical,20)
//
//                    VStack{
//                        HStack{
//                            Text("Choose Category")
//                                .font(Font.custom("poppins", size: 15))
//                                .foregroundColor(Color(textColor).opacity(0.8))
//                                .fontWeight(.regular)
//                                .padding(.leading)
//                            Spacer()
//                        }
//                        if serviceManager.categorieslistt?.categories?.count ?? 0 > 0 {
//                            LazyVGrid(columns: columns, spacing: 20) {
//                                ForEach(0 ..< (AppUtil.categorieslistt?.categories?.count ?? 0), id: \.self) { item in
//                                    DashboardCards(title: AppUtil.categorieslistt?.categories?[item].category ?? "",
//                                                   imageName: AppUtil.categorieslistt?.categories?[item].image ?? "")
//
//                                    .onTapGesture {
//                                        serviceManager.selectedCategoryId =  AppUtil.categorieslistt?.categories?[item]._id ?? ""
//                                        serviceManager.selectedIndex = item
//                                        serviceManager.selectedType =  AppUtil.categorieslistt?.categories?[item].type ?? ""
//                                        viewRouter.currentPage = "SearchArea"
//                                    }
//                                }
//                            }
//                        }
//                    }.frame(width: UIScreen.main.bounds.width - 20)
//                    if camps.count > 0 {
//                        VStack{
//                            HStack{
//                                Text("Recommended For you")
//                                    .font(Font.custom("poppins", size: 13))
//                                    .foregroundColor(Color(textColor).opacity(0.8))
//                                    .fontWeight(.regular)
//                                    .padding(.leading)
//                                Spacer()
//                            }.padding(.leading)
//                                .offset(y:20)
//
//                            ScrollView(.horizontal) {
//                                HStack{
//
//                                    ForEach(0 ..< camps.count,id:\.self) { _ in
//                                        RecomHotelsCards()
//                                    }
//                                }.padding()
//                            }.padding(.trailing,20)
//                        }
//                    }
//
//                }.padding(.top)
//
//                BottomNavigation()
//            }
//
//            if showPreloader {
//                VStack {}
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(Color("FFFFFF"))
//                    .edgesIgnoringSafeArea(.all)
//                    .opacity(0.6)
//
//                ProgressView()
//                    .progressViewStyle(CircularProgressViewStyle(tint: Color("FEBB12")))
//                    .scaleEffect(x: 4, y: 4, anchor: .center)
//            }
//
//        } .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
//            .ignoresSafeArea(.all)
//            .background(Color("F2F5F9"))
//            .onAppear(perform: {
//
//                if AppUtil.userProfile != nil {
//                    showPreloader = true
//                    let defaults = UserDefaults.standard
//                    defaults.set(AppUtil.userProfile?._id, forKey: Keys.userID)
//                    print("User profile id", AppUtil.userProfile?._id )
//                    if let token = defaults.value(forKey: Keys.userID) as? String {
//                        print("userID token : \(token)")
//                    }
//
//                    if AppUtil.categorieslistt == nil {
//                        UserApiUtil.getCategories(success: { result in
//                            showPreloader = false
//                            AppUtil.categorieslistt = result
//                            DispatchQueue.main.async {
//                                serviceManager.categorieslistt = result
//                            }
//
//                        }, failure: { _ in
//                            showPreloader = false
//                        })
//                    } else {
//                        DispatchQueue.main.async {
//                            serviceManager.categorieslistt = AppUtil.categorieslistt
//                            showPreloader = false
//                        }
//                    }
//
//                    UserApiUtil.getRecommended(success: { res in
//                        camps = res
//                    }, failure: { _ in
//
//                    })
//
//                    SocketHelper.shared.connectSocket {
//                        (success) in
//
//                        print("success")
//                    }
//
//                } else {
//                    showPreloader = true
//                    UserApiUtil.getProfile(success: { res in
//                        AppUtil.userProfile = res
//                        let defaults = UserDefaults.standard
//                        defaults.set(AppUtil.userProfile?._id, forKey: Keys.userID)
//                        if let token = defaults.value(forKey: Keys.userID) as? String {
//                            print("userID: \(token)")
//                        }
//
//                        if AppUtil.categorieslistt == nil   {
//                            UserApiUtil.getCategories(success: { result in
//                                showPreloader = false
//                                AppUtil.categorieslistt = result
//                                DispatchQueue.main.async {
//                                    serviceManager.categorieslistt = result
//                                    SocketHelper.shared.connectSocket {
//                                        (success) in
//
//                                        print("success socket ")
//                                    }
//                                }
//
//                            }, failure: { _ in
//                                showPreloader = false
//                            })
//                        } else {
//                            DispatchQueue.main.async {
//                                serviceManager.categorieslistt = AppUtil.categorieslistt
//                                showPreloader = false
//                            }
//
//                        }
//
//                        UserApiUtil.getRecommended(success: { res in
//                            camps = res
//                        }, failure: { _ in
//
//                        })
//
//                    }, failure: { _ in
//                        showPreloader = false
//                    })
//                }
//
//            })
//    }
//
//   }
//
//struct Dashboard_Previews: PreviewProvider {
//    static var previews: some View {
//        Dashboard()
//    }
//}
