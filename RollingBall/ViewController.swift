//
//  ViewController.swift
//  RollingBall
//
//  Created by DangCan on 5/17/16.
//  Copyright © 2016 TuNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ball = UIImageView()
    var timer = Timer()
    var radians = CGFloat()
    var ballRadious = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        
        
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(rollBall), userInfo: nil, repeats: true)
    }
    
    func addBall()
    {
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadious = 32.0
        ball.center = CGPoint(x: ballRadious, y: mainViewSize.height * 0.5)
        self.view.addSubview(ball)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func rollBall()
    {
        var deltaAngle: CGFloat = 0.1
            radians = radians + deltaAngle
            ball.transform = CGAffineTransform(rotationAngle: radians)
            self.ball.center = CGPoint(x: self.ball.center.x + self.ballRadious * deltaAngle, y: self.ball.center.y)
    
        if ( self.ball.center == CGPoint(x: self.view.bounds.size.width - 32, y: self.view.bounds.size.height * 0.5))
        {
            radians = radians - deltaAngle
            self.ball.center = CGPoint(x: self.ball.center.x - self.ballRadious * deltaAngle, y: self.ball.center.y)
        }
}
    
}





    


