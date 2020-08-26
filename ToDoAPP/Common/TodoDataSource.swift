//
//  TodoDataSource.swift
//  ToDoAPP
//
//  Created by aluno on 11/08/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import Foundation

final class TodoDataSource {
    
    static let shared = TodoDataSource()
    
    private init() {}
    
    var todos: [TodoModel] = [
        /*TodoModel(type: .onPriority, todoDescription: "Today we rock!!!", date: Date()),
        TodoModel(type: .daily, todoDescription: "We daily rock!!!", date: Date()),
        TodoModel(type: .home, todoDescription: "We Rock at Home!!!", date: Date())*/
    ]
    
}
