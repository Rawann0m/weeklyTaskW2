//
//  TaskViewModel.swift
//  weeklyTaskW2
//
//  Created by Rawan on 16/09/1446 AH.
//
import SwiftUI

enum SortOption {
    case defaultSort
    case alphabetical
}

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [
        Task(title: "Complete project", details: "SwiftUI project", isCompleted: false, color: .blue),
        Task(title: "Read a book", details: "Read for 30 minutes", isCompleted: false, color: .blue),
        Task(title: "Go for a walk", details: "For 20 minutes", isCompleted: true, color: .yellow)
    ]

    @Published var isDarkMode = false
    @Published var sortOption: SortOption = .defaultSort

    // Add a new task
    func addTask(title: String, details: String, color: Color) {
        guard !title.isEmpty else { return }
        withAnimation {
            let newTask = Task(title: title, details: details, isCompleted: false, color: color)
            tasks.append(newTask)
        }
    }


    // Toggle task completion
    func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            withAnimation {
                tasks[index].isCompleted.toggle()
            }
        }
    }


    // Delete task
    func deleteTask(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            withAnimation {
                tasks.remove(at: index)
                objectWillChange.send() // Forces UI update
            }
        }
    }

    // Sort tasks
    var sortedTasks: [Task] {
        let sorted = tasks.sorted { !$0.isCompleted && $1.isCompleted }
        
        switch sortOption {
        case .defaultSort:
            return sorted
        case .alphabetical:
            return sorted.sorted { $0.title.lowercased() < $1.title.lowercased() }
        }
    }
    // Toggle sorting option
    func toggleSort() {
        sortOption = (sortOption == .defaultSort) ? .alphabetical : .defaultSort
    }
}
