import Foundation
import RealmSwift
class Product:Object,Identifiable{
    @Persisted(primaryKey: true) var id:ObjectId
    @Persisted  var title:String
    @Persisted  var Description: String
    @Persisted  var price:Double
    @Persisted  var oldPrice:Double
    @Persisted  var imageurl:String
    @Persisted  var Category:String
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
