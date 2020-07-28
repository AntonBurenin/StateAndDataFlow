//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Combine
import Foundation

final class UserManager: ObservableObject {
    @Published var isRegister = UserDefaults.standard.value(forKey: "isRegister") as? Bool ?? false
    @Published var name = UserDefaults.standard.value(forKey: "username") as? String ?? ""
    
    init(){}
    
    init(name: String) {
        self.name = name
    }
}
