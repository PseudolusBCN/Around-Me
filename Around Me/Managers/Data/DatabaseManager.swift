//
//  DatabaseManager.swift
//  Around Me
//
//  Created by Miquel Masip on 12/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import CoreData

class DatabaseManager: NSObject {
    // MARK: - Init
    override init() {
        super.init()
    }

    // MARK: - Public methods
    func addPlaceToFavourites(_ place: Place, completion: @escaping(_ error: NSError?) -> Void) {
        guard let managedContext = managedContext() else {
            completion(errorNoAppDelegate())
            return
        }
        let entity = NSEntityDescription.entity(forEntityName: "Favourites", in: managedContext)!
        
        let favourite = NSManagedObject(entity: entity, insertInto: managedContext)
        favourite.setValue(place.id, forKeyPath: "id")
        favourite.setValue(place.name, forKeyPath: "name")
        favourite.setValue(place.types, forKeyPath: "types")
        favourite.setValue(place.icon, forKeyPath: "icon")
        favourite.setValue(place.location.latitude, forKeyPath: "latitude")
        favourite.setValue(place.location.longitude, forKeyPath: "longitude")

        do {
            try managedContext.save()
            completion(nil)
        } catch {
            completion(errorSavingData())
        }
    }
    
    func removePlaceFromFavourites(_ placeId: String, completion: @escaping(_ error: NSError?) -> Void) {
        guard let managedContext = managedContext() else {
            completion(errorNoAppDelegate())
            return
        }

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourites")
        request.predicate = NSPredicate.init(format: "id==%@", placeId)
        
        let results = try! managedContext.fetch(request)
        for object in results {
            managedContext.delete(object as! NSManagedObject)
        }
        
        do {
            try managedContext.save()
            completion(nil)
        } catch {
            completion(errorRemovingData())
        }
    }

    func retrieveFavourites(completion: @escaping(_ responseData: [NSManagedObject]?, _ error: NSError?) -> Void) {
        guard let managedContext = managedContext() else {
            completion(nil, errorNoAppDelegate())
            return
        }

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourites")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            completion(result as? [NSManagedObject], nil)
        } catch {
            completion(nil, errorRetrievingData())
        }
    }
    
    // MARK: - Private methods
    private func managedContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    private func errorNoAppDelegate() -> NSError {
        return NSError(domain: "CoreDataErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "NO APP DELEGATE"])
    }
    
    private func errorSavingData() -> NSError {
        return NSError(domain: "CoreDataErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "ERROR SAVING DATA"])
    }

    private func errorRetrievingData() -> NSError {
        return NSError(domain: "CoreDataErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "ERROR RETRIEVING DATA"])
    }

    private func errorRemovingData() -> NSError {
        return NSError(domain: "CoreDataErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "ERROR REMOVING DATA"])
    }
}
