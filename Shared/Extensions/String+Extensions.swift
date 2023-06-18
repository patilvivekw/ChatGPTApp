//
//  String+Extensions.swift
//  ChatGPTApp
//
//  Created by Patil, Vivek on 18/06/23.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
