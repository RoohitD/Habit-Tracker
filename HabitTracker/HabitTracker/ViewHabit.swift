//
//  ViewHabit.swift
//  HabitTracker
//
//  Created by Rohit Deshmukh on 09/08/23.
//

import SwiftUI

struct ViewHabit: View {
    
    @ObservedObject var habit: HabitItem
    
    var body: some View {
        ZStack {
            
            Color.init(red: 210.0 / 255.0, green: 231.0 / 255.0, blue: 186.0 / 255.0).ignoresSafeArea()

            
            VStack {
                Text(habit.title)
                    .font(.largeTitle.bold())
                Spacer()
                Text("Counter: \(habit.counter)")
                Spacer()
                Button {
                    habit.counter += 1
                } label: {
                    Text("Done")
                    .padding()
                    .frame(maxWidth: 200)
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
            }
        }
    }
}

struct ViewHabit_Previews: PreviewProvider {
    static var previews: some View {
        ViewHabit(habit: HabitItem(title: "Reading", timesPerDay: 1))
    }
}
