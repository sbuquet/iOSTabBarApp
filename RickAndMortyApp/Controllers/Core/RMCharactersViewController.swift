//
//  RMCharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Sebastian Buquet on 29/01/2023.
//

import UIKit

final class RMCharactersViewController: UIViewController {
    private let characterView = RMCharactersView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "characters"
        view.addSubview(characterView)

        NSLayoutConstraint.activate([
            characterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
