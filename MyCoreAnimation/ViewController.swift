//
//  ViewController.swift
//  MyCoreAnimation
//
//  Created by Mauldy Putra on 30/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func theAnimationTapped(_ sender: UIButton) {
        let vc = TheAnimationVC()
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func viewAnimatorTapped(_ sender: Any) {
        let vc = ViewAnimatorVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

