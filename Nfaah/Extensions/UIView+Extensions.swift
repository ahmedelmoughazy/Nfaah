//
//  UIView+Extensions.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func loadViewFromNib() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillChange(_:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
    }
    
    @objc
    func keyboardWillChange(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
            else { return }
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey]
            as? UInt
            else { return }
        guard let begginingFrame = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey]
            as? NSValue)?.cgRectValue
            else { return }
        guard let endFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
            as? NSValue)?.cgRectValue
            else { return }
        let deltaY = endFrame.origin.y - begginingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration,
                                delay: 0.0,
                                options: UIView.KeyframeAnimationOptions(rawValue: curve),
                                animations: {
                                    self.frame.origin.y += deltaY
        }, completion: nil)
    }
    func removeKeyBoardNotify() {
        NotificationCenter.default.removeObserver(self)
    }
}

extension UIButton {
    func setupView(with text: String, textColor: UIColor, font: UIFont) {
        setTitle(text, for: .normal)
        setTitleColor(textColor, for: .normal)
        titleLabel?.font = font
    }
}

extension UILabel {
    func set(text: String?, with color: UIColor?, and font: UIFont?, in fullText: String?) {
        guard let fullString = fullText,
            let stringColor = color,
            let string = text,
            let textFont = font else { return }
        let attributedString = NSMutableAttributedString(string: fullString)
        let range = (fullString as NSString).range(of: string)
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: stringColor,
                                        NSAttributedString.Key.font: textFont],
                                       range: range)
        self.attributedText = attributedString
        
    }
}
