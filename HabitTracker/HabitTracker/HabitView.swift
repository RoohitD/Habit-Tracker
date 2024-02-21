//
//  HabitView.swift
//  HabitTracker
//
//  Created by Rohit Deshmukh on 09/08/23.
//

import SwiftUI

struct HabitView: View {
    
    @ObservedObject var habit: HabitItem
    
    
    var body: some View {
        VStack {
            HStack {
                Text(habit.title)
                    .font(.title2)
                Spacer()
            }
            HStack {
                Text("Counter: \(habit.counter)")
                    .font(.caption)
                Spacer()
                Spacer()
                
                Spacer()
            }
            
        }
    }
}

struct HabitView_Previews: PreviewProvider {

    static var previews: some View {
        HabitView(habit: HabitItem(title: "Reading", timesPerDay: 1))
    }
}
