//
//  LoadingIndicator.swift
//  Amazon
import SwiftUI

struct LoadingIndicator: View {
    var body: some View {
        VStack(spacing:10){
            ProgressView()
                .frame(width:50,height: 50)
            Text("Loading")
                .font(.system(size: 20,weight: .bold))
        }.frame(maxWidth:.infinity,maxHeight:.infinity)
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
