//
//  BuddiesViewModel.swift
//  TestTask
//
//  Created by Amaury Vidal on 31/01/2017.
//
//

import Foundation
import CoreData

struct BuddiesViewModel {
    var buddies = [Buddy]()
    
    init() {
        buddies = findBuddies()
        
        if buddies.count == 0 {
            addHardCodedBuddies()
            buddies = findBuddies()
        }
    }
    
    var nbBuddies: Int {
        return buddies.count
    }
    
    func buddy(at index: Int) -> Buddy? {
        guard index < buddies.count else {
            return nil
        }
        return buddies[index]
    }
}

extension BuddiesViewModel {
    func addBuddy(name: String) {
        let buddy = Buddy(context: CoreDataStack.shared.viewContext)
        buddy.name = name
    }
    
    func findBuddies() -> [Buddy] {
        let request: NSFetchRequest<Buddy> = Buddy.fetchRequest()
        print(request)
        
        do {
            return try CoreDataStack.shared.viewContext.fetch(request)
        } catch {
            fatalError("Failed to fetch buddies: \(error)")
        }
    }
    
    func addHardCodedBuddies() {
        addBuddy(name: "Jacob")
        addBuddy(name: "Bonnie")
        addBuddy(name: "Matt")
        addBuddy(name: "Kelly")
        CoreDataStack.shared.saveContext()
    }
}
