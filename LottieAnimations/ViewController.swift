//
//  ViewController.swift
//  LottieAnimations
//
//  Created by James Rochabrun on 3/17/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    
    var menuOn = false
    var hamburguerButton: LAAnimationView?
    let hamburguerFrame = CGRect(x: 0, y: 10, width: 75, height: 75)

    override func viewDidLoad() {
        super.viewDidLoad()
        addHamburguerButton(on: menuOn)
    }
    
    func addHamburguerButton(on: Bool) {
        
        if hamburguerButton != nil {
            hamburguerButton?.removeFromSuperview()
            hamburguerButton = nil
        }
        
        let animation = on ? "hamburguer" : "twitter"
        hamburguerButton = LAAnimationView.animationNamed(animation)
        hamburguerButton?.isUserInteractionEnabled = true
        hamburguerButton?.frame = hamburguerFrame
        hamburguerButton?.contentMode = .scaleAspectFill
        
        addMenuToggleRecognizer()
        self.view.addSubview(hamburguerButton!)
        
    }
    
    func addMenuToggleRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.toggleMenu(recognizer:)))
        tap.numberOfTapsRequired = 1
        hamburguerButton?.addGestureRecognizer(tap)
        
    }
    
    func toggleMenu(recognizer: UITapGestureRecognizer) {
        
        if !menuOn {
            hamburguerButton?.play(completion: { (completion) in
                self.menuOn = true
                self.addHamburguerButton(on: self.menuOn)
            })
        } else {
            hamburguerButton?.play(completion: { (completion) in
                self.menuOn = false
                self.addHamburguerButton(on: self.menuOn)
            })
        }
    }

    ///LOCATION ICON STUFF


    @IBAction func showAnimation(_ sender: Any) {
        
        
        let animationView = LAAnimationView.animationNamed("lottielogo")
        animationView?.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 250)
        animationView?.contentMode = .scaleAspectFill
        animationView?.loopAnimation = true
        self.view.addSubview(animationView!)
        animationView?.play()
        
    }

}

