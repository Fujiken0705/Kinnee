//
//  menustruct.swift
//  Kinnee
//
//  Created by KentoFujita on 2023/03/10.
//

import Foundation
import RealmSwift

class Menudata: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name:String? = nil
    @objc dynamic var rep:String? = nil
    @objc dynamic var set:String? = nil

    override static func primaryKey() -> String? {
        return "id"
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

