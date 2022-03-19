//
//  ManagedObjectContext.swift
//  todolist
//
//  Created by FL00027 on 19/03/22.
//

import Foundation
import UIKit
import CoreData

typealias onCompletionHandler = (String) -> Void

protocol managedProtocol {
    func getTarefas() -> [Tarefa]
}

protocol managedSaveProtocol {
    func save(tarefa: Tarefa,
              onCompletionHandler: onCompletionHandler)
}

protocol managedDeleteProtocol {
    func delete(uuid: String,
                onCompletionHandler: onCompletionHandler)
}

class ManagedObjectContext: managedProtocol, managedSaveProtocol, managedDeleteProtocol {
    
    private let entity = "TarefaData"
    
    static var shared: ManagedObjectContext = {
        let instance = ManagedObjectContext()
        return instance
    }()
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    func getTarefas() -> [Tarefa] {
        var listTarefas: [Tarefa] = []
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        
        do {
            guard let tarefas = try getContext().fetch(fetchRequest) as? [NSManagedObject] else { return listTarefas }
            
            for item in tarefas {
                if let id = item.value(forKey: "id") as? UUID,
                   let description = item.value(forKey: "description") as? String,
                   let create_at = item.value(forKey: "create_at") as? Data,
                   let update_at = item.value(forKey: "update_at") as? Data,
                   let done = item.value(forKey: "done") as? Bool {
                    let tarefa = Tarefa(id: id, description: description, create_at: create_at, update_at: update_at, done: done)
                    listTarefas.append(tarefa)
                }
                
            }
        } catch let error as NSError {
            print("Error in request \(error.localizedDescription)")
        }
        
        return listTarefas
    }
    
    func save(tarefa: Tarefa, onCompletionHandler: (String) -> Void) {
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: entity, in: context) else { return }
        let transaction = NSManagedObject(entity: entity, insertInto: context)
        transaction.setValue(tarefa.id, forKey: "id")
        transaction.setValue(tarefa.description, forKey: "description")
        transaction.setValue(tarefa.create_at, forKey: "create_at")
        transaction.setValue(tarefa.update_at, forKey: "update_at")
        transaction.setValue(tarefa.update_at, forKey: "done")
        do {
            try context.save()
            onCompletionHandler("Save Sucess")
        } catch let error as NSError {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    func delete(uuid: String, onCompletionHandler: (String) -> Void) {
        let context = getContext()
        let predicate = NSPredicate(format: "id == %@", "\(uuid)")
        let fethRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        fethRequest.predicate = predicate
        do {
            let fetchResults = try context.fetch(fethRequest) as! [NSManagedObject]
            if let entityDelete = fetchResults.first {
                context.delete(entityDelete)
            }
            try context.save()
            onCompletionHandler("Delete Sucess")
        } catch let error as NSError {
            print("Fatch failed \(error.localizedDescription)")
        }
    }
    
    
    
}

