//
//  MapsLikeViewController.swift
//  OverlayContainer_Example
//
//  Created by Gaétan Zanella on 30/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import OverlayContainer
import UIKit

class MapsLikeViewController: UIViewController {

    enum OverlayNotch: Int, CaseIterable {
        case minimum, maximum
    }

    @IBOutlet var overlayContainerView: UIView!
    @IBOutlet var backgroundView: UIView!

    @IBOutlet private var widthConstraint: NSLayoutConstraint!
    @IBOutlet private var trailingConstraint: NSLayoutConstraint!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        let overlayController = OverlayContainerViewController()
        overlayController.delegate = self
        overlayController.viewControllers = [SearchViewController(showsCloseAction: false)]
        addChild(overlayController, in: overlayContainerView)
        addChild(MapsViewController(), in: backgroundView)
    }

    override func viewWillLayoutSubviews() {
        setUpConstraints(for: view.bounds.size)
        super.viewWillLayoutSubviews()
    }

    // MARK: - Private

    private func setUpConstraints(for size: CGSize) {
        if size.width > size.height {
            trailingConstraint.isActive = false
            widthConstraint.isActive = true
        } else {
            trailingConstraint.isActive = true
            widthConstraint.isActive = false
        }
    }

    private func notchHeight(for notch: OverlayNotch, availableSpace: CGFloat) -> CGFloat {
        switch notch {
        case .maximum:
            return availableSpace * 3 / 4
        case .minimum:
            return availableSpace * 2 / 4
        }
    }
}

extension MapsLikeViewController: OverlayContainerViewControllerDelegate {
    
    // MARK: - OverlayContainerViewControllerDelegate

    func numberOfNotches(in containerViewController: OverlayContainerViewController) -> Int {
        return OverlayNotch.allCases.count
    }

    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
                                        heightForNotchAt index: Int,
                                        availableSpace: CGFloat) -> CGFloat {
        let notch = OverlayNotch.allCases[index]
        return notchHeight(for: notch, availableSpace: availableSpace)
    }

    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
                                        scrollViewDrivingOverlay overlayViewController: UIViewController) -> UIScrollView? {
        return (overlayViewController as? SearchViewController)?.tableView
    }
}
