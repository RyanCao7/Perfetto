//
//  ViewController.swift
//  Perfetto
//
//  Created by Ryan Cao on 9/6/18.
//  Copyright © 2018 Perfetto!. All rights reserved.
//

import UIKit
import CoreGraphics.CGContext
import PopupDialog

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTitle: UILabel!
    
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var referralButton: UIButton!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    @IBOutlet weak var buttonThree: UIButton!
    
    @IBAction func orderMargherita(_ sender: UIButton) {
        showImageDialog()
    }
    
    @IBAction func orderMeat(_ sender: UIButton) {
        showCustomDialog()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "heart_pizza_background.jpg")!)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "heart_pizza_background.jpg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        // Gets backgrounds for all the buttons, and gives the text some space.
        buttonOne.contentEdgeInsets = UIEdgeInsetsMake(CGFloat(10), CGFloat(10), CGFloat(10), CGFloat(10))
//        buttonOne.backgroundRect(forBounds: CGRect(x: CGFloat(20), y: CGFloat(0), width: CGFloat(30), height: CGFloat(30)))
        buttonOne.setBackgroundImage(backgroundImage.image, for: UIControlState.normal)
        buttonOne.backgroundColor = .clear
        buttonOne.layer.cornerRadius = 20
        buttonOne.layer.borderWidth = 5
        buttonOne.layer.borderColor = UIColor.white.cgColor
        buttonOne.clipsToBounds = true
        
        buttonTwo.contentEdgeInsets = UIEdgeInsetsMake(CGFloat(10), CGFloat(10), CGFloat(10), CGFloat(10))
        buttonTwo.setBackgroundImage(backgroundImage.image, for: UIControlState.normal)
        buttonTwo.backgroundColor = .clear
        buttonTwo.layer.cornerRadius = 20
        buttonTwo.layer.borderWidth = 5
        buttonTwo.layer.borderColor = UIColor.white.cgColor
        buttonTwo.clipsToBounds = true
        
        buttonThree.contentEdgeInsets = UIEdgeInsetsMake(CGFloat(10), CGFloat(10), CGFloat(10), CGFloat(10))
        buttonThree.setBackgroundImage(backgroundImage.image, for: UIControlState.normal)
        buttonThree.backgroundColor = .clear
        buttonThree.layer.cornerRadius = 20
        buttonThree.layer.borderWidth = 5
        buttonThree.layer.borderColor = UIColor.white.cgColor
        buttonThree.clipsToBounds = true
        
        let profileImage = UIImage(named: "profile_icon.png")
        profileButton.setBackgroundImage(profileImage, for: UIControlState.normal)
        profileButton.backgroundColor = .clear
        let referralImage = UIImage(named: "referral_icon.png")
        referralButton.setBackgroundImage(referralImage, for: UIControlState.normal)
        referralButton.backgroundColor = .clear
        
    }
    
    // Default dialog with picture and text, with three buttons (cancel, shake, order)
    func showImageDialog(animated: Bool = true) {
        
        // Prepare the popup assets
        let title = "Margherita Pizza"
        let message = "Classic Margherita pizza! Ingredients: Love, love, and more love! <3"
        let image = UIImage(named: "space_background.jpg")
        
        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image, preferredWidth: 580)
        
        // Create first button
        let buttonOne = DestructiveButton(title: "Not hungry...") {
            // pass
        }
        
        // Create fourth (shake) button
        let buttonTwo = DefaultButton(title: "Fun button shake!", dismissOnTap: false) {
            [weak popup] in popup?.shake()
        }
        
        // Create second button
        let buttonThree = DefaultButton(title: "Order now!") {
            // pass
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        
        // Present dialog
        self.present(popup, animated: animated, completion: nil)
    }
    
    func showCustomDialog(animated: Bool = true) {
        
        // Create a custom view controller
        let ratingVC = RatingViewController()
        // Create the dialog
        let popup = PopupDialog(viewController: ratingVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        
        // Create first button
        let buttonOne = DestructiveButton(title: "CANCEL", height: 60) {
            // Pass
        }
        
        // Create second button
        let buttonTwo = DefaultButton(title: "RATE", height: 60) {
            // Pass
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        present(popup, animated: animated, completion: nil)
    }
    
}

class RatingViewController: UIViewController {
    
}

// Adds an extension to the base integer class.
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else { // if self == 0
            return 0
        }
    }
}

//@IBDesignable extension UIButton {
//
//    @IBInspectable var borderWidth: CGFloat {
//        set {
//            layer.borderWidth = newValue
//        }
//        get {
//            return layer.borderWidth
//        }
//    }
//
//    @IBInspectable var cornerRadius: CGFloat {
//        set {
//            layer.cornerRadius = newValue
//        }
//        get {
//            return layer.cornerRadius
//        }
//    }
//
//    @IBInspectable var borderColor: UIColor? {
//        set {
//            guard let uiColor = newValue else { return }
//            layer.borderColor = uiColor.cgColor
//        }
//        get {
//            guard let color = layer.borderColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//    }
//}
//@IBDesignable class MyButton: UIButton
//{
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        updateCornerRadius()
//    }
//
//    @IBInspectable var rounded: Bool = false {
//        didSet {
//            updateCornerRadius()
//        }
//    }
//
//    func updateCornerRadius() {
//        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
//    }
//}
