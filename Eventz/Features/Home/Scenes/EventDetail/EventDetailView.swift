//
//  EventDetailView.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 22/10/23.
//

import SwiftUI

struct EventDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var eventModel: EventModel
    
    @State private var isNotificationSubscriber: Bool = false
    
    init(eventModel: EventModel) {
        self.eventModel = eventModel
    }
    
    var body: some View {
        ZStack {
            Color.backgroundGray
                .ignoresSafeArea()
            
            ScrollView {
                ParallaxHeader(
                    coordinateSpace: CoordinateSpaces.scrollView,
                    defaultHeight: 275
                ) {
                    Image(uiImage: eventModel.image ?? EventzImages.bannerPlaceholder)
                        .resizable()
                        .scaledToFill()
                }
                
                ZStack {
                    Color.backgroundGray
                    
                    VStack {
                        HStack {
                            Text(eventModel.name)
                                .font(.bungeeSpice(size: 32))
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        HStack {
                            Text(eventModel.type)
                                .font(.blinker(type: .regular, size: 18))
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        HStack {
                            Image("clockIcon")
                                .foregroundStyle(.whiteLabel)
                            Text(eventModel.startDate)
                                .font(.blinker(type: .regular, size: 12))
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.top)
                        .padding(.horizontal, 20)
                        
                        HStack {
                            Image("localizationIcon")
                                .foregroundStyle(.whiteLabel)
                            Text(eventModel.localizationDescription)
                                .font(.blinker(type: .regular, size: 12))
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        ShadowedCardView(backgroundColor: .green52FF82) {
                            NavigationLink {
                                PurchaseTicketView()
                            } label: {
                                BuyNowButton(title: "COMPRAR INGRESSOS", description: "A partir de R$ 65,00")
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top)
                        
                        ShadowedCardView {
                            VStack {
                                HStack {
                                    Text("DESCRIÇÃO")
                                        .font(.blinker(type: .regular, size: 18))
                                        .foregroundStyle(.white)
                                    Spacer()
                                }
                                .padding(16)
                                
                                Text(eventModel.eventDescription)
                                    .font(.blinker(type: .regular, size: 18))
                                    .foregroundStyle(.white)
                                    .padding([.horizontal, .bottom], 16)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top)
                        
                        Spacer()
                    }
                    .padding([.top, .bottom], 20)
                }
                .clipShape(.rect(cornerRadius: 8))
                .frame(minHeight: 300)
                .shadow(radius: 5, y: -5)
                .offset(y: -18)
            }
            .coordinateSpace(name: CoordinateSpaces.scrollView)
            .navigationBarBackButtonHidden()
            .navigationBarItems(
                leading:
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.whiteLabel)
                    }),
                trailing: Button(action: {
                    isNotificationSubscriber.toggle()
                }, label: {
                    Image(systemName: isNotificationSubscriber ? "bell.and.waves.left.and.right.fill" : "bell.and.waves.left.and.right")
                        .foregroundStyle(.whiteLabel)
                })
            )
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("EVENTO")
            .toolbar(.hidden, for: .tabBar)
            
            VStack {
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.black.opacity(0.5), .clear]), startPoint: .top, endPoint: .bottom)
                    )
                    .frame(height: 50)
                
                Spacer()
            }
        }
    }
}
