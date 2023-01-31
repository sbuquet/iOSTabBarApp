//
//  RMCharacterCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Sebastian Buquet on 31/01/2023.
//

import UIKit

class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterCollectionViewCell"

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, nameLabel, statusLabel)
        addConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("has not been implemented")
    }

    private func addConstraint() {
        NSLayoutConstraint.activate(
            [
                statusLabel.heightAnchor.constraint(equalToConstant: 40),
                nameLabel.heightAnchor.constraint(equalToConstant: 40),

                statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
                statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
                nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
                nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),

                statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
                nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),

                imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3),
                imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
                imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5)
            ]
        )
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }

    public func configuration(with viewModel: RMCharactersCollectionViewViewModel) {
        Task { @MainActor in
            do {
                self.nameLabel.text = viewModel.characterName
                self.statusLabel.text = viewModel.characterStatusText

                let data = try await viewModel.fetchImage()

                if let data = data {
                    self.imageView.image = UIImage(data: data)
                }
            } catch {
                print(error)
            }
        }
    }
}
