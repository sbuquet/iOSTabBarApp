//
//  RMCharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Sebastian Buquet on 29/01/2023.
//

import UIKit

final class RMCharactersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "characters"

        let request = RMRequest(endPoint: .character)

        print(request.url)
    }
}
