//
//  DateExtension.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 28/02/2023.
//

import Foundation

extension Date {
    func toString(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
