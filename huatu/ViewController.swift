//
//  ViewController.swift
//  huatu
//
//  Created by Hey on 16/11/25.
//  Copyright © 2016年 Hey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        
        let cgview = CGView(frame: CGRect(x: 30, y: 30, width: self.view.bounds.size.width-80, height: 250))
        self.view.addSubview(cgview)
        
        let yuanhu = Yuanhu(frame: CGRect(x: 30, y: 30, width: self.view.bounds.size.width, height: 250))
        self.view.addSubview(yuanhu)
        
        let beisaier = BeisaiEr(frame: CGRect(x: 30, y: 30, width: self.view.bounds.size.width-80, height: 250))
        self.view.addSubview(beisaier)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class CGView: UIView {
    
//    重写
    override init(frame: CGRect){
        super.init(frame: frame)
//        设背景色
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
//        是否存在绘图上下文
        let contex = UIGraphicsGetCurrentContext()
        guard ((contex) != nil) else {
            return
        }
        
//        创建矩形，边内缩3
        let drawingRect = self.bounds.insetBy(dx: 3, dy: 3)
//        创建设置路径
        let path = CGMutablePath()
        path.move(to: CGPoint(x: drawingRect.minX, y: drawingRect.minY))
        path.addLine(to: CGPoint(x: drawingRect.maxX, y: drawingRect.minY))
        path.addLine(to: CGPoint(x: drawingRect.maxX, y: drawingRect.maxY))
//        添加路径到图形上下文
        contex?.addPath(path)
//        笔触颜色和宽度
        contex?.setStrokeColor(UIColor.red.cgColor)
        
        contex?.setLineWidth(6)
        
//        绘制端点 .butt-不绘制端点 .round-绘制圆形端点 .square
        contex?.setLineCap(.butt)
        
//        连接点样式.mitre：锐角斜切（默认值）.round：圆头.bevel：平头斜切
        contex?.setLineJoin(.round)
        
//        设置阴影的偏移量、模糊度和颜色
        contex?.setShadow(offset: CGSize(width:3,height:3), blur: 0.6, color: UIColor.lightGray.cgColor)
        
//        虚线的长度和间隔
        let lengths:[CGFloat] = [15,4]
//        设置虚线样式
        contex?.setLineDash(phase: 0, lengths: lengths)
        
        
//        开始绘制路径
        contex?.strokePath()
        
        
    }
}

class Yuanhu: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        guard (context != nil) else {
            return
        }
        
        let drawingRect = self.bounds.insetBy(dx: 3, dy: 3)
        
        let path = CGMutablePath()
        
//        圆弧半径
        let radius = min(drawingRect.width, drawingRect.height)/2
//        圆心
        let center = CGPoint(x: drawingRect.midX, y: drawingRect.midY)
//        绘制圆弧
        path.addArc(center: center, radius: radius, startAngle: 0, endAngle: CGFloat.pi*1.5, clockwise: false)
        
        context?.addPath(path)
        
        context?.setStrokeColor(UIColor.orange.cgColor)
        
        context?.setLineWidth(6)
        
        context?.strokePath()
        
    }
    
    
}


class BeisaiEr: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        guard (context != nil) else {
            return
        }
        
        let drawingRect = self.bounds.insetBy(dx: 3, dy: 3)
        
//        let path = CGMutablePath()
////        移动起点
//        path.move(to: CGPoint(x: drawingRect.minX, y: drawingRect.maxY))
////        二次贝塞尔曲线终点
//        let toPoint = CGPoint(x: drawingRect.maxX, y: drawingRect.maxY)
////        二次贝塞尔曲线控制点
//        let controlPoint = CGPoint(x: drawingRect.midX, y: drawingRect.minY)
////        绘制二次贝塞尔曲线
//        path.addQuadCurve(to: toPoint, control: controlPoint)
        
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: drawingRect.minX, y: drawingRect.maxY))
        
        
        
        context?.addPath(path)
        context?.setStrokeColor(UIColor.green.cgColor)
        context?.setLineWidth(6)
        
        context?.strokePath()
        
    }

}








