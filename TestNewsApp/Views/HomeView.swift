//
//  HomeView.swift
//  TestNewsApp
//
//  Created by HoSeon Chu on 2022/08/11.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            case .success(let articles):
                NavigationView {
                    List(articles) { item in
                        ArticleView(article: item).onTapGesture {
                            load(url: item.url)
                        }
                    }
                    .navigationTitle(Text("News"))
                }
            }
        }
        .onAppear(perform: viewModel.getArticles)
    }
    
    //인웹뷰 뛰운다.
    func load(url: String?) {
        guard let link = url,
              let url = URL(string: link) else { return }
        
        openUrl(url)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
