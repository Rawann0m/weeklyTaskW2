# To-Do List App

## Description

A simple and interactive To-Do List app built using SwiftUI. This app allows users to manage tasks efficiently with features like task addition, sorting, filtering, and custom theming. It follows Apple's Human Interface Guidelines and supports dark mode.

## Features

- Multi-Screen Navigation & Data Flow

Uses NavigationStack for seamless navigation between Task List View and Task Detail View.

Each task has a NavigationLink to open a detailed view.

Implements @State, @Binding, and @ObservedObject for data flow.

- Adding & Managing Tasks

Users can input tasks using a TextField.

Add tasks dynamically with an interactive button.

Uses @Published inside ObservableObject to update the task list in real-time.

Provides a filtering option to sort tasks alphabetically.

Supports color flagging, allowing users to assign custom colors to tasks.

- UI Theming & Design

Follows Apple's Human Interface Guidelines for spacing, typography, and design.

Supports dark mode using .preferredColorScheme().

Includes custom colors for a unique appearance.

- Animations & UI Transitions

Uses .animation() for smooth interactions.

Implements .transition() to animate adding/removing tasks.


- Dynamic Layout & Adaptive UI

Adapts to different screen sizes using GeometryReader.

Designed for both portrait and landscape orientations.

Uses LazyVStack to optimize large task lists for better performance.

## Installation

Open the project in Xcode.

Run the app on a simulator or a physical device.

## Technologies Used

SwiftUI

NavigationStack

State Management (@State, @Binding, @ObservedObject)

Animation & Transitions

GeometryReader for adaptive UI

LazyVStack for optimized performance

Custom Theming & Dark Mode Support
