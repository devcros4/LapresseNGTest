//
//  FilterViewController.swift
//  NGTest
//

import UIKit

class FilterViewController: UITableViewController {
    
    // MARK: - properties
    private var channelNames = Array(ArticlesViewModel.channelNames)
    var selectedChannelNames: [String] = []
    var articlesViewController: ArticlesViewController?
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.channelNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = channelNames[indexPath.row]
        cell.accessoryView = selectedChannelNames.contains(channelNames[indexPath.row]) ? UIImageView(image: UIImage(named: "starfill")) : UIImageView(image: UIImage(named: "star"))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedChannelNames.contains(channelNames[indexPath.row]) {
            self.tableView.cellForRow(at: indexPath)?.accessoryView = UIImageView(image: UIImage(named: "star"))
        } else {
            selectedChannelNames.append(channelNames[indexPath.row])
            self.tableView.cellForRow(at: indexPath)?.accessoryView = UIImageView(image: UIImage(named: "starfill"))
            
        }
    }
    
    // MARK: Action
    @IBAction func actionDone(_ sender: UIBarButtonItem) {
        self.articlesViewController?.articleViewModel.filterChannelNames = selectedChannelNames
        self.articlesViewController?.tableView.reloadData()
        self.navigationController?.popViewController(animated: true)
    }
}
