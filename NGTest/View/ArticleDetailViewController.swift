//
//  ArticleDetailViewController.swift
//  NGTest
//
import UIKit

class ArticleDetailViewController: UIViewController {
    // MARK: - properties
    var article: Article?

    // MARK: - Outlets
    @IBOutlet weak var leadTextView: UITextView!
    @IBOutlet weak var publicationDateLabel: UILabel!
    @IBOutlet weak var visualImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.leadTextView.text = self.article?.lead
        self.publicationDateLabel.text = self.article?.publicationDate.formatToString(using: DateFormatter.formatAffichage)
        self.visualImageView.download(imageUrl: self.article?.visual.first?.urlPattern)
        self.titleLabel.text = self.article?.title
      
    }
    

  
}
