//
//  ListBreedsPresenter.swift
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

protocol ListBreedsPresentationLogic {
    func presentListBreeds(response: ListBreeds.InitialLoad.Response)
}

class ListBreedsPresenter: ListBreedsPresentationLogic {
    weak var viewController: ListBreedsDisplayLogic?

    func presentListBreeds(response: ListBreeds.InitialLoad.Response) {
        let viewModel = ListBreeds.InitialLoad.ViewModel(breeds: response.breeds)
        viewController?.displayBreeds(viewModel: viewModel)
    }
}
