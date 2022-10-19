//
//  ArticleView.swift
//  TestNewsApp
//
//  Created by HoSeon Chu on 2022/08/11.
//

import SwiftUI
import URLImage


struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            if let imgUrl = article.image,
               let url = URL(string: imgUrl) {
                URLImage(url: url,
                         options: URLImageOptions(
                            identifier: article.id.uuidString,
                            cachePolicy: .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.25)
                         ),
                         failure: { error, _ in
                    PlaceHolderImageView()
                },
                         content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                })
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            } else {
                PlaceHolderImageView()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N/A")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

struct PlaceHolderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
