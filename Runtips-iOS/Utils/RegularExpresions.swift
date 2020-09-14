//
//  RegularExpresions.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 13/09/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import Foundation

class RegularExpressions {
    static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
}

extension String {
    
    func matches(regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    var isValidMail: Bool {
        return matches(regex: RegularExpressions.email)
    }
}
