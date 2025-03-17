//
//  TaskRowView.swift
//  weeklyTaskW2
//
//  Created by Rawan on 16/09/1446 AH.
//
import SwiftUI

struct TaskRowView: View {
    let task: Task
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
            HStack {
                // Checkmark Button
                Button {
                    viewModel.toggleTaskCompletion(task: task)
                } label: {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(task.isCompleted ? .green : .gray)
                }
                .buttonStyle(.plain) // Ensure the button doesn't interfere with the NavigationLink
                
                RoundedRectangle(cornerRadius: 5)
                                    .fill(task.color)
                                    .frame(width: 15, height: 15)
                                    .padding(.trailing, 10)
                // Task Details (Navigation Area)
                NavigationLink(destination: TaskDetailView(task: task)) {
                    VStack(alignment: .leading) {
                        Text(task.title)
                            .strikethrough(task.isCompleted, color: .gray)
                            .foregroundColor(task.isCompleted ? .gray : .primary)
                            .dynamicTypeSize(.large ... .xxLarge)
                        Text(task.details)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                    .contentShape(Rectangle()) // Make the entire area tappable
                    Spacer()
                    Image(systemName: "arrow.right")
                    
                }
                .buttonStyle(.plain)
                
            }
            .padding()
        }
    }
