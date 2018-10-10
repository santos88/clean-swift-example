//
//  DetailBreedViewControllerTests.swift
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

class DetailBreedViewControllerTests: XCTestCase {
    // MARK: Subject under test
    var sut: DetailBreedViewController!
    var window: UIWindow!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupDetailBreedViewController()
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    // MARK: Test setup
    
    func setupDetailBreedViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "DetailBreedViewController") as! DetailBreedViewController
    }

    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    // MARK: Test doubles

    class DetailBreedBusinessLogicSpy: DetailBreedBusinessLogic {
        var doSomethingCalled = false

        func doSomething(request: DetailBreed.Something.Request) {
            doSomethingCalled = true
        }
    }

    // MARK: Tests

    func testShouldDoSomethingWhenViewIsLoaded() {
        // Given
        let spy = DetailBreedBusinessLogicSpy()
        sut.interactor = spy

        // When
        loadView()

        // Then
        XCTAssertTrue(spy.doSomethingCalled, "viewDidLoad() should ask the interactor to do something")
    }

    func testDisplaySomething() {
        // Given
        let viewModel = DetailBreed.Something.ViewModel()

        // When
        loadView()
        sut.displaySomething(viewModel: viewModel)

        // Then
        //XCTAssertEqual(sut.nameTextField.text, "", "displaySomething(viewModel:) should update the name text field")
    }
}