//
//  ArticlesViewModel.swift
//  NGTest
//

import Foundation

class ArticlesViewModel {
    // MARK: - properties
    var articles: [Article] = []
    static var channelNames: Set<String> = []
    var isAscending = false
    var filterChannelNames: [String] = []
    
    // MARK: - computed properties
    var sortArticles: [Article] {
        return sortArticlesByDate(articles: filterByChannelNames())
    }
    
    // MARK: - init
    init() {
        guard let path = Bundle.main.path(forResource: "articles", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            JsonDecoderService().decode(of: [Article].self, from: data) { [weak self] result in
                switch result {
                case .success(let newArticles):
                    self?.articles = newArticles
                case .failure(let error):
                    print(error)
                }
            }
        } catch {
            print(error)
        }
    }
    
    // sort articles by date asc or desc
    private func sortArticlesByDate(articles: [Article]) -> [Article] {
        return articles.sorted(by: { self.isAscending ? $0.publicationDate < $1.publicationDate : $0.publicationDate > $1.publicationDate })
    }
    
    // filter all articles by channelnammes
    private func filterByChannelNames() -> [Article] {
        if filterChannelNames.isEmpty {
            return articles
        } else {
            var filterArticles: [Article] = []
            for article in articles {
                if filterChannelNames.contains(article.channelName) {
                    filterArticles.append(article)
                }
            }
            return filterArticles
        }
        
    }
}
