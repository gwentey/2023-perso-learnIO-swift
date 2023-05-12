//
//  DateTools.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 12/05/2023.
//

import Foundation

public struct DateTools {
    
    public static func DateFormatteur(_ date: Date) -> String {

    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM"
        
    let formattedDate = formatter.string(from: date)
        
    return formattedDate
    
    }
}
