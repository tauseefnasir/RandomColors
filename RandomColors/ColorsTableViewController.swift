//
//  ColorsTableViewController.swift
//  RandomColors
//
//  Created by Nasir on 24/10/2023.
//

import UIKit

class ColorsTableViewController: UIViewController {
    
    var colors : [UIColor] = []
    let refreshControl = UIRefreshControl()
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
        
        // Add the refresh control to the table view
                tableView.refreshControl = refreshControl
                
                // Configure the refresh control action
                refreshControl.addTarget(self, action: #selector(refreshColors), for: .valueChanged)

        // Do any additional setup after loading the view.
    }
    
    func addRandomColors() {
        for _ in 1...50 {
            colors.append(.random())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailViewController
        destVC.color = sender as? UIColor
    }
    
    @objc func refreshColors() {
           // Clear the existing colors
           colors.removeAll()
           
           // Generate new random colors
           addRandomColors()
           
           // Reload the table view
           tableView.reloadData()
           
           // End the refreshing state
           refreshControl.endRefreshing()
       }

}

extension ColorsTableViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: "ToColorsDetailViewController", sender: color)
    }
}
