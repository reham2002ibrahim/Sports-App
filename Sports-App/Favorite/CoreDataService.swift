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
            guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) else { return }
            
            let league = NSManagedObject(entity: entity, insertInto: context)
            league.setValue(id, forKey: "leagueId")
            league.setValue(name, forKey: "leagueName")
            league.setValue(img, forKey: "leagueImg")
            
        do {
            try context.save()
        } catch {
            print("Can't  save \(error)")
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
