//
//  ViewController.swift
//  CatchtheKenny
//
//  Created by Nurşah on 15.11.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sayac: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var hScore: UILabel!
    @IBOutlet weak var kenny: UIImageView!
    var counter = 10
    var sayac2 = 0
    var gecici = 0
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 10
        sayac2 = 0
        // Do any additional setup after loading the view.
        kenny.isUserInteractionEnabled = true
        kenny.frame = CGRect(x: Int.random(in: 20..<200),y: Int.random(in: 20..<200),width: Int.random(in: 100..<200), height: Int.random(in: 100..<200))
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerChange), userInfo: nil, repeats: true)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapKenny))
        kenny.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func tapKenny(){
        sayac2 = sayac2 + 1
        score.text = String(sayac2)
        kenny.frame = CGRect(x: Int.random(in: 20..<200),y: Int.random(in: 20..<200),width: Int.random(in: 100..<200), height: Int.random(in: 100..<200))
    }
    @objc func timerChange(){
        sayac.text = String(counter)
                counter -= 1
                
                if counter == 0 {
                    timer.invalidate()
                    if gecici < sayac2{
                        gecici = sayac2
                        hScore.text = "Highscore : " + String(sayac2)
                    }
                    let alert = UIAlertController(title: "Ops!!", message: "Time is Over!", preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    alert.addAction(okButton)
                    let retryButton = UIAlertAction(title: "Retry", style: UIAlertAction.Style.default) { action in
                        self.retry()
                    }
                    alert.addAction(retryButton)
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
    }
    func retry(){
        viewDidLoad()
    }
}

