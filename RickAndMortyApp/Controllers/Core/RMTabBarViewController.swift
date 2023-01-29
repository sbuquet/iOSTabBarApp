//
//  RMTabViewController.swift
//  RickAndMortyApp
//
//  Created by Sebastian Buquet on 29/01/2023.
//

import UIKit

final class RMTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }

    private func setUpTabs() {
        let charactersViewController = RMCharactersViewController()
        let episodesViewController = RMEpisodesViewController()
        let locationsViewController = RMLocationsViewController()
        let settingsViewController = RMSettingsViewController()

        charactersViewController.navigationItem.largeTitleDisplayMode = .automatic
        episodesViewController.navigationItem.largeTitleDisplayMode = .automatic
        locationsViewController.navigationItem.largeTitleDisplayMode = .automatic
        settingsViewController.navigationItem.largeTitleDisplayMode = .automatic

        let nav1 = UINavigationController(rootViewController: charactersViewController)
        let nav2 = UINavigationController(rootViewController: episodesViewController)
        let nav3 = UINavigationController(rootViewController: locationsViewController)
        let nav4 = UINavigationController(rootViewController: settingsViewController)

        nav1.tabBarItem = UITabBarItem(title: "character", image: UIImage(systemName: "person"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "episodes", image: UIImage(systemName: "tv"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "locations", image: UIImage(systemName: "globe"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "settings", image: UIImage(systemName: "gear"), tag: 4)

        let tabs = [nav1, nav2, nav3, nav4]

        for tab in tabs {
            tab.navigationBar.prefersLargeTitles = true
        }
        setViewControllers(tabs, animated: true)
    }

}

