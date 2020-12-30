//
//  ViewAnimatorVC.swift
//  MyCoreAnimation
//
//  Created by Mauldy Putra on 30/12/20.
//

import UIKit
import ViewAnimator

class ViewAnimatorVC: UIViewController {
    
    let myTable = UITableView()
    
    let data = ["Back", "Zoom", "Move", "Rotate", "Opacity","Random"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myTable)
        myTable.frame = view.bounds
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTable.delegate = self
        myTable.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //        let animation = AnimationType.zoom(scale: 2)
        //        UIView.animate(views: myTable.visibleCells, animations: [animation])
    }
}

class ZoomVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let myView = UIView(frame: CGRect(x: 150, y: 150, width: 150, height: 150))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemTeal
        
        myView.animate(animations: [AnimationType.zoom(scale: -2)], duration: 2)
    }
}

class MoveVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let myView = UIView(frame: CGRect(x: 150, y: 150, width: 150, height: 150))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemTeal
        
        myView.animate(animations: [AnimationType.vector(CGVector(dx: 100, dy: 100))], duration: 2, usingSpringWithDamping: 4, initialSpringVelocity: 4)
    }
}

class RotateVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let myView = UIView(frame: CGRect(x: 150, y: 150, width: 150, height: 150))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemTeal
        
        myView.animate(animations: [AnimationType.rotate(angle: .pi/12)], duration: 2)
    }
}

class OpacityVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let myView = UIView(frame: CGRect(x: 150, y: 150, width: 150, height: 150))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemTeal
        
        myView.animate(animations: [AnimationType.rotate(angle: .pi/5)], initialAlpha: 1, finalAlpha: 0, delay: 2, duration: 2)
    }
}

class RandomVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let myView = UIView(frame: CGRect(x: 150, y: 150, width: 150, height: 150))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemTeal
        
        myView.animate(animations: [AnimationType.random()], duration: 2)
    }
}

extension ViewAnimatorVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        
        if indexPath.row == 0 {
            cell.backgroundColor = .white
        } else if indexPath.row == 1 {
            cell.backgroundColor = .systemRed
        } else if indexPath.row == 2 {
            cell.backgroundColor = .systemGreen
        } else if indexPath.row == 3 {
            cell.backgroundColor = .systemBlue
        } else if indexPath.row == 4 {
            cell.backgroundColor = .systemTeal
        } else {
            cell.backgroundColor = .systemYellow
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            self.dismiss(animated: true, completion: nil)
        } else if indexPath.row == 1 {
            let vc = ZoomVC()
            present(vc, animated: true, completion: nil)
        } else if indexPath.row == 2 {
            let vc = MoveVC()
            present(vc, animated: true, completion: nil)
        } else if indexPath.row == 3 {
            let vc = RotateVC()
            present(vc, animated: true, completion: nil)
        } else if indexPath.row == 4 {
            let vc = OpacityVC()
            present(vc, animated: true, completion: nil)
        } else {
            let vc = RandomVC()
            present(vc, animated: true, completion: nil)
        }
    }
}
