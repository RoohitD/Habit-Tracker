//
//  Habits.swift
//  HabitTracker
//
//  Created by Rohit Deshmukh on 09/08/23.
//

import Foundation

class Habits: ObservableObject {
    @Published var habits = [HabitItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedHabits) {
                habits = decodedItems
                return
            }
        }
        habits = []
    }
    
    
}
