//
//  ShoppingRealmModel.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/08/22.
//

import Foundation
import RealmSwift

class ShoppingItem: Object {
    @Persisted var shoppingItemTitle: String
    @Persisted var shoppingCheck: Bool
    @Persisted var shoppingFavorite: Bool
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    convenience init(shoppingItemTitle: String) {
        self.init()
        
        self.shoppingItemTitle = shoppingItemTitle
        self.shoppingCheck = false
        self.shoppingFavorite = false
    }
}
