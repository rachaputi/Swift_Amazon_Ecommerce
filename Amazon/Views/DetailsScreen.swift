import SwiftUI

struct DetailsScreen: View {
    var product:Product
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack(alignment:.leading) {
            header
            detailsbody
            Spacer()
        }
        .padding(10)
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .topLeading)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


extension DetailsScreen{
    var header:some View{
        HStack{
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
            }
            Spacer()
            Text("Details Screen")
            Spacer()
        }
        .frame(maxWidth:.infinity)
        .padding(.bottom,15)
    }
    var detailsbody:some View{
        VStack{
            Text(product.title)
                .font(.system(size: 18,weight: .bold))
            
            ImageView(productImage: product.imageurl)
                .frame(maxWidth:.infinity)
                .frame(height:300,alignment: .center)
            
            HStack{
                Text(String(format:"$ %.2f",product.price))
                    .font(.system(size: 20,weight:.bold))
                    .foregroundColor(Color.orange)
                Spacer()
                Text(product.Category)
            }.frame(maxWidth:.infinity,alignment: .leading)
                .padding(.vertical,20)
            
            Text(product.Description)
                .font(.system(size: 14,weight: .regular))
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
        }
    }
}
