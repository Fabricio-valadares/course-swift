//
//  Task.swift
//  todolist
//
//  Created by FL00027 on 19/03/22.
//

import Foundation

struct Tarefa {
    var id: UUID
    var description: String
    var create_at: Data
    var update_at: Data
    var done: Bool
}
