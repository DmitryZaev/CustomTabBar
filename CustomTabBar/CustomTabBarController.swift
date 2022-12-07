//
//  CustomTabBarController.swift
//  CustomTabBar
//
//  Created by Dmitry Victorovich on 19.11.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    let gradientCircleLayer = CAGradientLayer()
    let circleLayer = CAShapeLayer()
    let newCircleLayer = CAShapeLayer()
    var circlePath = UIBezierPath()
    let topY : CGFloat = 35
    let circleRadius : CGFloat = 20
    let smallRadius : CGFloat = 5
    var currentCenterOfCircle : CGPoint!
    
    let defaultAnimationTime : Double = 0.2
    var circleLenght : Double!
    var lastItemIndex = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()

        currentCenterOfCircle = CGPoint(x: tabBar.frame.width / 8,
                                        y: topY + smallRadius)
        circleLenght = 2 * CGFloat.pi * circleRadius
        
        configureGradientCircleLayer()
        configureTabBar()
        createCircle()
    }
    
    private func configureGradientCircleLayer() {
        gradientCircleLayer.colors = [UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.darkGray.cgColor]
        gradientCircleLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientCircleLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientCircleLayer.frame = CGRect(origin: tabBar.bounds.origin,
                                           size: CGSize(width: tabBar.bounds.width,
                                                        height: 70))
    }
    
    private func configureTabBar() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.darkGray.cgColor,
                                UIColor.lightGray.cgColor]
        gradientLayer.frame = CGRect(origin: CGPoint(x: tabBar.bounds.origin.x,
                                                     y: tabBar.bounds.origin.y + 35),
                                     size: CGSize(width: tabBar.bounds.width,
                                                  height: 48))
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        let shapeLayer = CAShapeLayer()
        
        let path = UIBezierPath()
        let bigRadius : CGFloat = 30
        
        path.move(to: CGPoint(x: tabBar.frame.minX,
                              y: tabBar.frame.maxY))
        path.addLine(to: CGPoint(x: tabBar.frame.minX,
                                 y: 0))
        path.addLine(to: CGPoint(x: tabBar.frame.width / 8 - bigRadius - smallRadius,
                                 y: 0))
        path.addArc(withCenter: CGPoint(x: tabBar.frame.width / 8 - bigRadius - smallRadius,
                                        y: smallRadius),
                    radius: smallRadius,
                    startAngle: 3 * CGFloat.pi / 2,
                    endAngle: 0,
                    clockwise: true)
        path.addArc(withCenter: CGPoint(x: tabBar.frame.width / 8,
                                        y: smallRadius),
                    radius: bigRadius,
                    startAngle: CGFloat.pi,
                    endAngle: 2 * CGFloat.pi,
                    clockwise: false)
        path.addArc(withCenter: CGPoint(x: tabBar.frame.width / 8 + bigRadius + smallRadius,
                                        y: smallRadius),
                    radius: smallRadius,
                    startAngle: CGFloat.pi,
                    endAngle: 3 * CGFloat.pi / 2,
                    clockwise: true)
        path.addLine(to: CGPoint(x: tabBar.frame.width / 8 * 3 - bigRadius - smallRadius,
                                 y: 0))
        path.addArc(withCenter: CGPoint(x: tabBar.frame.width / 8 * 3 - bigRadius - smallRadius,
                                        y: smallRadius),
                    radius: smallRadius,
                    startAngle: 3 * CGFloat.pi / 2,
                    endAngle: 0,
                    clockwise: true)
        path.addArc(withCenter: CGPoint(x: tabBar.frame.width / 8 * 3,
                                        y: smallRadius),
                    radius: bigRadius,
                    startAngle: CGFloat.pi,
                    endAngle: 2 * CGFloat.pi,
                    clockwise: false)
        path.addArc(withCenter: CGPoint(x: tabBar.frame.width / 8 * 3 + bigRadius + smallRadius,
                                        y: smallRadius),
                    radius: smallRadius,
                    startAngle: CGFloat.pi,
                    endAngle: 3 * CGFloat.pi / 2,
                    clockwise: true)
        path.addLine(to: CGPoint(x: tabBar.frame.width / 8 * 5 - bigRadius - smallRadius,
                                 y: 0))
        path.addArc(withCenter: CGPoint(x: tabBar.frame.width / 8 * 5 - bigRadius - smallRadius,
                                        y: smallRadius),
                    radius: smallRadius,
                    startAngle: 3 * CGFloat.pi / 2,
                    endAngle: 0,
                    clockwise: true)
        path.addArc(withCenter: CGPoint(x: tabBar.frame.width / 8 * 5,
                                        y: smallRadius),
                    radius: bigRadius,
                    startAngle: CGFloat.pi,
                    endAngle: 2 * CGFloat.pi,
                    clockwise: false)
        path.addArc(withCenter: CGPoint(x: tabBar.frame.width / 8 * 5 + bigRadius + smallRadius,
                                        y: smallRadius),
                    radius: smallRadius,
                    startAngle: CGFloat.pi,
                    endAngle: 3 * CGFloat.pi / 2,
                    clockwise: true)
        path.addLine(to: CGPoint(x: tabBar.frame.width / 8 * 7 - bigRadius - smallRadius,
                                 y: 0))
        path.addArc(withCenter: CGPoint(x: tabBar.frame.width / 8 * 7 - bigRadius - smallRadius,
                                        y: smallRadius),
                    radius: smallRadius,
                    startAngle: 3 * CGFloat.pi / 2,
                    endAngle: 0,
                    clockwise: true)
        path.addArc(withCenter: CGPoint(x: tabBar.frame.width / 8 * 7,
                                        y: smallRadius),
                    radius: bigRadius,
                    startAngle: CGFloat.pi,
                    endAngle: 2 * CGFloat.pi,
                    clockwise: false)
        path.addArc(withCenter: CGPoint(x: tabBar.frame.width / 8 * 7 + bigRadius + smallRadius,
                                        y: smallRadius),
                    radius: smallRadius,
                    startAngle: CGFloat.pi,
                    endAngle: 3 * CGFloat.pi / 2,
                    clockwise: true)
        
        path.addLine(to: CGPoint(x: tabBar.frame.maxX,
                                 y: 0))
        path.addLine(to: CGPoint(x: tabBar.frame.maxX,
                                 y: tabBar.frame.maxY))
        path.close()
        
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        
        gradientLayer.mask = shapeLayer
        tabBar.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func createCircle() {
        
        circlePath = UIBezierPath(ovalIn: CGRect(origin: CGPoint(x: currentCenterOfCircle.x - circleRadius,
                                                                 y: currentCenterOfCircle.y - circleRadius),
                                                 size: CGSize(width: circleRadius * 2,
                                                              height: circleRadius * 2)))
        
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = nil
        circleLayer.lineWidth = 15
        circleLayer.strokeColor = UIColor.white.cgColor
        circleLayer.lineCap = .round
        
        gradientCircleLayer.mask = circleLayer
        tabBar.layer.addSublayer(gradientCircleLayer)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        guard item.tag != lastItemIndex else { return }
        tabBar.isUserInteractionEnabled = false
        let newCenterOfCircle = CGPoint(x: tabBar.frame.width / 8 * CGFloat(item.tag * 2 - 1),
                                        y: topY + smallRadius)
        var newCirclePath = UIBezierPath()
        if item.tag > lastItemIndex {
            circlePath = UIBezierPath(arcCenter: currentCenterOfCircle,
                                      radius: circleRadius,
                                      startAngle: 3 * CGFloat.pi / 2,
                                      endAngle: 3 * CGFloat.pi / 2 + 2 * CGFloat.pi,
                                      clockwise: true)
            newCirclePath = UIBezierPath(arcCenter: newCenterOfCircle,
                                         radius: circleRadius,
                                         startAngle: 3 * CGFloat.pi / 2,
                                         endAngle: 3 * CGFloat.pi / 2 + 2 * CGFloat.pi,
                                         clockwise: true)
        } else {
            circlePath = UIBezierPath(arcCenter: currentCenterOfCircle,
                                      radius: circleRadius,
                                      startAngle: 3 * CGFloat.pi / 2 + 2 * CGFloat.pi,
                                      endAngle: 3 * CGFloat.pi / 2,
                                      clockwise: false)
            newCirclePath = UIBezierPath(arcCenter: newCenterOfCircle,
                                         radius: circleRadius,
                                         startAngle: 3 * CGFloat.pi / 2 + 2 * CGFloat.pi,
                                         endAngle: 3 * CGFloat.pi / 2,
                                         clockwise: false)
        }
        circleLayer.path = circlePath.cgPath
        
        currentCenterOfCircle = newCenterOfCircle
        
        newCircleLayer.strokeEnd = 0
        newCircleLayer.fillColor = nil
        newCircleLayer.lineWidth = 15
        newCircleLayer.strokeColor = UIColor.white.cgColor
        newCircleLayer.lineCap = .round
        
        let newPath = circlePath
        newPath.addLine(to: CGPoint(x: tabBar.frame.width / 8 * CGFloat(item.tag * 2 - 1),
                                    y: topY + smallRadius - circleRadius))
        newPath.append(newCirclePath)
        newCircleLayer.path = newPath.cgPath
        
        let newPathLineLenght : Double = Double(abs(item.tag - lastItemIndex)) * Double(tabBar.frame.width / 4)
        let newPathLineAnimationTime = newPathLineLenght * defaultAnimationTime / circleLenght
        let newCircleStrokeAnimationTime = defaultAnimationTime + newPathLineAnimationTime
        let newCircleStrokeEndValue = circleLenght / (2 * circleLenght + newPathLineLenght)
        let newCircleStrokeStartValue = (circleLenght + newPathLineLenght) / (2 * circleLenght + newPathLineLenght)
        newCircleLayer.strokeEnd = newCircleStrokeEndValue
        gradientCircleLayer.mask = newCircleLayer
        
        addAnimationWith(duration: newCircleStrokeAnimationTime,
                         for: "strokeEnd",
                         to: 1)
        DispatchQueue.main.asyncAfter(deadline: .now() + defaultAnimationTime) {
            self.addAnimationWith(duration: newPathLineAnimationTime,
                                  for: "strokeStart",
                                  to: newCircleStrokeStartValue)
        }

        lastItemIndex = item.tag
    }
    
    private func addAnimationWith(duration: Double, for keyPath: String, to value: CGFloat) {
        let animation = CABasicAnimation()
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.toValue = value
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = .both
        if keyPath == "strokeEnd" {
            animation.delegate = self
        }
        newCircleLayer.add(animation, forKey: keyPath)
    }
}

extension CustomTabBarController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        newCircleLayer.removeAllAnimations()
        createCircle()
        tabBar.isUserInteractionEnabled = true
    }
}
