import SwiftUI

struct FestivalSaleProducts: View {
    @StateObject  var vm=HomeScreenViewModel()
    let Columns=[GridItem(.flexible()),GridItem(.flexible())]
    @State var isGridView=true;
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
                            gridview
                        }
                        else{
                            TileView
                        }
                    }
                }
            }
        }
        .padding(.horizontal,10)
        .navigationBarHidden(true)
    }
}



extension FestivalSaleProducts{
    var header:some View{
        HStack(){
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
            }
            .padding(.leading, 10)
            .frame(width: 40, height: 40)
            Text("Festival sale Products")
                .font(.system(size: 20,weight: .bold))
                .frame(maxWidth:.infinity)
            
            Spacer()
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
            
        }.frame(alignment:.leading)
    }
    var gridview:some View{
        LazyVStack{
            ForEach(vm.SaleProducts){product in
                NavigationLink(destination:DetailsScreen(product: product)){
                    ProductGridView(product: product)
                        .accentColor(Color.black)
                }
            }
        }
    }
    var TileView:some View{
        LazyVGrid(columns:Columns){
            ForEach(vm.SaleProducts){product in
                NavigationLink(destination:DetailsScreen(product: product)){
                    ProductView(product: product)
                        .accentColor(Color.black)
                }
            }
        }
    }
}

struct FestivalSaleProducts_Previews: PreviewProvider {
    static var previews: some View {
        FestivalSaleProducts()
    }
}
