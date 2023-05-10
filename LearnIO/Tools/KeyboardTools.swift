//
//  Tools.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 08/05/2023.
//

import Foundation
import SwiftUI

public struct KeyboardTools {
    public static func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
