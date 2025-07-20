//
//  ContentView.swift
//  FetchImageApi
//
//  Created by Rachit Sharma on 20/07/2025.
//

import SwiftUI
struct ContentView: View {
    @StateObject var imageService = ImageService()
    var body: some View {
        VStack {
      if let image = imageService.image {
                image
              .resizable()
              .frame(width: 300, height: 300)
              .clipShape(.rect(cornerRadius: 10))
          
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
