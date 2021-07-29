//
//  NYTimesAppUITests.swift
//  NYTimesAppUITests
//
//  Created by Blessy Elizabeth Saini on 7/28/21.
//

import XCTest

class NYTimesAppUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableviews() {
        
        let app = XCUIApplication()
        app.staticTexts["Lifting Weights? Your Fat Cells Would Like to Have a Word."].tap()
        app.navigationBars["NYTimesApp.NewsDetailView"].buttons["NY Times Most Popular"].tap()
        
        let nyTimesMostPopularNavigationBar = app.navigationBars["NY Times Most Popular"]
        nyTimesMostPopularNavigationBar.buttons["drag"].tap()
        nyTimesMostPopularNavigationBar.children(matching: .button).matching(identifier: "Item").element(boundBy: 0).tap()
        nyTimesMostPopularNavigationBar.children(matching: .button).matching(identifier: "Item").element(boundBy: 1).tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
