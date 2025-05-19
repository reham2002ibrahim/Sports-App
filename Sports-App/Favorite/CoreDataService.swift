//
//  CoreDataService.swift
//  Sports-App
//
//  Created by MAC on 19/05/2025.
//

import UIKit
import CoreData

class CoreDataService {

    static let shared = CoreDataService()
    
    private let context: NSManagedObjectContext

    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    
    
    func addLeague(to entityName: String, id: Int, name: String, img: String) {
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "leagueId == %d", id)
        fetchRequest.fetchLimit = 1
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if let existingLeague = results.first {
                existingLeague.setValue(name, forKey: "leagueName")
                existingLeague.setValue(img, forKey: "leagueImg")
            } else {
                guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) else { return }
                let newLeague = NSManagedObject(entity: entity, insertInto: context)
                newLeague.setValue(id, forKey: "leagueId")
                newLeague.setValue(name, forKey: "leagueName")
                newLeague.setValue(img, forKey: "leagueImg")
            }
            
            try context.save()
        } catch {
            print("Error \(error)")
            context.rollback()
        }
    }
    

    func getAllLeagues(from entityName: String) -> [NSManagedObject] {
          let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
          do {
              let results = try context.fetch(fetchRequest)
              return results as? [NSManagedObject] ?? []
          } catch {
              print("Failed to fetch \(error)")
              return []
          }
      }
    
    func deleteLeague(from entityName: String, id: Int) {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            fetchRequest.predicate = NSPredicate(format: "leagueId == %d", id)
            do {
                let results = try context.fetch(fetchRequest)
                for object in results {
                    if let objectToDelete = object as? NSManagedObject {
                        context.delete(objectToDelete)
                    }
                }
                do {
                    try context.save()
                } catch {
                    print("Failed to save \(error)")
                }
            } catch {
                print("Failed to delete  \(error)")
            }
        }
    
    
    
    
}
