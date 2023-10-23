//
//  ColorsTableViewController.swift
//  RandomColors
//
//  Created by Nasir on 24/10/2023.
//

import UIKit

class ColorsTableViewController: UIViewController {
    
    var colors : [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()

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
