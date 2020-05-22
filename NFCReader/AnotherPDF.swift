//
//  AnotherPDF.swift
//  NFCReader
//
//  Created by JohnConnor on 2020/5/22.
//  Copyright © 2020 JohnConnor. All rights reserved.
//

import UIKit
import PDFKit


//
//class MyViewController : UIViewController, PDFViewDelegate, VCDelegate {
//    var pdfView: PDFView?
//    var touchView: AnnotateView?
//    override func loadView() {
//        touchView = AnnotateView(frame: CGRect(x: 0, y: 0, width: 375, height: 600))
//        touchView?.backgroundColor = .clear
//        touchView?.delegate = self
//        view.addSubview(touchView!) }
//    func addAnnotation(_ annotation: PDFAnnotation) {
//        print("Anotation added")
//        pdfView?.document?.page(at: 0)?.addAnnotation(annotation)
//            
//    }
//    
//}
//class AnnotateView: UIView {
//    var path: UIBezierPath?
//    var delegate: VCDelegate?
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {     // Initialize a new path for the user gesture
//        path = UIBezierPath()
//        path?.lineWidth = 4.0
//        var touch: UITouch = touches.first!
//        path?.move(to: touch.location(in: self)) }
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {      //Add new points to the path
//        let touch: UITouch = touches.first!
//        path?.addLine(to: touch.location(in: self))
//        self.setNeedsDisplay() }
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {      let touch = touches.first
//        path?.addLine(to: touch!.location(in: self))
//        self.setNeedsDisplay()
//        let annotation = PDFAnnotation(bounds: self.bounds, forType: .ink, withProperties: nil)
//        annotation.add(self.path!)
//        delegate?.addAnnotation(annotation)
//        
//    }
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.touchesEnded(touches, with: event)
//        
//    }
//    override func draw(_ rect: CGRect) {     // Draw the path
//            path?.stroke()
//        
//    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.isMultipleTouchEnabled = false
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
