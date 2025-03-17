//
//  TaskModel.swift
//  weeklyTaskW2
//
//  Created by Rawan on 16/09/1446 AH.
//

import SwiftUI
//here is the structure of my tasks
struct Task: Identifiable {
    let id = UUID()
    var title: String
    var details: String
    var isCompleted: Bool
    var color: Color
}
