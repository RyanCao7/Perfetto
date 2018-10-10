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

/*
 * TODOs:
 * Create a profile ViewController and .xib file
 * Figure out how to create constructor for OrderViewController
 * Figure out how to do a pull-up button from the bottom
 * Later - figure out how to integrate Apple Maps to show the current location of the driver
 * Figure out background stuff
 */

class ViewController: UIViewController {
    
    @IBOutlet weak var perfettoLogo: UIImageView!
    
    @IBOutlet weak var mainTitle: UILabel!
    
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var referralButton: UIButton!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    @IBOutlet weak var buttonThree: UIButton!
    
    @IBOutlet weak var progressButton: UIButton!
    
    @IBAction func orderSupreme(_ sender: UIButton) {
        showSupremeDialog()
    }
    
    @IBAction func orderMargherita(_ sender: UIButton) {
        showMargheritaDialog()
    }
    
    @IBAction func orderMeat(_ sender: UIButton) {
        showMeatDialog()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cornerRadius = CGFloat(35)
        let borderWidth = CGFloat(7)
        
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "heart_pizza_background.jpg")!)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "heart_pizza_background.jpg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        // Uncomment the below for the pizza background
//        self.view.insertSubview(backgroundImage, at: 0)
        
        let margheritaBackground = UIImageView(frame: buttonOne.bounds)
        margheritaBackground.image = UIImage(named: "margherita_button.jpg")
        margheritaBackground.contentMode = .center
        
        let meatBackground = UIImageView(frame: buttonTwo.bounds)
        meatBackground.image = UIImage(named: "meat_button.jpg")
        meatBackground.contentMode = .center
        
        let supremeBackground = UIImageView(frame: buttonThree.bounds)
        supremeBackground.image = UIImage(named: "combo_button.jpg")
        supremeBackground.contentMode = .center
        
        // Gets backgrounds for all the buttons, and gives the text some space.
        buttonOne.contentEdgeInsets = UIEdgeInsetsMake(CGFloat(10), CGFloat(10), CGFloat(10), CGFloat(10))
//        buttonOne.backgroundRect(forBounds: CGRect(x: CGFloat(20), y: CGFloat(0), width: CGFloat(30), height: CGFloat(30)))
        buttonOne.setBackgroundImage(margheritaBackground.image, for: UIControlState.normal)
        buttonOne.backgroundColor = .clear
        buttonOne.layer.cornerRadius = cornerRadius
        buttonOne.layer.borderWidth = borderWidth
        buttonOne.layer.borderColor = UIColor.white.cgColor
        buttonOne.clipsToBounds = true
        
        buttonTwo.contentEdgeInsets = UIEdgeInsetsMake(CGFloat(10), CGFloat(10), CGFloat(10), CGFloat(10))
        buttonTwo.setBackgroundImage(meatBackground.image, for: UIControlState.normal)
        buttonTwo.backgroundColor = .clear
        buttonTwo.layer.cornerRadius = cornerRadius
        buttonTwo.layer.borderWidth = borderWidth
        buttonTwo.layer.borderColor = UIColor.white.cgColor
        buttonTwo.clipsToBounds = true
        
        buttonThree.contentEdgeInsets = UIEdgeInsetsMake(CGFloat(10), CGFloat(10), CGFloat(10), CGFloat(10))
        buttonThree.setBackgroundImage(supremeBackground.image, for: UIControlState.normal)
        buttonThree.backgroundColor = .clear
        buttonThree.layer.cornerRadius = cornerRadius
        buttonThree.layer.borderWidth = borderWidth
        buttonThree.layer.borderColor = UIColor.white.cgColor
        buttonThree.clipsToBounds = true
        
        // ==============================================================
        // Setting constraint layout stuff
        let screenHeight = Double(view.bounds.height)
        let screenWidth = Double(view.bounds.width)
        
        // Relative content sizes for space, logo, space, Perfetto, bottom button

        let contentWidths = [
            "logo": CGFloat(0.2 * screenWidth),
            "title": CGFloat(0.6 * screenWidth),
            "buttons": CGFloat(0.7 * screenWidth),
            "progress": CGFloat(screenWidth)
        ]

        let contentHeights = [
            "logo": contentWidths["logo"]!,
            "title": 0.4 * contentWidths["title"]!,
            "buttons": 0.34 * contentWidths["buttons"]!,
            "progress": 0.2 * contentWidths["progress"]!
        ]
        
        for (_, val) in contentWidths {
            print(val)
        }
        
        print(" --------------------------------------------------------------------------------------------------- ")
        
        for (_, val) in contentHeights {
            print(val)
        }

        // Sets content sizes
        perfettoLogo.heightAnchor.constraint(equalToConstant: contentHeights["logo"]!).isActive = true
        perfettoLogo.widthAnchor.constraint(equalToConstant: contentWidths["logo"]!).isActive = true
        mainTitle.widthAnchor.constraint(equalToConstant: contentWidths["title"]!).isActive = true
        mainTitle.widthAnchor.constraint(equalToConstant: contentWidths["title"]!).isActive = true
        buttonOne.heightAnchor.constraint(equalToConstant: contentHeights["buttons"]!).isActive = true
        buttonOne.widthAnchor.constraint(equalToConstant: contentWidths["buttons"]!).isActive = true
        buttonTwo.heightAnchor.constraint(equalToConstant: contentHeights["buttons"]!).isActive = true
        buttonTwo.widthAnchor.constraint(equalToConstant: contentWidths["buttons"]!).isActive = true
        buttonThree.heightAnchor.constraint(equalToConstant: contentHeights["buttons"]!).isActive = true
        buttonThree.widthAnchor.constraint(equalToConstant: contentWidths["buttons"]!).isActive = true
        progressButton.heightAnchor.constraint(equalToConstant: contentHeights["progress"]!).isActive = true
        progressButton.widthAnchor.constraint(equalToConstant: contentWidths["progress"]!).isActive = true
        
        // Finds out spacing
        var totalContentHeight = 0.0
        for (name, px) in contentHeights {
            totalContentHeight += Double(px)
            if name == "buttons" {
                totalContentHeight += 2 * Double(px)
            }
        }
        print("Total content height, screenheight:", totalContentHeight, screenHeight)
        let totalRemainingHeight = screenHeight - totalContentHeight
        print("total remaining height:", totalRemainingHeight)
        
        
        // Vertical spacing for everything
        let spaces = [
            "logoTop": CGFloat(0.35 * totalRemainingHeight),
            "titleTop": CGFloat(0.03 * totalRemainingHeight),
            "margheritaButtonTop": CGFloat(0.18 * totalRemainingHeight),
            "meatButtonTop": CGFloat(0.15 * totalRemainingHeight),
            "comboButtonTop": CGFloat(0.15 * totalRemainingHeight),
        ]
        
        
        
        print(" --------------------------------------------------------------------------------------------------- ")
        
        var totalSpaceHeight = 0.0
        for (_, val) in spaces {
            totalSpaceHeight += Double(val)
        }
        print("total space height:", totalSpaceHeight)
        
        perfettoLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: spaces["logoTop"]!).isActive = true
        mainTitle.topAnchor.constraint(equalTo: perfettoLogo.bottomAnchor, constant: spaces["titleTop"]!).isActive = true
        buttonOne.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: spaces["margheritaButtonTop"]!).isActive = true
        buttonTwo.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: spaces["meatButtonTop"]!).isActive = true
        buttonThree.topAnchor.constraint(equalTo: buttonTwo.bottomAnchor, constant: spaces["comboButtonTop"]!).isActive = true
        progressButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // ==============================================================
        
        let profileImage = UIImage(named: "profile_icon.png")
        profileButton.setBackgroundImage(profileImage, for: UIControlState.normal)
        profileButton.backgroundColor = .clear
        let referralImage = UIImage(named: "referral_icon.png")
        referralButton.setBackgroundImage(referralImage, for: UIControlState.normal)
        referralButton.backgroundColor = .clear
    }
    
    func showMargheritaDialog(animated: Bool = true) {
        
        // Create a custom view controller
        let ratingVC = MargheritaViewController()
        
        // Create the dialog
        let popup = PopupDialog(viewController: ratingVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        
        // Create first button
        let buttonOne = DestructiveButton(title: "CANCEL", height: 60) {
            print("You canceled the image dialog")
        }
        
        // Create second button
        let buttonTwo = DefaultButton(title: "ORDER", height: 60) {
            // Pass
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        present(popup, animated: animated, completion: nil)
    }
    
    func showSupremeDialog(animated: Bool = true) {
        
        // Create a custom view controller
        let ratingVC = SupremeViewController()
        
        // Create the dialog
        let popup = PopupDialog(viewController: ratingVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        
        // Create first button
        let buttonOne = DestructiveButton(title: "CANCEL", height: 60) {
            print("You canceled the image dialog")
        }
        
        // Create second button
        let buttonTwo = DefaultButton(title: "ORDER", height: 60) {
            // Pass
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        present(popup, animated: animated, completion: nil)
    }
    
    func showMeatDialog(animated: Bool = true) {
        
        // Create a custom view controller
        let ratingVC = MeatViewController()
        
        // Create the dialog
        let popup = PopupDialog(viewController: ratingVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        
        // Create first button
        let buttonOne = DestructiveButton(title: "CANCEL", height: 60) {
            print("You canceled the image dialog")
        }
        
        // Create second button
        let buttonTwo = DefaultButton(title: "ORDER", height: 60) {
            // Pass
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        present(popup, animated: animated, completion: nil)
    }
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
