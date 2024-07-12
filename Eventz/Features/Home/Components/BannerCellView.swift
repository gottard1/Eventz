//
//  BannerCellView.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 19/10/23.
//

import SwiftUI

struct BannerCellView: View {
    
    var eventModel: EventModel
    var height: CGFloat = 300
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                let minX = proxy.getMinX()
                let goldNumber: CGFloat = 7
                Image(uiImage: eventModel.image ?? EventzImages.bannerPlaceholder)
                    .resizable()
                    .scaledToFill()
                    .offset(x: -minX + goldNumber)
                    .scaleEffect(CGSize(width: 1, height: 1), anchor: .center)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .applyScrollTransitionIfPossible()
            }
            
            VStack {
                Spacer()
                
                ZStack {
                    Rectangle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .top)
                        )
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(eventModel.name)
                                .lineLimit(0)
                                .font(.blinker(type: .bold, size: 25))
                                .foregroundStyle(.white)
                            
                            HStack {
                                Text(eventModel.startDate)
                                    .font(.blinker(size: 18))
                                    .foregroundStyle(.white)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(16)
                }
                .frame(height: 100)
            }
        }
        .frame(minWidth: UIScreen.main.bounds.size.width - 32, minHeight: height)
        .clipShape(.rect(cornerRadius: 5))
    }
    
}

private extension GeometryProxy {
    
    func getMinX() -> CGFloat {
        if #available(iOS 17.0, *) {
            return self
                .frame(in: .scrollView).minX * 0.5
        } else {
            return self
                .frame(in: .local).minX
        }
    }
    
}

private extension View {
    
    func applyScrollTransitionIfPossible() -> some View {
        if #available(iOS 17.0, *) {
            return self
                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                    view
                        .scaleEffect(phase.isIdentity ? 1 : 0.98)
                        .opacity(phase.isIdentity ? 1 : 0.5)
                }
        } else {
            return self
        }
    }
    
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        
        BannerCellView(eventModel: EventModel(
            name: "El Fortin",
            type: "Festa",
            image: EventzImages.bannerPlaceholder,
            localizationDescription: "Rua Progresso - 2445",
            startDate: "25/10 a 26/10 - Com início as 23h",
            endDate: "25/10 a 26/10 - Com início as 23h",
            eventDescription: "Lorem ipsum semper nullam varius dictumst augue egestas, scelerisque habitasse sem vitae molestie adipiscing, nunc feugiat aliquam suspendisse vestibulum curabitur.",
            localization: LocalizationDataModel(latitude: 0.0, longitude: 0.0)
        ))
    }
}
