//
//  NotesLocalDataSource.swift
//  praxis-data
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation


import CoreData

public struct NotesLocalDataSource {
    
    static  let identifier: String  = "com.mutualmobile.praxis-data"       //Your framework bundle ID
    static   let model: String       = "praxis-data"                      //Model name
    
    public   static var viewContext: NSManagedObjectContext {
           return container.viewContext
       }
       
    
    public  static  var container: NSPersistentContainer = {
            //5
            let messageKitBundle = Bundle(identifier: NotesLocalDataSource.identifier)
            let modelURL = messageKitBundle!.url(forResource: NotesLocalDataSource.model, withExtension: "momd")!
            let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
            
    // 6.
            let container = NSPersistentContainer(name: NotesLocalDataSource.model, managedObjectModel: managedObjectModel!)
            container.loadPersistentStores { (storeDescription, error) in
                
                if let err = error{
                    fatalError("❌ Loading of store failed:\(err)")
                }
            }
            
            return container
        }()




}
