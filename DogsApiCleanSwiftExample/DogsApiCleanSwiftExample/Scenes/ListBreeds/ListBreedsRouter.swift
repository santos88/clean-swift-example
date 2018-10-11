//
//  ListBreedsRouter.swift
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

@objc protocol ListBreedsRoutingLogic {
    func routeToDetailBreed(segue: UIStoryboardSegue?)
}

protocol ListBreedsDataPassing {
    var dataStore: ListBreedsDataStore? { get }
}

class ListBreedsRouter: NSObject, ListBreedsRoutingLogic, ListBreedsDataPassing {
    weak var viewController: ListBreedsViewController?
    var dataStore: ListBreedsDataStore?

    // MARK: Routing

    func routeToDetailBreed(segue: UIStoryboardSegue?)
    {
      if let segue = segue {
        let destinationVC = segue.destination as! DetailBreedViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
      }
    }

    func navigateToSomewhere(source: ListBreedsViewController, destination: DetailBreedViewController)
    {
      source.show(destination, sender: nil)
    }

    func passDataToSomewhere(source: ListBreedsDataStore, destination: inout DetailBreedDataStore)
    {
      destination.selectedBreed = source.selectedBreed
    }
}
