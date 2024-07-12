//
//  ProfileHomeView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 05/04/24.
//

import SwiftUI

struct ProfileHomeView: View {
    var viewModel: ProfileHomeViewModel
    
    @State private var isEnabledButton: Bool = true
    
    init() {
        viewModel = ProfileHomeViewModel()
    }
    
    var body: some View {
        ZStack {
            Color.backgroundGray
                .ignoresSafeArea()
            
            ScrollView {
                ZStack {
                    bannerImage
                    
                    VStack {
                        Spacer()
                        
                        LinearGradient(gradient: Gradient(colors: [Color.backgroundGray, .clear]),
                                       startPoint: .bottom,
                                       endPoint: .top)
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 70)
                        .padding(.bottom, -8)
                    }
                }
                
                VStack {
                    profileHeader
                        .padding([.leading, .trailing, .bottom])
                    
                    infoSection
                        .padding()
                    
                    buttonsStack
                        .padding(.top, 32)
                        .padding([.leading, .trailing], 16)
                    
                    EventzButton(
                        isEnabled: $isEnabledButton,
                        title: "Sair",
                        systemImage: "rectangle.portrait.and.arrow.right",
                        titleColor: .whiteLabel,
                        color: .redFF5252
                    ) {
                        print("sair")
                    }
                    .padding([.leading, .trailing], 16)
                    .padding([.top, .bottom], 32)
                }
                .padding(.bottom, 96)
                .background(.backgroundGray)
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
        }
    }
}

// MARK: - Layout
extension ProfileHomeView {
    
    var bannerImage: some View {
        ParallaxHeader(
            coordinateSpace: CoordinateSpaces.scrollView,
            defaultHeight: 275
        ) {
            Image(viewModel.profile.banner ?? "profileDefaultBanner")
                .resizable()
                .scaledToFill()
        }
    }
    
    var profileHeader: some View {
        HStack {
            Image(viewModel.profile.icon ?? "profileDefaultIcon")
                .frame(width: 70, height: 70)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(viewModel.profile.name)
                    .font(.blinker(type: .semiBold, size: 20))
                    .foregroundStyle(.whiteLabel)
                
                Text("\(viewModel.profile.age) anos")
                    .font(.blinker(size: 13))
                    .foregroundStyle(.whiteLabel)
                
                HStack {
                    Image(systemName: "envelope.fill")
                        .resizable()
                        .frame(width: 14, height: 10)
                        .foregroundStyle(.whiteLabel)
                    
                    Text(viewModel.profile.email)
                        .font(.blinker(size: 13))
                        .foregroundStyle(.whiteLabel)
                }
            }
            .padding(.top, 8)
            Spacer()
        }
    }
    
    var infoSection: some View {
        HStack(alignment: .top) {
            Spacer()
            
            VStack {
                Text("\(viewModel.profile.eventsAttended)")
                    .font(.blinker(type: .extraBold, size: 20))
                    .foregroundStyle(.whiteLabel)
                
                Text("Eventos \ncomparecidos")
                    .font(.blinker(type: .light, size: 13))
                    .foregroundStyle(.whiteLabel)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            VStack {
                Text("\(viewModel.profile.followers)")
                    .font(.blinker(type: .extraBold, size: 20))
                    .foregroundStyle(.whiteLabel)
                
                Text("Seguidores")
                    .font(.blinker(type: .light, size: 13))
                    .foregroundStyle(.whiteLabel)
                    .padding(.top, -8)
            }
            
            Spacer()
            
            VStack {
                Text("\(viewModel.profile.following)")
                    .font(.blinker(type: .extraBold, size: 20))
                    .foregroundStyle(.whiteLabel)
                
                Text("Seguindo")
                    .font(.blinker(type: .light, size: 13))
                    .foregroundStyle(.whiteLabel)
                    .padding(.top, -8)
            }
            
            Spacer()
        }
    }
    
    var buttonsStack: some View {
        VStack(spacing: 12) {
            ConfigurationButtonView(
                image: Image(systemName: "gearshape"),
                text: "Configurações"
            )
            
            ConfigurationButtonView(
                image: Image("card-icon"),
                text: "Formas de pagamento"
            )
            
            ConfigurationButtonView(
                image: Image(systemName: "person.text.rectangle"),
                text: "Minhas informações"
            )
            
            ConfigurationButtonView(
                image: Image(systemName: "questionmark.square"),
                text: "Ajuda"
            )
        }
    }
}

#Preview {
    ProfileHomeView()
        .navigationTitle("Perfil")
}
