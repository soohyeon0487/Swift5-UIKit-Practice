//
//  CSStepper.swift
//  Chapter03-CSStepper
//
//  Created by Soohyeon Lee on 2021/01/10.
//

import UIKit

@IBDesignable
class CSStepper: UIControl {
    
    public var leftBtn = UIButton(type: .system)
    
    @IBInspectable
    public var leftTitle: String = "⬇" {
        didSet {
            self.leftBtn.setTitle(leftTitle, for: .normal)
        }
    }
    
    public var centerLabel = UILabel()
    
    @IBInspectable
    public var lblBackgroundColor: UIColor = UIColor.white {
        didSet {
            self.centerLabel.backgroundColor = lblBackgroundColor
        }
    }
    
    public var rightBtn = UIButton(type: .system)
    
    @IBInspectable
    public var rightTitle: String = "⬆" {
        didSet {
            self.rightBtn.setTitle(rightTitle, for: .normal)
        }
    }
    
    public var value: Int = 0 {
        didSet {
            self.centerLabel.text = String(value)
            
            self.sendActions(for: .valueChanged)
        }
    }
    
    @IBInspectable
    public var unit: Int = 1
    
    @IBInspectable
    public var minValue: Int = 0
    
    @IBInspectable
    public var maxValue: Int = 10
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)!
        self.setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    private func setup() {
        
        let borderWidth: CGFloat = 0.5
        let borderColor = UIColor.blue.cgColor
        
        self.leftBtn.tag = -1
        self.leftBtn.setTitle(self.leftTitle, for: .normal)
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        self.leftBtn.layer.borderWidth = borderWidth
        self.leftBtn.layer.borderColor = borderColor
        
        self.rightBtn.tag = 1
        self.rightBtn.setTitle(self.rightTitle, for: .normal)
        self.rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        self.rightBtn.layer.borderWidth = borderWidth
        self.rightBtn.layer.borderColor = borderColor
        
        self.centerLabel.text = String(value)
        self.centerLabel.font = UIFont.systemFont(ofSize: 16)
        self.centerLabel.textAlignment = .center
        self.centerLabel.backgroundColor = .cyan
        self.centerLabel.layer.borderWidth = borderWidth
        self.centerLabel.layer.borderColor = borderColor
        
        self.addSubview(leftBtn)
        self.addSubview(centerLabel)
        self.addSubview(rightBtn)
        
        self.leftBtn.addTarget(self, action: #selector(self.valueChanged(_:)), for: .touchUpInside)
        self.rightBtn.addTarget(self, action: #selector(self.valueChanged(_:)), for: .touchUpInside)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let btnWidth = self.frame.height
        let lblWidth = self.frame.width - (btnWidth * 2)
        
        self.leftBtn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth)
        self.centerLabel.frame = CGRect(x: btnWidth, y: 0, width: lblWidth, height: btnWidth)
        self.rightBtn.frame = CGRect(x: btnWidth + lblWidth, y: 0, width: btnWidth, height: btnWidth)
    }
    
    @objc func valueChanged(_ sender: UIButton) {
        
        let sum = self.value + (sender.tag * self.unit)
        
        if (sum > self.maxValue) || (sum < self.minValue) {
            return
        }
        
        self.value += (sender.tag * self.unit)
        
    }
}
