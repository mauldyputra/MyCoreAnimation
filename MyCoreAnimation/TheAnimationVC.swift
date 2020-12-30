//
//  TheAnimationVC.swift
//  MyCoreAnimation
//
//  Created by Mauldy Putra on 30/12/20.
//

import UIKit
import TheAnimation

class TheAnimationVC: UIViewController {
    
    let layer = CALayer()
    let layer1 = CALayer()
    let layer2 = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        layer.backgroundColor = UIColor.systemRed.cgColor
        layer.frame = CGRect(x: 50, y: 250, width: 150, height: 150)
        
        layer1.backgroundColor = UIColor.systemTeal.cgColor
        layer1.frame = CGRect(x: 220, y: 250, width: 150, height: 150)
        
        layer2.backgroundColor = UIColor.systemOrange.cgColor
        layer2.frame = CGRect(x: 175, y: 500, width: 150, height: 150)
        
        view.layer.addSublayer(layer)
        view.layer.addSublayer(layer1)
        view.layer.addSublayer(layer2)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.move()
            self.opacity()
            self.rotate()
        }
    }
    
    func move() {
        let animation = BasicAnimation(keyPath: .position)
        animation.fromValue = CGPoint(x: layer.frame.origin.x + (layer.frame.size.width/2),
                                      y: layer.frame.origin.y + (layer.frame.size.height/2))
        animation.toValue = CGPoint(x: 175, y: 500)
        animation.duration = 1
        animation.timingFunction = .easeInEaseOut
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
    }
    
    func rotate() {
        let animation = BasicAnimation(keyPath: .transformRotationZ)
        animation.fromValue = 0
        animation.toValue = .pi * 12
        animation.duration = 3
        animation.timingFunction = .linear
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer1)
    }
    
    func opacity() {
        let animation = BasicAnimation(keyPath: .opacity)
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer2)
    }
}
