//
//  ViewController.swift
//  Jackpot_Game
//
//  Created by 123 on 05/09/20.
//  Copyright © 2020 vamsiOSDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var creditsLabel: UILabel!
    @IBOutlet weak var spinButton: UIButton!
    
    @IBOutlet weak var imageView0: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    
    @IBOutlet weak var view0: CustomView!
    @IBOutlet weak var view1: CustomView!
    @IBOutlet weak var view2: CustomView!
    
    @IBOutlet weak var view3: CustomView!
    @IBOutlet weak var view4: CustomView!
    @IBOutlet weak var view5: CustomView!
    
    @IBOutlet weak var view6: CustomView!
    @IBOutlet weak var view7: CustomView!
    @IBOutlet weak var view8: CustomView!
    
    @IBOutlet var popupView: UIView!
    @IBOutlet weak var popupImageView: UIImageView!
    
    var credits = 1000
    let imageAssets = [UIImage(named: "apple"), UIImage(named: "cherry"), UIImage(named: "star")]
    var indexNumbers = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var imageViewSets = [UIImageView]()
    var viewSets = [CustomView]()
    var isWin = false
    var consecutiveWins = 0
    var consecutiveFails = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinButton.layer.cornerRadius = 20
        creditsLabel.text = "Credits: \(credits)"
        imageViewSets = [imageView0, imageView1, imageView2, imageView3, imageView4, imageView5, imageView6, imageView7, imageView8]
        viewSets = [view0, view1, view2, view3, view4, view5, view6, view7, view8]
    
    }

    @IBAction func onClickSpin(_ sender: UIButton)
    {
        isWin = false
        for view in viewSets{
            view.backgroundColor = .white
        }
        if credits > 0 {
            for i in 0...indexNumbers.count-1{
                indexNumbers[i] = Int.random(in: 0...imageAssets.count-1)
                imageViewSets[i].image = imageAssets[indexNumbers[i]]
            }
            checkWinningCombinations()
        }else{
            lowerCredits()
        }
        
    }
    
    func lowerCredits() {
        let alert = UIAlertController(title: "Lower Credits", message: "Your credits are zero. Buy the credits to continue playing...", preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "No,thanks!", style: .cancel, handler: nil)
        let alertAction2 = UIAlertAction(title: "Buy 500Credits", style: .default) { (_) in
            self.credits += 500
            self.creditsLabel.text = "Credits: \(self.credits)"
        }
        alert.addAction(alertAction)
        alert.addAction(alertAction2)
        present(alert, animated: true, completion: nil)
    }
    
    func checkWinningCombinations()
    {
        if indexNumbers[0] == indexNumbers[1] && indexNumbers[1] == indexNumbers[2] {
            isWin = true
            consecutiveWins += 1
            view0.backgroundColor = .red
            view1.backgroundColor = .red
            view2.backgroundColor = .red
            credits += 10
            creditsLabel.text = "Credits: \(credits)"
        }
        if indexNumbers[3] == indexNumbers[4] && indexNumbers[4] == indexNumbers[5] {
            isWin = true
            consecutiveWins += 1
            view3.backgroundColor = .red
            view4.backgroundColor = .red
            view5.backgroundColor = .red
            credits += 10
            creditsLabel.text = "Credits: \(credits)"
        }
        if indexNumbers[6] == indexNumbers[7] && indexNumbers[7] == indexNumbers[8] {
            isWin = true
            consecutiveWins += 1
            view6.backgroundColor = .red
            view7.backgroundColor = .red
            view8.backgroundColor = .red
            credits += 10
            creditsLabel.text = "Credits: \(credits)"
        }
        if indexNumbers[0] == indexNumbers[3] && indexNumbers[3] == indexNumbers[6] {
            isWin = true
            consecutiveWins += 1
            view0.backgroundColor = .red
            view3.backgroundColor = .red
            view6.backgroundColor = .red
            credits += 10
            creditsLabel.text = "Credits: \(credits)"
        }
        if indexNumbers[1] == indexNumbers[4] && indexNumbers[4] == indexNumbers[7] {
            isWin = true
            consecutiveWins += 1
            view4.backgroundColor = .red
            view1.backgroundColor = .red
            view7.backgroundColor = .red
            credits += 10
            creditsLabel.text = "Credits: \(credits)"
        }
        if indexNumbers[2] == indexNumbers[5] && indexNumbers[5] == indexNumbers[8] {
            isWin = true
            consecutiveWins += 1
            view2.backgroundColor = .red
            view5.backgroundColor = .red
            view8.backgroundColor = .red
            credits += 10
            creditsLabel.text = "Credits: \(credits)"
        }
        if indexNumbers[0] == indexNumbers[4] && indexNumbers[4] == indexNumbers[8] {
            isWin = true
            consecutiveWins += 1
            view0.backgroundColor = .red
            view4.backgroundColor = .red
            view8.backgroundColor = .red
            credits += 10
            creditsLabel.text = "Credits: \(credits)"
        }
        if indexNumbers[2] == indexNumbers[4] && indexNumbers[4] == indexNumbers[6] {
            isWin = true
            consecutiveWins += 1
            view4.backgroundColor = .red
            view6.backgroundColor = .red
            view2.backgroundColor = .red
            credits += 10
            creditsLabel.text = "Credits: \(credits)"
        }
        if !isWin{
            consecutiveFails += 1
            consecutiveWins = 0
            credits -= 10
            creditsLabel.text = "Credits: \(credits)"
        }
//        showPopup()
        
    }
    
    func showPopup(){
        if consecutiveWins >= 3 {
            view.alpha = 0.5
            view.addSubview(popupView)
            popupImageView.image = UIImage(named: "Awesome")
        }else{
            view.alpha = 1.0
            popupView.removeFromSuperview()
        }
        if consecutiveFails >= 3{
            view.alpha = 0.5
            view.addSubview(popupView)
            popupImageView.image = UIImage(named: "FAIL")
        }else{
            view.alpha = 1.0
            popupView.removeFromSuperview()
        }
    }
    
}


