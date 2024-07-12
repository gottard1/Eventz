//
//  CheckBox.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 06/11/23.
//

import SwiftUI

struct CheckBox: View {
    
    @Binding var isSelected: Bool
    var onTap: (() -> ())? = nil
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(isSelected ? .white : .gray1D1D1D)
            Image("XIcon")
                .foregroundStyle(isSelected ? .gray6D6D6D : .gray6D6D6D)
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                isSelected.toggle()
            }
            onTap?()
        }
        .frame(width: 30, height: 30)
        .clipShape(.rect(cornerRadius: 5))
    }
    
}

struct CheckBoxPreview: View {
    
    @State var checkBoxIsSelected: Bool = false
    
    var body: some View {
        CheckBox(isSelected: $checkBoxIsSelected)
    }
    
}

#Preview {
    CheckBoxPreview()
}
