//
//  ImageViewModel.swift
//  FetchImageApi
//
//  Created by Rachit Sharma on 21/07/2025.
//

import Foundation
import SwiftUI
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
