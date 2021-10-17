//
//  AppContainer.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 14.10.2021.
//

import Foundation
let appContainer = AppContainer()

class AppContainer {
    let service = CoreDataManager()
    let router = AppRouter()
}
