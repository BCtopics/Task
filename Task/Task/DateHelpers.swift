//
//  DateHelpers.swift
//  Task
//
//  Created by Bradley GIlmore on 5/31/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

func stringValue() -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    
    return formatter.string(from: self)
}
