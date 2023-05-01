//  Created on 30/04/2023.

import SwiftUI
import Combine

struct ImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    
    var imageUrl: URL
    
    var body: some View {
        VStack {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                // Placeholder while loading image
                ProgressView()
            }
        }.onAppear {
            imageLoader.load(url: imageUrl)
        }
    }
    
    init(url: URL) {
        self.imageUrl = url
    }
}

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    private var cancellable: AnyCancellable?
    private static let imageCache = NSCache<NSURL, UIImage>()

    func load(url: URL) {
        
        // Check if the image is already in the cache
        if let cachedImage = ImageLoader.imageCache.object(forKey: url as NSURL) {
                    self.image = cachedImage
                    return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                    if let image = image {
                    // Store the image in the cache
                    ImageLoader.imageCache.setObject(image, forKey: url as NSURL)
                    self?.image = image
                }
            }
    }
}
