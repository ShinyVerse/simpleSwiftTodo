//
//  HiddenModifier.swift
//  todo
//
//  Created by Laura Jackson on 24/04/2024.
//

import SwiftUI

struct HiddenModifier: ViewModifier {
    var isEnabled = false
    func body(content: Content) -> some View {
        if isEnabled {
            content
                .hidden()
        } else {
            content
        }
    }
}

extension View {
    func hidden(enable: Bool) -> some View {
        modifier(HiddenModifier(isEnabled: enable))
    }
}
