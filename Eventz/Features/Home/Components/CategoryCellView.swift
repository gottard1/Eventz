//
//  File.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 20/10/23.
//

import SwiftUI

struct CategoryCellView: View {
    
    var isSelected: Bool = false
    
    let didTapOnIndex: (Int) -> ()
    let index: Int
    let title: String
    
    init(isSelected: Bool, index: Int, title: String, didTapOnIndex: @escaping (Int) -> ()) {
        self.isSelected = isSelected
        self.index = index
        self.title = title
        self.didTapOnIndex = didTapOnIndex
    }
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(isSelected ? .black : .white)
                .font(.bungeeSpice(size: 15))
                .padding([.top, .bottom], 10)
                .padding(.horizontal, 16)
        }
        .background(isSelected ? .white : .gray1D1D1D)
        .clipShape(.rect(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray6D6D6D, lineWidth: 1)
        )
        .onTapGesture {
            self.didTapOnIndex(self.index)
        }
    }
    
}

#Preview {
    ZStack {
        Color.black
        CategoryCellView(isSelected: false, index: 0, title: "Título", didTapOnIndex: {_ in })
    }
}
