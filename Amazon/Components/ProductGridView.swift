import SwiftUI

struct ProductGridView: View {
    let product:Product
    var body: some View {
        HStack(spacing:0){
            AsyncImage(url: URL(string: product.imageurl)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .padding(.vertical,5)
            .frame(maxWidth:UIScreen.main.bounds.width/2)
            .frame(maxHeight:.infinity)
            
            VStack(alignment:.leading,spacing: 20){
                Text(product.title)
                    .font(.system(size: 16,weight: .bold))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Text(product.Category)
                    .font(.system(size: 14,weight: .regular))
                HStack(spacing:15){
                    Text(String(format:"$ %.2f",product.price))
                        .font(.system(size: 14,weight: .bold))
                    Text(String(format:"$ %.2f",product.oldPrice))
                        .font(.system(size: 14,weight: .bold))
                        .strikethrough()
                        .foregroundColor(Color.orange)
                }.frame(maxWidth:.infinity,alignment: .leading)
            }
            .frame(maxWidth:.infinity, maxHeight:.infinity)
        }
        .frame(maxWidth:.infinity)
        .frame(height:130,alignment: .leading)
        .border(Color.gray)
        .cornerRadius(5)
    }
}

