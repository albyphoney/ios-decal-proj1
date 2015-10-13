//
//  ToDo.swift
//  To Do List
//
//  Created by Audrey Phone on 10/5/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class ToDo {

    var task: String
    var done: Bool

    init(text: String) {
        self.task = text
        self.done = false
    }
}
