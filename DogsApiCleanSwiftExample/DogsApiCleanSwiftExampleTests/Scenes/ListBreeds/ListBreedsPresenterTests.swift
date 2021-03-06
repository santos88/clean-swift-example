//
//  ListBreedsPresenterTests.swift
//  DogsApiCleanSwiftExample
//
//  Created by Santos Ramon on 10/10/18.
//  Copyright (c) 2018 Santos Ramon. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import DogsApiCleanSwiftExample
import XCTest

class ListBreedsPresenterTests: XCTestCase {
    // MARK: Subject under test

    var sut: ListBreedsPresenter!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupListBreedsPresenter()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupListBreedsPresenter() {
        sut = ListBreedsPresenter()
    }

    // MARK: Test doubles

    class ListBreedsDisplayLogicSpy: ListBreedsDisplayLogic {
        var displayBreedsCalled = false
        var displayDetailBreedCalled = false

        func displayBreeds(viewModel: ListBreeds.InitialLoad.ViewModel) {
            displayBreedsCalled = true
        }

        func displayDetailBreed() {
            displayDetailBreedCalled = true
        }
    }

    // MARK: Tests

    func testPresentListBreeds() {
        // Given
        let spy = ListBreedsDisplayLogicSpy()
        sut.viewController = spy
        let response = ListBreeds.InitialLoad.Response(breeds: ["pekines", "bulldog"])

        // When
        sut.presentListBreeds(response: response)

        // Then
        XCTAssertTrue(spy.displayBreedsCalled, "presentListBreeds(response:) should ask the view controller to display the result")
    }

    func testPresentDetailBreed() {
        // Given
        let spy = ListBreedsDisplayLogicSpy()
        sut.viewController = spy

        // When
        sut.presentDetailBreed()

        // Then
        XCTAssertTrue(spy.displayDetailBreedCalled, "presentDetailBreed() should ask the view controller to go to the next screen")
    }

}
