//
//  ViewController.swift
//  myChart1
//
//  Created by user on 2020/7/26.
//

import UIKit
//var view = UIView()
class ViewController: UIViewController {

    @IBOutlet weak var lineWidth: UITextField!
    @IBOutlet weak var radius: UITextField!
    @IBOutlet weak var percentage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var whiteView: UIView!
    func circleRatio(lineWidth1: CGFloat, colorRed: CGFloat, colorGreen: CGFloat, colorBlue: CGFloat,radius1: CGFloat, percentage1: CGFloat){
        let aDegree = CGFloat.pi / 180
        //let lineWidth: CGFloat = 10
        //let radius: CGFloat = 50
        let startDegree: CGFloat = 270
        let circlePath = UIBezierPath(ovalIn: CGRect(x: lineWidth1, y: lineWidth1, width: radius1*2, height: radius1*2))
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.gray.cgColor
        circleLayer.lineWidth = lineWidth1
        circleLayer.fillColor = UIColor.clear.cgColor
        //let percentage: CGFloat = 60
        let percentagePath = UIBezierPath(arcCenter: CGPoint(x: lineWidth1 + radius1, y: lineWidth1 + radius1), radius: radius1, startAngle: aDegree * startDegree, endAngle: aDegree * (startDegree + 360 * percentage1 / 100), clockwise: true)
        let percentageLayer = CAShapeLayer()
        percentageLayer.path = percentagePath.cgPath
        percentageLayer.strokeColor  = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1).cgColor
        percentageLayer.lineWidth = lineWidth1
        percentageLayer.fillColor = UIColor.clear.cgColor
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 2*(radius1+lineWidth1), height: 2*(radius1+lineWidth1)))
        label.textAlignment = .center
        label.text = "\(percentage1)%"
        
        whiteView.layer.addSublayer(circleLayer)
        whiteView.layer.addSublayer(percentageLayer)
        whiteView.addSubview(label)
    }
    
    @IBAction func draw(_ sender: Any) {
        let lineWidth1 = Double (lineWidth.text!)!
        let raduis1 = Double(radius.text!)!
        let percentage1 = Double(percentage.text!)!
        circleRatio(lineWidth1: CGFloat(lineWidth1), colorRed: 0.8, colorGreen: 0.4, colorBlue: 0.4, radius1: CGFloat(raduis1), percentage1: CGFloat(percentage1))
    }
    
}

