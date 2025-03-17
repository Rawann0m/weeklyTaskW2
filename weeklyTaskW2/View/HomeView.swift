//
//  HomeView.swift
//  weeklyTaskW2
//
//  Created by Rawan on 16/09/1446 AH.
//
import SwiftUI

struct HomeView: View {
    @StateObject private var taskViewModel = TaskViewModel()
    @ObservedObject var settingsViewModel: SettingsViewModel
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack {
                    // Add Task Navigation Link
                    NavigationLink(destination: AddTaskView(taskViewModel: taskViewModel)) {
                        Text("Add Task")
                            .font(.subheadline)
                            .padding()
                            .foregroundColor(.purple)
                            .animation(.spring,value: 1.0)
                        //Dynamic Type size
                            .dynamicTypeSize(.large ... .xxLarge)
                            .accessibilityLabel("Add a new task")
                            .accessibilityHint("Opens the add task screen")
                    }
                    .padding([.top, .leading, .trailing], 20)
                    
                    // Task List
                    ScrollView{
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(taskViewModel.sortedTasks) { task in
                                TaskRowView(task: task, viewModel: taskViewModel)
                                    .transition(.opacity)
                                    .id(task.id)
                                //this will be long press instead of swip
                                    .contextMenu {
                                        Button(role: .destructive) {
                                            taskViewModel.deleteTask(task: task)
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                    }
                                
                                
                            }
                        }
                    .padding([.leading, .trailing], 16)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .scrollContentBackground(.hidden)
                }
                }
                .background(.gray.opacity(0.1))
                .navigationTitle("To-Do List")
                //sort alphabetically or by the completion state
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            taskViewModel.toggleSort()
                        }) {
                            Image(systemName: "arrow.up.arrow.down")
                                .foregroundColor(Color.purple)
                        }
                        .accessibilityLabel("Toggle Sorting")
                        .accessibilityHint("Switch between default and alphabetical sorting")
                    }}
            }
            .preferredColorScheme(settingsViewModel.isDarkMode ? .dark : .light)
        }
    }
}
