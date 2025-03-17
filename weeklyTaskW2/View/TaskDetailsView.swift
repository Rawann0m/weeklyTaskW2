//
//  TaskDetailsView.swift
//  weeklyTaskW2
//
//  Created by Rawan on 16/09/1446 AH.
//

import SwiftUI

struct TaskDetailView: View {
    let task: Task
// the details page
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(task.title)
                .font(.title)
                .fontWeight(.bold)

            Text(task.details)
                .font(.body)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .navigationTitle("Task Details")
    }
}
