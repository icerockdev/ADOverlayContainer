//
//  OverlayScrollViewTranslationController.swift
//  OverlayContainer
//
//  Created by Gaétan Zanella on 20/11/2018.
//

import UIKit

class OverlayTranslationGestureRecognizer: UIPanGestureRecognizer {

    weak var drivingScrollView: UIScrollView?

    var translationOffset: CGFloat = 0

    private(set) var startingLocation: CGPoint = .zero

    // MARK: - Public

    func cancel() {
        isEnabled = false
        isEnabled = true
    }

    // MARK: - UIGestureRecognizer

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        startingLocation = location(in: view)
    }
}
