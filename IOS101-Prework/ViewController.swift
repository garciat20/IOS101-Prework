//
//  ViewController.swift
//  IOS101-Prework
//
//  Created by Thomas on 1/19/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelOne: UILabel!
    
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var labelThree: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        let randomColor: UIColor = changeColor()
        // color thats returned, let's pass it into a function
        // that changes the text based on the background color with formula given for luminence
        view.backgroundColor = randomColor

        let res: UIColor = changeTextColor(newColor: randomColor)

        labelOne.textColor = res
        labelTwo.textColor = res
        labelThree.textColor = res
    }
    
    func changeColor() -> UIColor{
        
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    func changeTextColor(newColor: UIColor) -> UIColor {
        
        // calculate luminance
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        newColor.getRed(&red, green: &green, blue: &blue, alpha: nil)

        let luminance = 0.2126 * Double(red) + 0.7152 * Double(green) + 0.0722 * Double(blue)
        
        // return black or white color that will have most contrast with background color
        let textColor: UIColor = luminance > 0.5 ? UIColor.black : UIColor.white
        
        return textColor
    
    }
}

