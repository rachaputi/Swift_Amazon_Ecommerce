import Foundation
import RealmSwift

@MainActor
class HomeScreenViewModel:ObservableObject{
    @Published var SaleProducts:[Product]=[]
    @Published var TrendingProduct:[Product]=[]
    @Published var isLoading=false
    @Published var AllProducts:[Product]=[]
    
    init()
    {
      fetchProducts()
    }
    
    func fetchProducts() {
        do{
            isLoading=true
            let realm = try Realm()
            let results=realm.objects(Product.self)
            self.AllProducts=results.compactMap({(product)-> Product? in
                return product
            })
            self.SaleProducts=Array(self.AllProducts.prefix(upTo: 5))
            self.TrendingProduct=Array(self.AllProducts.suffix(from: 5));
            isLoading=false
        }
        catch let error as NSError
        {
          print(error)
        }
    }
}
