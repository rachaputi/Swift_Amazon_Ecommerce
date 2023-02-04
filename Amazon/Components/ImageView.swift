import SwiftUI
struct ImageView: View {
    var productImage:String
    var body: some View {
        AsyncImage(url: URL(string:productImage)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
                .frame(maxWidth:.infinity)
                .frame(height:300)
        }
    }
}
