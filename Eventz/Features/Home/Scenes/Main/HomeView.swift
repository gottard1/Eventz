//
//  HomeView.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 29/09/23.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    
    @StateObject private var viewModel: HomeViewModel = .init()
    @StateObject private var locationManager: LocationManager = LocationManager.shared
    
    @State private var location: String = ""
    @State private var locationTextFieldText: String = ""
    @State private var selectedCategory: String = "Todos"
    @State private var showRegisterScreen: Bool = false
    @State private var isLogged: Bool = true
    @State private var selection: String? = nil
    @State private var hasAds: Bool = false
    @State private var showLocationField: Bool = false
    @State private var isBannerNavigationEnabled: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack {
                    NavigationLink {
                        MapViewControllerRepresentable()
                    } label: {
                        locationHeader()
                    }
                    
                    categoryCollection(items: viewModel.categories)
                    
                    eventBannerCollection(
                        collectionTitle: selectedCategory == "Todos" ? "Principais eventos na sua região" : selectedCategory,
                        items: viewModel.nearEventsFiltered(by: selectedCategory)
                    )
                    
                    if selectedCategory == "Todos" {
                        if hasAds {
                            AdsBannerCellView()
                        }
                        
                        if viewModel.isLoading {
                            CircularLoading(width: 40, height: 40)
                                .padding(.top, 60)
                        }

                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            .background(Color.backgroundGray)
            .onReceive(locationManager.$currentRegion, perform: { region in
                if let latitude = region?.latitude,
                   let longitude = region?.longitude {
                    let request = GetEventsRequestModel(
                        longitude: Float(latitude),
                        latitude: Float(longitude),
                        range: 10
                    )
                    viewModel.getEvents(request: request)
                }
            })
            .onReceive(locationManager.$locationDescription, perform: { location in
                if !locationManager.locationDescription.cityLocation.isEmpty, !locationManager.locationDescription.streetLocation.isEmpty, !locationManager.locationDescription.districtLocation.isEmpty {
                    self.location = "\(location.cityLocation)\n\(location.streetLocation) - \(location.districtLocation)"
                }
            })
            
            VStack {
                Spacer()
                
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.black.opacity(0.5), .clear]), startPoint: .bottom, endPoint: .top)
                    )
                    .frame(height: 50)
            }
        }
    }
}

struct LoadingAnimation: View {
    
    @State private var xPosition = 1.0
    var animating: Bool = false
    
    var body: some View {
        HStack {
            GeometryReader { proxy in
                Circle()
                    .onAppear {
                        xPosition = proxy.size.width
                    }
                    .foregroundStyle(.white)
                    .frame(width: 5, height: 5)
                    .position(x: xPosition, y: proxy.size.height / 2)
                    .animation(.easeInOut(duration: 1).repeatForever(), value: xPosition)
            }
        }
        .frame(minWidth: 30)
    }
    
}

// MARK: - Functions Layout
private extension HomeView {
    
    func locationHeader() -> some View {
        ShadowedCardView {
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundStyle(.white)
                
                Text(location)
                    .font(.blinker(type: .regular, size: 15))
                    .foregroundStyle(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                if location.isEmpty {
                    CircularLoading(width: 10, height: 10)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white)
                    .onTapGesture {
                        withAnimation {
                            showLocationField.toggle()
                        }
                    }
            }
            .padding(16)
        }
        .padding(.top, 16)
    }
    
    func eventBannerCollection(collectionTitle: String, items: [EventModel]) -> some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Text(!items.isEmpty ? collectionTitle : "")
                    .foregroundStyle(.white)
                    .font(.blinker(type: .regular, size: 16))
                Spacer()
            }
            
            Spacer()
                .frame(height: 14)
            
            if !items.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(items.indices, id: \.self) { index in
                            let banner = BannerCellView(eventModel: items[index])
                                .shadow(color: .black.opacity(0.3), radius: 2, x: -4, y: 4)
                                .sheet(isPresented: $showRegisterScreen, content: {
                                    SignupView()
                                        .presentationDetents([.fraction(0.75), .large])
                                })
                                .padding(.bottom, 10)
                            
                            if isLogged {
                                NavigationLink {
                                    EventDetailView(eventModel: items[index])
                                } label: {
                                    banner
                                }
                            } else {
                                banner
                                    .onTapGesture {
                                        if !isLogged {
                                            showRegisterScreen = true
                                        }
                                    }
                            }
                        }
                    }
                    .padding(.horizontal, 14)
                    .applyScrollTargetLayoutIfPossible()
                }
                .padding(.horizontal, -14)
                .applyScrollTargetBehaviorIfPossible()
            } else {
                noContentView
            }
            
        }
        .padding([.top, .bottom], 12)
    }
    
    func categoryCollection(items: [String]) -> some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(items.indices, id: \.self) { index in
                        CategoryCellView(
                            isSelected: viewModel.categories[index] == selectedCategory,
                            index: index,
                            title: items[index]
                        ) { selectedIndex in
                            withAnimation(.easeInOut) {
                                selectedCategory = viewModel.categories[selectedIndex]
                            }
                        }
                    }
                }
                .padding(.horizontal, 14)
                
            }
            .padding(.horizontal, -14)
        }
        .padding(.top, 30)
        .padding(.bottom, 18)
    }
    
    var noContentView: some View {
        VStack(spacing: 8) {
            if viewModel.alertMessage.isEmpty {
                Text("Nenhum evento encontrado na categoria ")
                    .foregroundStyle(.white)
                    .font(.blinker(size: 15))
                
                Text("\(selectedCategory)")
                    .foregroundStyle(.white)
                    .font(.bungeeSpice(size: 15))
            } else {
                ShadowedCardView {
                    VStack {
                        Image(systemName: "exclamationmark.circle")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 30, height: 30)
                            .padding(.bottom, 5)
                        
                        Text(viewModel.alertMessage)
                            .foregroundStyle(.white)
                            .font(.blinker(type: .bold, size: 20))
                    }
                    .padding(16)
                }
            }
        }
    }
    
}

private extension View {
    
    func applyScrollTargetLayoutIfPossible() -> some View {
        if #available(iOS 17.0, *) {
            return self
                .scrollTargetLayout()
        } else {
            return self
        }
    }
    
    func applyScrollTargetBehaviorIfPossible() -> some View {
        if #available(iOS 17.0, *) {
            return self
                .scrollTargetBehavior(.viewAligned)
        } else {
            return self
        }
    }
}

#Preview {
    HomeView()
}
