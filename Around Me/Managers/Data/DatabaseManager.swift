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
    override init() {
        super.init()
    }

    func addPlaceToFavourites(_ place: Place, completion: @escaping(_ error: NSError?) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            completion(NSError(domain: "CoreDataErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "NO APP DELEGATE"]))
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Favourites", in: managedContext)!
        
        let favourite = NSManagedObject(entity: entity, insertInto: managedContext)
        favourite.setValue(place.id, forKeyPath: "id")
        favourite.setValue(place.name, forKeyPath: "name")
        favourite.setValue(place.icon, forKeyPath: "icon")
        favourite.setValue(place.location.latitude, forKeyPath: "latitude")
        favourite.setValue(place.location.longitude, forKeyPath: "longitude")

        do {
            try managedContext.save()
            completion(nil)
        } catch {
            completion(NSError(domain: "CoreDataErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "NO ERROR CORE DATA SAVING"]))
        }
    }
    
    func removePlaceFromFavourites(_ placeId: String, completion: @escaping(_ error: NSError?) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            completion(NSError(domain: "CoreDataErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "NO APP DELEGATE"]))
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext

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
            print("Failed")
        }
    }

    func retrieveFavourites(completion: @escaping(_ responseData: [NSManagedObject]?, _ error: NSError?) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            let error = NSError(domain: "CoreDataErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "NO APP DELEGATE"])
            completion(nil, error)
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourites")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            completion(result as? [NSManagedObject], nil)
        } catch {
            print("Failed")
        }
    }
}
