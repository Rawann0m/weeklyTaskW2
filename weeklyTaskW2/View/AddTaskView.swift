//
//  AddTaskView.swift
//  weeklyTaskW2
//
//  Created by Rawan on 16/09/1446 AH.
//
import SwiftUI

struct AddTaskView: View {
    @ObservedObject var taskViewModel: TaskViewModel
    @State private var newTask = ""
    @State private var details = ""
    @State private var selectedColor: Color = .blue
    @Environment(\.dismiss) var dismiss
    // here is the add task page
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.01)
                    .edgesIgnoringSafeArea(.all)
                HStack {
                    VStack {
                        //textfiled for the task
                        TextField("Enter new task", text: $newTask)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .dynamicTypeSize(.large ... .xxLarge)
                            .accessibilityLabel("New task field")
                            .accessibilityHint("Type the name of the task here")
                        //textfiled for the details
                        TextField("Enter the task details", text: $details)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .dynamicTypeSize(.large ... .xxLarge)
                            .accessibilityLabel("New task details field")
                            .accessibilityHint("Type the details of the task here")
                        //color picker
                        ColorPicker("Select Task Color", selection: $selectedColor)
                            .padding()
                            .accessibilityLabel("Pick a color for the task")
                    }
                    // button to add the task
                    Button(action: addTask) {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .dynamicTypeSize(.large ... .xxLarge)
                            .accessibilityLabel("Confirm add task")
                            .accessibilityHint("Adds the task to the list")
                    }
                    //button should be enable/disable
                    .disabled(newTask.isEmpty)
                    .padding(.trailing)
                }
                .navigationTitle("New Task")
            }
        }
    }
    
    private func addTask() {
        taskViewModel.addTask(title: newTask, details: details, color: selectedColor)
        dismiss()
    }
}

