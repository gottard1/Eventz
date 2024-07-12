//
//  PartyHeaderView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 19/01/24.
//

import SwiftUI

struct PartyInfo {
    let local: String
    let name: String
    let dateTime: String
    let address: String
}

struct PartyHeaderView: View {
    let infos: PartyInfo
    
    var body: some View {
        VStack(alignment: .leading) {
            partyNameView
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundStyle(.whiteLabel)
                
                Text(infos.dateTime)
                    .font(.blinker(size: 16))
                    .foregroundStyle(.whiteLabel)
            }
            .padding(.top, 8)
            
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundStyle(.whiteLabel)
                
                Text(infos.address)
                    .font(.blinker(size: 16))
                    .foregroundStyle(.whiteLabel)
            }
            .padding(.top, 4)
        }
        .padding(.bottom, 8)
    }
}

extension PartyHeaderView {
    
    var partyNameView: some View {
        Text(infos.local)
            .font(.blinker(type: .bold, size: 20))
            .foregroundColor(.whiteLabel) +
        
        Text(" - \(infos.name)")
            .font(.blinker(type: .regular, size: 20))
            .foregroundColor(.whiteLabel)
    }
    
}
