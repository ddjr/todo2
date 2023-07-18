//
//  Models.swift
//  todo2
//
//  Created by David Daly on 7/17/23.
//

import Foundation

// -------------------------------
// MARK: 👨‍🚀 USER MODEL
// -------------------------------
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}

// -------------------------------
// MARK: 📝 TODO MODEL
// -------------------------------
struct Todo: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let CreatedDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}

// -------------------------------
// MARK: 🧩 ENCODABLE EXTENSION
// -------------------------------
extension Encodable {
    // -------------------------------
    // 🔀 Convert an object to a dictionary
    func asDictionary() -> [String: Any] {
        // 🔀 Try to convert the Object into JSON
        guard let data = try? JSONEncoder().encode(self)
        // ⛔️ Return empty dictionary if it fails
        else { return [:] }
        
        // 🔀 Try to convert JSON into a dictionary
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        // ⛔️ Return empty dictionary if it fails
        } catch { return [:] }
    }
}
