//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Rohit Deshmukh on 09/08/23.
//

import SwiftUI

struct AddHabitView: View {
    
    @State private var title: String = ""
    @State private var timesPerDay: Int = 0
    
    @ObservedObject var habitList = Habits()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                Section {
                    Stepper("\(timesPerDay) times/day", value: $timesPerDay)
                }
            }
            .navigationTitle("Add Habit")
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
                Button {
                    let habit = HabitItem(title: title, timesPerDay: timesPerDay)
                    habitList.habits.append(habit)
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habitList: Habits())
    }
}
