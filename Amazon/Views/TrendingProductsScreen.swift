import SwiftUI

struct TrendingProductsScreen: View {
    @StateObject  var vm=HomeScreenViewModel()
    let Columns=[GridItem(.flexible()),GridItem(.flexible())]
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isGridView=true;
    var body: some View {
        VStack{
            if(vm.isLoading){
                LoadingIndicator()
            }
            else{
                VStack {
                    header
                    ScrollView(showsIndicators:false){
                        if(isGridView){
                            gridviewscreen
                        }
                        else{
                            TileViewScreen
                        }
                    }
                }
            }
        }
        .padding(.horizontal,10)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}


extension TrendingProductsScreen{
    var header:some View{
        HStack{
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
            }
            
            Text("Trending Products")
                .font(.system(size: 20,weight: .bold))
                .frame(maxWidth:.infinity)
            Button(action: {
                isGridView=false
            }, label: {
                Image(systemName: "rectangle.grid.2x2")
            })
            .foregroundColor(isGridView==false ?Color.orange:Color.black)
            
            Button(action: {
                isGridView=true
            }, label: {
                Image(systemName: "rectangle.grid.1x2")
            })
            .foregroundColor(isGridView==true ?Color.orange:Color.black)
        }
    }
    var gridviewscreen:some View{
        LazyVStack{
            ForEach(vm.TrendingProduct){product in
                NavigationLink(destination:DetailsScreen(product: product)){
                    ProductGridView(product: product)
                        .accentColor(Color.black)
                }
                
            }
        }
    }
    var TileViewScreen:some View{
        LazyVGrid(columns:Columns){
            ForEach(vm.TrendingProduct){product in
                NavigationLink(destination:DetailsScreen(product: product)){
                    ProductView(product: product)
                        .accentColor(Color.black)
                }
            }
        }
    }
}


struct TrendingProductsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TrendingProductsScreen()
    }
}

