//
//  VACircularProgressView.swift
//  CircularProgressView
//
//  Created by Senthilkumar Kuppuraj on 08/03/22.
//

import UIKit

class VACircularProgressView: UIView {

    var progressLyr = CAShapeLayer()
    var trackLyr = CAShapeLayer()
    required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          makeCircularPath()
       }
    var progressClr = UIColor.white {
          didSet {
             progressLyr.strokeColor = progressClr.cgColor
          }
       }
    var trackClr = UIColor.white {
          didSet {
              trackLyr.strokeColor = trackClr.cgColor
          }
       }

    func addImage(imageName img: String) {
       let imageView = UIImageView()
       imageView.frame = CGRect(x: 45, y: 45, width: frame.size.width - 90, height: frame.size.height - 90)
       imageView.contentMode = .scaleAspectFit
       if let newImage = UIImage(named: img) {
          imageView.image = newImage
       }
       self.addSubview(imageView)
    }

    func makeCircularPath() {
          self.backgroundColor = UIColor.clear
          self.layer.cornerRadius = self.frame.size.width/2
          let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
          trackLyr.path = circlePath.cgPath
          trackLyr.fillColor = UIColor.clear.cgColor
          trackLyr.strokeColor = trackClr.cgColor
          trackLyr.lineWidth = 10.0
          trackLyr.strokeEnd = 1.0
          layer.addSublayer(trackLyr)
          progressLyr.path = circlePath.cgPath
          progressLyr.fillColor = UIColor.clear.cgColor
          progressLyr.strokeColor = progressClr.cgColor
          progressLyr.lineWidth = 10.0
          progressLyr.strokeEnd = 0.0
          layer.addSublayer(progressLyr)
       }

    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        progressLyr.strokeEnd = CGFloat(value)
        progressLyr.add(animation, forKey: "animateprogress")
     }

}
