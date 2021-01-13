//
//  CSButton.swift
//  Chapter03-CSButton
//
//  Created by Soohyeon Lee on 2021/01/10.
//

import UIKit

public enum CSButtonType {
    case rect
    case circle
}

class CSButton: UIButton {
    
    var style: CSButtonType = .rect {
        didSet {
            switch style {
            case .rect:
                self.backgroundColor = .black
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 0
                self.setTitleColor(.white, for: .normal)
                self.setTitle("Rect Button", for: .normal)
            case .circle:
                self.backgroundColor = .red
                self.layer.borderColor = UIColor.blue.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 50
                self.setTitleColor(.white, for: .normal)
                self.setTitle("Circle Button", for: .normal)
            }
        }
    }
    
    // StoryBoard용 init
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.backgroundColor = .green
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("StoryBoard", for: .normal)
    }
    
    // 하드코딩용 init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .gray
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("Code", for: .normal)
    }
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    convenience init(type: CSButtonType) {
        self.init()
        
        switch type {
        case .rect:
            self.backgroundColor = .black
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 0
            self.setTitleColor(.white, for: .normal)
            self.setTitle("Rect Button", for: .normal)
        case .circle:
            self.backgroundColor = .red
            self.layer.borderColor = UIColor.blue.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 50
            self.setTitleColor(.white, for: .normal)
            self.setTitle("Circle Button", for: .normal)
        }
        
        self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
    }
    
    @objc func counting(_ sender: UIButton) {
        sender.tag += 1
        sender.setTitle("\(sender.tag) 클릭", for: .normal)
    }
}
