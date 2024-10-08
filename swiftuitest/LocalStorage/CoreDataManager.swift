//
//  CoreDataManager.swift
//  swiftuitest
//
//  Created by shadi zaqout on 08/10/2024.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FriendFavorite")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func isFavorite(friendId: Int) -> Bool {
        let request: NSFetchRequest<FriendFavorite> = FriendFavorite.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", friendId)
        
        do {
            let results = try viewContext.fetch(request)
            return !results.isEmpty
        } catch {
            print("Error fetching favorite status: \(error)")
            return false
        }
    }
    
    func saveFriendIdToCoreData(friendId: Int) {
        let favorite = FriendFavorite(context: viewContext)
        favorite.id = Int64(friendId)
        
        do {
            try viewContext.save()
        } catch {
            print("Error saving favorite: \(error)")
        }
    }
    
    func deleteFriendIdFromCoreData(friendId: Int) {
        let request: NSFetchRequest<FriendFavorite> = FriendFavorite.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", friendId)
        
        do {
            let results = try viewContext.fetch(request)
            for favorite in results {
                viewContext.delete(favorite)
            }
            try viewContext.save()
        } catch {
            print("Error deleting favorite: \(error)")
        }
    }
}
