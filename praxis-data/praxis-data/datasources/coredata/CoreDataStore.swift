//
//  CoreDataStore.swift
//  praxis-data
//https://github.com/deda9/CoreData-Combine/blob/f7a0c6a381b7c8b2b8e8c506078776bf7330c197/CoreDataExample/Source/CoreDataStore.swift
//  Created by Anmol Verma on 10/02/22.
//

import CoreData

extension NSManagedObject {
    class var entityName: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}

protocol EntityCreating {
    static  var viewContext: NSManagedObjectContext { get }
    static func createEntity<T: NSManagedObject>() -> T
}

extension EntityCreating {
    static func createEntity<T: NSManagedObject>() -> T {
        T(context: Self.viewContext)
    }
}

protocol CoreDataFetchResultsPublishing {
    static  var viewContext: NSManagedObjectContext { get }
    static func publisher<T: NSManagedObject>(fetch request: NSFetchRequest<T>) -> CoreDataFetchResultsPublisher<T>
}

extension CoreDataFetchResultsPublishing {
    static func publisher<T: NSManagedObject>(fetch request: NSFetchRequest<T>) -> CoreDataFetchResultsPublisher<T> {
        return CoreDataFetchResultsPublisher(request: request, context: Self.viewContext)
    }
}

protocol CoreDataDeleteModelPublishing {
    static var viewContext: NSManagedObjectContext { get }
    static func publisher(delete request: NSFetchRequest<NSFetchRequestResult>) -> CoreDataDeleteModelPublisher
}

extension CoreDataDeleteModelPublishing {
    static func publisher(delete request: NSFetchRequest<NSFetchRequestResult>) -> CoreDataDeleteModelPublisher {
        return CoreDataDeleteModelPublisher(delete: request, context: Self.viewContext)
    }
}

protocol CoreDataSaveModelPublishing {
    static  var viewContext: NSManagedObjectContext { get }
    static func publisher(save action: @escaping Action) -> CoreDataSaveModelPublisher
}

extension CoreDataSaveModelPublishing {
    static func publisher(save action: @escaping Action) -> CoreDataSaveModelPublisher {
        return CoreDataSaveModelPublisher(action: action, context: Self.viewContext)
    }
}

protocol CoreDataStoring: EntityCreating, CoreDataFetchResultsPublishing, CoreDataDeleteModelPublishing, CoreDataSaveModelPublishing {
    static var viewContext: NSManagedObjectContext { get }
}

class CoreDataStore: CoreDataStoring {

    
    static var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    
    static  let identifier: String  = "com.mutualmobile.praxis-data"       //Your framework bundle ID
    static  let model: String       = "praxis-data"                      //Model name
    

    public static var container: NSPersistentContainer = {
            //5
            let messageKitBundle = Bundle(identifier: identifier)
            let modelURL = messageKitBundle!.url(forResource: model, withExtension: "momd")!
            let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
            
            let container = NSPersistentContainer(name: model, managedObjectModel: managedObjectModel!)
            container.loadPersistentStores { (storeDescription, error) in
                
                if let err = error{
                    fatalError("❌ Loading of store failed:\(err)")
                }
            }
            
            return container
        }()

    
}
