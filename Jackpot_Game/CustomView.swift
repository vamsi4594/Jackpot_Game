//
//  CustomView.swift
//  Jackpot_Game
//
//  Created by 123 on 06/09/20.
//  Copyright © 2020 vamsiOSDev. All rights reserved.
//

import UIKit

@IBDesignable

class CustomView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }

}
