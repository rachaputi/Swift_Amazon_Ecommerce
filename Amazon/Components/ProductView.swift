import SwiftUI

struct ProductView: View {
    let product:Product;
    var body: some View {
        VStack(alignment:.leading,spacing: 5){
            AsyncImage(url: URL(string: product.imageurl)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .padding(.vertical,5)
            .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .center)
            Text(product.title)
                .font(.system(size: 16,weight: .bold))
                .padding(.top,5)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            Text(product.Category)
                .font(.system(size: 14,weight: .regular))
            Spacer()
            HStack(spacing:15){
                Text(String(format:"$ %.2f",product.price))
                    .font(.system(size: 14,weight: .bold))
                Text(String(format:"$ %.2f",product.oldPrice))
                    .font(.system(size: 14,weight: .bold))
                    .strikethrough()
                    .foregroundColor(Color.orange)
            }.frame(maxWidth:.infinity,alignment: .leading)
            
        }
        .padding(10)
        .frame(maxWidth:200)
        .frame(height:260,alignment: .topLeading)
        .border(Color.gray,width: 1)
        .cornerRadius(5)
    }
}

//struct ProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductView()
//    }
//}
