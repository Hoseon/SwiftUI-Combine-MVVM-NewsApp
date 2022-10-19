//
//  NewsViewModel.swift
//  TestNewsApp
//
//  Created by HoSeon Chu on 2022/08/11.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
}

class NewViewModelImpl: ObservableObject, NewsViewModel {
    
    private let service: NewsService
    
    private(set) var articles = [Article]() //private(set) 클래스내에서 보호 받고는 싶지만 외부에서도 접근이 가능하도록
    private var cacellables = Set<AnyCancellable>() //DisposeBag
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews) //뉴스 URL 요청
            .sink { res in // 콤바인 Sink 사용
                switch res {
                case .finished:
                    self.state = .success(content: self.articles)
                    break
                case .failure(let error):
                    self.state = .failed(error: error)
                    break
                }
            } receiveValue: { (response) in
                self.articles = response.articles
            }
        
        self.cacellables.insert(cancellable) //RxSwift에서 DisposableBag과 동일함
        
    }
}
