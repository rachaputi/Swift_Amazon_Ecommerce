import SwiftUI

struct SlideView: View {
    @State var SelectedTab=0
    var body: some View {
        TabView(selection:self.$SelectedTab ){
            ForEach(1...5,id:\.self){ index in
                Image("banner\(index)")
                    .resizable()
                    .frame(height:200)
                    .cornerRadius(10)
                    .scaledToFit()
                    .padding(.horizontal,10)
                    .tag(index)
            }
        }
        .frame(height:200)
        .padding(.top,10)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        SlideView()
    }
}
