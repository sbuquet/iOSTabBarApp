//
//  RMCharactersListViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Sebastian Buquet on 31/01/2023.
//

import Foundation
import UIKit

class RMCharactersListViewViewModel: NSObject {
    func fetchCharacters() {
        let semaphore = DispatchSemaphore(value: 0)
        Task {
            do {
                let model: RMGetAllCharactersResponse = try await RMService.shared.execute(.listOfCharactersRequest)
                print(String(describing: model))
            } catch {
                print(String(describing: error))
            }
            semaphore.signal()
        }
        semaphore.wait()
    }
}

extension RMCharactersListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? RMCharacterCollectionViewCell else {
            fatalError("unsupported cell")
        }
        let viewModel = RMCharactersCollectionViewViewModel(
            characterName: "bla",
            characterStatus: .alive,
            characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/14.jpeg")
        )
        cell.configuration(with: viewModel)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        let height = width * 1.5
        return CGSize(
            width: width,
            height: height
        )
    }
}
