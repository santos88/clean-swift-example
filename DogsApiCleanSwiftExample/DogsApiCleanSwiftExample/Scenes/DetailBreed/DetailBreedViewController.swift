//
//  DetailBreedViewController.swift
//  DogsApiCleanSwiftExample
//
//  Created by Santos Ramon on 10/10/18.
//  Copyright (c) 2018 Santos Ramon. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailBreedDisplayLogic: class {
    func displayPictures(viewModel: DetailBreed.InitialLoad.ViewModel)
}

class DetailBreedViewController: UIViewController, DetailBreedDisplayLogic {
    @IBOutlet weak var collectionView: UICollectionView!
    var interactor: DetailBreedBusinessLogic?
    var router: (NSObjectProtocol & DetailBreedRoutingLogic & DetailBreedDataPassing)?
    var viewModel: DetailBreed.InitialLoad.ViewModel?

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = DetailBreedInteractor()
        let presenter = DetailBreedPresenter()
        let router = DetailBreedRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initialLoad()
    }

    func initialLoad() {
        let request = DetailBreed.InitialLoad.Request()
        interactor?.initialLoad(request: request)
    }

    func displayPictures(viewModel: DetailBreed.InitialLoad.ViewModel) {
        self.viewModel = viewModel
        DispatchQueue.main.async {
            self.title = viewModel.title
            self.collectionView.reloadData()
        }
    }
}

extension DetailBreedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.pictures.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dogCell", for: indexPath) as! DogCollectionViewCell
        if let pic = viewModel?.pictures[indexPath.row] {
            cell.configure(imageName: pic)
        }
        return cell
    }
}

extension DetailBreedViewController: UICollectionViewDelegate {

}
