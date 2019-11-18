//
//  UIScrollViiew+Utils.swift
//  Pods
//
//  Created by Gaétan Zanella on 28/11/2018.
//

import UIKit

extension UIScrollView {

    var scrollsUp: Bool {
        return panGestureRecognizer.yDirection == .up
    }

    var isContentOriginInBounds: Bool {
        return contentOffset.y <= -oc_adjustedContentInset.top
    }

    var isContentInBounds: Bool {
        return contentSize.height <= bounds.height
    }

    func scrollToTop() {
        contentOffset.y = -oc_adjustedContentInset.top
    }
}


extension UIScrollView {
    
    var oc_adjustedContentInset: UIEdgeInsets {
        
        if #available(iOS 11.0, *) {
            return self.adjustedContentInset
        } else {
            // Fallback on earlier versions
            return self.contentInset
        }
    }
}
