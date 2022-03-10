//
//  ViewController.swift
//  CircularProgressView
//
//  Created by Senthilkumar Kuppuraj on 08/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: VACircularProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        progressView.trackClr = trackColor
        progressView.progressClr = progressColor
        progressView.setProgressWithAnimation(duration: 1.0, value: 0.25)
        progressView.addImage(imageName: "VAC")


    }


}

