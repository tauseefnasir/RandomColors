//
//  ColorsDetailViewController.swift
//  RandomColors
//
//  Created by Nasir on 24/10/2023.
//

import UIKit

class ColorsDetailViewController: UIViewController {

    @IBOutlet var copyColorButton: UIButton!
    var color : UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .blue
        updateButtonTitleWithColorCode()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func copyColorButtonTapped(_ sender: UIButton) {
        if let colorCode = copyColorButton.titleLabel?.text {
                    // Create a pasteboard and set the color code
                    let pasteboard = UIPasteboard.general
                    pasteboard.string = colorCode
                    
                    // Provide some feedback that the code is copied (e.g., a toast message)
//                    let alert = UIAlertController(title: "Copied", message: "Color code copied to clipboard", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    present(alert, animated: true, completion: nil)
            
            let alert = UIAlertController(title: "Copied", message: "Color code copied to clipboard", preferredStyle: .alert)
                       present(alert, animated: true, completion: nil)
                       
                       // Set a timer to automatically dismiss the alert after a certain duration (e.g., 2 seconds)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                           alert.dismiss(animated: true, completion: nil)
                       }
                }
    }
    
    func colorToHex(color: UIColor) -> String {
           if let components = color.cgColor.components {
               let red = components[0]
               let green = components[1]
               let blue = components[2]
               return String(format: "#%02X%02X%02X", Int(red * 255), Int(green * 255), Int(blue * 255))
           }
           return ""
       }
    
    func updateButtonTitleWithColorCode() {
            if let color = color {
                let colorCode = colorToHex(color: color)
                copyColorButton.setTitle(colorCode, for: .normal)
            }
        }

}
