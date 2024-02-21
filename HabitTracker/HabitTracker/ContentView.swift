//
//  ContentView.swift
//  HabitTracker
//
//  Created by Rohit Deshmukh on 09/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var habitList = Habits()
    
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habitList.habits) { habit in
                    Section {
                        NavigationLink {
                            ViewHabit(habit: habit)
                        } label: {
                            HabitView(habit: habit)
                        }
                    }
                }
                .onDelete(perform: removeRows)
            }
            .navigationTitle("Habits")
            .toolbar {
                Button {
                    showingAddView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddHabitView(habitList: habitList)
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        habitList.habits.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
