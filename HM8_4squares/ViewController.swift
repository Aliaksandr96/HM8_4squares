//
//  ViewController.swift
//  HM8_4squares
//
//  Created by Aliaksandr Hunko on 10/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let mainSquare = UIView()
    let squareOne = UIView()
    let squareTwo = UIView()
    let squareThree = UIView()
    let squareFour = UIView()
    let resetSquare = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        
        // Main Square
        
        mainSquare.frame = CGRect(x: 0, y: 0, width: 220, height: 220)
        mainSquare.backgroundColor = .systemCyan
        mainSquare.center = view.center
        view.addSubview(mainSquare)
        
        // Create Square 1
        
        squareOne.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        squareOne.backgroundColor = .systemRed
        mainSquare.addSubview(squareOne)
        
        // Create Square 2
        
        squareTwo.frame = CGRect(x: 120, y: 0, width: 100, height: 100)
        squareTwo.backgroundColor = .systemGreen
        mainSquare.addSubview(squareTwo)
        
        // Create Square 3
        
        squareThree.frame = CGRect(x: 0, y: 120, width: 100, height: 100)
        squareThree.backgroundColor = .systemBlue
        mainSquare.addSubview(squareThree)
        
        // Create Square 4
        
        squareFour.frame = CGRect(x: 120, y: 120, width: 100, height: 100)
        squareFour.backgroundColor = .systemYellow
        mainSquare.addSubview(squareFour)
        
        // Create Reset Square Btn
        
        let widthBtn = view.frame.width / 4
        let heightBtn = view.frame.height / 14
        let xBtn = (view.frame.width / 2) - (widthBtn / 2)
        let yBtn = view.frame.maxY - (view.frame.height / 8)
        resetSquare.frame = CGRect(x: xBtn, y: yBtn, width: widthBtn, height: heightBtn)
        resetSquare.backgroundColor = .systemOrange
        resetSquare.setTitle("Reset", for: .normal)
        resetSquare.addTarget(self, action: #selector(resetSquares), for: .touchUpInside)
        view.addSubview(resetSquare)
        
        // Gesture
        
        let moveSquareOne = UIPanGestureRecognizer(target:self, action: #selector(moveSquare))
        mainSquare.addGestureRecognizer(moveSquareOne)
        
        let removeSquareOne = UITapGestureRecognizer(target: self, action: #selector(didtap))
        removeSquareOne.numberOfTapsRequired = 2
        mainSquare.addGestureRecognizer(removeSquareOne)
        
    }
    
    @objc func moveSquare(recognizer: UIPanGestureRecognizer) {
        
        if recognizer.state == .changed {
            
            let translation = recognizer.translation(in: self.view)
            
            let xSquareOne = mainSquare.center.x + translation.x
            let ySquareOne = mainSquare.center.y + translation.y
            mainSquare.center = CGPoint(x: xSquareOne, y: ySquareOne)
            
            recognizer.setTranslation(CGPoint.zero, in: self.mainSquare)
            
        }
    }
    
    @objc func didtap(_ gesture: UITapGestureRecognizer) {
        
        mainSquare.isHidden = true
    
    }
    
    @objc func resetSquares() {
        
        mainSquare.frame = CGRect(x: 0, y: 0, width: 220, height: 220)
        mainSquare.center = view.center
        mainSquare.backgroundColor = .systemCyan
        view.addSubview(mainSquare)
        
        mainSquare.isHidden = false
        
    }
}
