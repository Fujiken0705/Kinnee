//
//  menustruct.swift
//  Kinnee
//
//  Created by KentoFujita on 2023/03/10.
//

import Foundation
import RealmSwift

class Profile: Object {
    @objc dynamic var name = ""
    @objc dynamic var rep = ""
    @objc dynamic var set = ""

    override static func primaryKey() -> String? {
        return "name"
    }
}


//struct menuitem {
//    private(set) public var name : String
//    private(set) public var rep : Int
//    private(set) public var set : Int
//
//    init(name : String ,rep : Int , set : Int ) {
//        self.name = name
//        self.rep = rep
//        self.set = set
//    }
//}

