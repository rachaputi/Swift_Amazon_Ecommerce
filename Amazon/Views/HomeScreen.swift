import SwiftUI
import RealmSwift

struct HomeScreen: View {
    @StateObject  var vm=HomeScreenViewModel()
    let Rows=[GridItem(.flexible())]
    var body: some View {
        NavigationView {
            VStack{
                if(vm.isLoading){
                    LoadingIndicator()
                }
                else{
                    VStack{
                        Text("Amazon")
                            .font(.system(size: 20,weight: .bold))
                            .frame(maxWidth:.infinity)
                            .foregroundColor(Color.orange)
                        
                        ScrollView(showsIndicators:false){
                            SlideView()
                            SaleView
                            TrendingView
                        }
                        
                    }
                    .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .topLeading)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

extension HomeScreen{
    var SaleView:some View{
        VStack(spacing:5){
            HStack(){
                VStack(alignment:.leading,spacing: 10){
                    Text("Sale")
                        .font(.system(size: 18,weight: .bold))
                    Text("Festival Season Sale")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                }.frame(maxWidth:.infinity,alignment: .topLeading)
                
                NavigationLink(destination: {
                    FestivalSaleProducts()
                }, label: {
                    Text("VIEW ALL")
                        .font(.system(size: 14))
                        .foregroundColor(Color.red)
                })
                
            }
            ScrollView(.horizontal){
                LazyHGrid(rows: Rows,spacing: 10){
                    ForEach(vm.SaleProducts,id:\.id){ item in
                        NavigationLink(destination:DetailsScreen(product: item)){
                            ProductView(product: item)
                                .accentColor(Color.black)
                        }
                    }
                }
            }.frame(height:280)
        }.padding(.horizontal,10)
    }
    var TrendingView:some View{
        VStack(spacing:5){
            HStack(){
                VStack(alignment:.leading,spacing: 10){
                    Text("Trending")
                        .font(.system(size: 18,weight: .bold))
                    Text("You Have never Seen it before")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                }.frame(maxWidth:.infinity,alignment: .topLeading)
                NavigationLink(destination: {
                    TrendingProductsScreen()
                }, label: {
                    Text("VIEW ALL")
                        .font(.system(size: 14))
                        .foregroundColor(Color.red)
                })
            }
            ScrollView(.horizontal){
                LazyHGrid(rows: Rows,spacing: 10){
                    ForEach(vm.TrendingProduct){ item in
                        NavigationLink(destination:DetailsScreen(product: item)){
                            ProductView(product: item)
                                .accentColor(Color.black)
                        }
                    }
                }
            }.frame(height:280)
        }.padding(.horizontal,10)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeScreen()
        }
    }
}

