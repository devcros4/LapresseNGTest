//
//  ArticleCell.swift
//  NGTest

import UIKit

class ArticleCell: UITableViewCell {
    // MARK: - static properties
    static let identifier = "ArticleCell"

    // MARK: - Outlets
    @IBOutlet weak var visualImageView: UIImageView!
    @IBOutlet weak var publicationDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(article: Article) {
        self.titleLabel.text = "[\(article.channelName)] \(article.title)"
        self.publicationDateLabel.text = article.publicationDate.formatToString(using: DateFormatter.formatAffichage)
        self.visualImageView.download(imageUrl: article.visual.first?.urlPattern)
    }

}
