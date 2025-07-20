//
//  ContentView.swift
//  FetchImageApi
//
//  Created by Rachit Sharma on 20/07/2025.
//

import SwiftUI

class serviceimage{
    func fetchimage()async throws -> UIImage{
        let urlstring = "https://picsum.photos/200"
        guard let url = URL(string: urlstring)else{
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
      guard let image = UIImage(data: data)else{
            throw URLError(.badURL)}
        return image
        
        
    }
}

class ImageService: ObservableObject {
    @Published var image : Image?
    let imageservice = serviceimage()
    init(){
        Task{
            await fetchimage()
        }
    }
    func fetchimage() async {
        do{
            let image = try await imageservice.fetchimage()
            self.image = Image(uiImage: image)
        }catch {
            print(error)
        }
    }
}


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
