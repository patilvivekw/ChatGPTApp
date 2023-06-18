//
//  Query.swift
//  ChatGPTApp
//
//  Created by Patil, Vivek on 18/06/23.
//

import Foundation

struct Query: Identifiable, Hashable {
    let id = UUID()
    let question: String
    let answer: String
}
