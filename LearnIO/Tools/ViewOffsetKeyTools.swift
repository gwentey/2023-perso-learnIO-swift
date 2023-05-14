//
//  ViewOffsetKeyTools.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 14/05/2023.
//

import Foundation
import SwiftUI

struct ViewOffsetKeyTools: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
