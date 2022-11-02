//
//  ArticlesViewController.swift
//  NGTest

import UIKit

class ArticlesViewController: UITableViewController {
    
    // MARK: - properties
    var articleViewModel = ArticlesViewModel()
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Action
    @IBAction func ActionSortByDate(_ sender: UIBarButtonItem) {
        self.articleViewModel.isAscending.toggle()
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleViewModel.sortArticles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as? ArticleCell else {
            fatalError("Failed to get expected kind of reusable cell from the tableView. Expected type `ArticleCell`")
        }
        cell.configure(article: articleViewModel.sortArticles[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ArticleDetailViewController") as? ArticleDetailViewController
        vc?.article = articleViewModel.sortArticles[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FilterViewController {
            vc.articlesViewController = self
            vc.selectedChannelNames = self.articleViewModel.filterChannelNames
        }
    }
}

