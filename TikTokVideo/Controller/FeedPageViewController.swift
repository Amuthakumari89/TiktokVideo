//
//  FeedPageViewController.swift
//  TikTokVideo
//
//  Created by Depak on 01/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import UIKit

typealias IndexedFeed = (feed: Feed, index: Int)

protocol FeedPageView: class, ProgressIndicatorHUDPresenter {
    func presentInitialFeed(_ feed: Feed)
}

class FeedPageViewController: UIPageViewController, FeedPageView {
    fileprivate var presenter: FeedPagePresenterProtocol!
    
    func presentInitialFeed(_ feed: Feed) {
        let viewController = FeedViewController.instantiate(feed: feed, andIndex: 0, isPlaying: true) as! FeedViewController
        setViewControllers([viewController], direction: .forward, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        presenter = FeedPagePresenter(view: self)
        presenter.viewDidLoad()
    }
    
}


extension FeedPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let indexedFeed = presenter.fetchPreviousFeed() else {
            return nil
        }
        return FeedViewController.instantiate(feed: indexedFeed.feed, andIndex: indexedFeed.index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let indexedFeed = presenter.fetchNextFeed() else {
            return nil
        }
        return FeedViewController.instantiate(feed: indexedFeed.feed, andIndex: indexedFeed.index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
        if
            let viewController = pageViewController.viewControllers?.first as? FeedViewController,
            let previousViewController = previousViewControllers.first as? FeedViewController
        {
            previousViewController.pause()
            viewController.play()
            presenter.updateFeedIndex(fromIndex: viewController.index)
        }
    }
}



