//
//  FYNotification.swift
//  Pods
//
//  Created by 薛焱 on 2016/12/29.
//
//

import UIKit

@objc enum FYNotificationStatus: Int {
    case success
    case error
    case warning
    case other
}

class FYNotification: UIView {
    
    private static let notificationView = FYNotification(frame: CGRect(x: 0, y: -64, width: UIScreen.main.bounds.width, height: 100))
    
    @IBOutlet weak private var statusImg: UIImageView!
    @IBOutlet weak private var messageLab: UILabel!
    @IBOutlet weak var imgWidthMargin: NSLayoutConstraint!
    @IBOutlet var oneView: UIView!
    
    private var timer: Timer?
    private let animateDuration: TimeInterval = 0.25
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        oneView = UINib(nibName: "FYNotificationView", bundle: Bundle(for: self.classForCoder)).instantiate(withOwner: self, options: nil).last as! UIView
        oneView.frame = self.bounds
        self.addSubview(oneView)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func configure(backgroundColor: UIColor, textColor:UIColor, fontSize: CGFloat) {
        notificationView.configureNotificationView(backgroundColor: backgroundColor, textColor: textColor, fontSize: fontSize)
    }
    
    class func show(status: FYNotificationStatus, message: String, duration: TimeInterval) {
        notificationView.fyShowNotification(status: status, message: message, duration: duration)
    }
    
    class func dismiss() {
        notificationView.dismissNotification()
    }
    
    private func configureNotificationView(backgroundColor: UIColor, textColor:UIColor, fontSize: CGFloat) {
        oneView.backgroundColor = backgroundColor
        messageLab.textColor = textColor
        messageLab.font = UIFont.systemFont(ofSize: fontSize)
    }
    
    private func fyShowNotification(status: FYNotificationStatus, message: String, duration: TimeInterval) {
        if timer != nil {
            dismissNotification()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + animateDuration, execute: {
                self.showNotificationView(status: status, message: message, duration: duration)
            })
        } else {
            showNotificationView(status: status, message: message, duration: duration)
        }
    }
    
    @objc private func showNotificationView(status: FYNotificationStatus, message: String, duration: TimeInterval) {
        let window = UIApplication.shared.keyWindow
        window?.addSubview(FYNotification.notificationView)
        messageLab.text = message
        switch status {
        case .success:
            statusImg.image = UIImage(named: "success")
        case .warning:
            statusImg.image = UIImage(named: "warning")
        case .error:
            statusImg.image = UIImage(named: "error")
        case .other:
            imgWidthMargin.constant = 0
            messageLab.font = UIFont.systemFont(ofSize: 15)
        }
        let animation = CAKeyframeAnimation(keyPath: "position.y")
        animation.values = [-50, 14, 20, 22, 20, 14]
        animation.duration = animateDuration
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        FYNotification.notificationView.layer.add(animation, forKey: "showAnimation")
        timer = Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(dismissNotification), userInfo: nil, repeats: false)
    }
    
    @objc private func dismissNotification() {
        let animation = CAKeyframeAnimation(keyPath: "position.y")
        animation.values = [14, -50]
        animation.duration = animateDuration - 0.08
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        FYNotification.notificationView.layer.add(animation, forKey: "dismissAnimation")
        timer?.invalidate()
        timer = nil
        FYNotification.notificationView.perform(#selector(removeFromSuperview), with: nil, afterDelay: animateDuration)
    }
}
