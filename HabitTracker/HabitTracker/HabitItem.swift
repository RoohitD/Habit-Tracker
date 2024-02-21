//
//  Habit.swift
//  HabitTracker
//
//  Created by Rohit Deshmukh on 09/08/23.
//

import Foundation

class HabitItem: Identifiable, ObservableObject, Codable {
    var id = UUID()
    
    @Published var title: String = ""
    @Published var counter: Int
    @Published var timesPerDay: Int
    
    init(id: UUID = UUID(), title: String, timesPerDay: Int) {
        self.id = id
        self.title = title
        self.counter = 0
        self.timesPerDay = timesPerDay
    }
    
    // MARK: - Encodable
        enum CodingKeys: CodingKey {
            case id, title, counter, timesPerDay
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(title, forKey: .title)
            try container.encode(counter, forKey: .counter)
            try container.encode(timesPerDay, forKey: .timesPerDay)
        }
        
        // MARK: - Decodable
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(UUID.self, forKey: .id)
            title = try container.decode(String.self, forKey: .title)
            counter = try container.decode(Int.self, forKey: .counter)
            timesPerDay = try container.decode(Int.self, forKey: .timesPerDay)
        }
}
