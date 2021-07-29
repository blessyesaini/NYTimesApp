//
//  ResultsTests.swift
//  NYTimesAppTests
//
//  Created by Blessy Elizabeth Saini on 7/28/21.
//

import XCTest
@testable import NYTimesApp

class ResultsTests: XCTestCase {

    override func setUpWithError() throws {
      try super.setUpWithError()
     
    }

    override func tearDownWithError() throws {
     
      try super.tearDownWithError()
    }

    func testValidApiCallGetsHTTPStatusCode200() throws {
        try XCTSkipUnless(
            GeneralHandler.shared.testConnection(),"Network connectivity needed for this test"
        )
    }
    func testGetResultsWithExpectedURL()  {
        
       let newsListViewModel = NewsListResultsViewModel()
        newsListViewModel.getMostPupularNewsFeed(section: "all-sections", period: 7) { result in
       
        }
        let strURL = (newsListViewModel.getURL(section: "all-sections", period: 7)).absoluteString
        XCTAssertEqual( strURL, "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=hJRTJaDqwclHYzKRjCxwi5WCHGITbgib" )
        
    }
    func testGetResultsWithIncorrectURL()  {
        
       let newsListViewModel = NewsListResultsViewModel()
        newsListViewModel.getMostPupularNewsFeed(section: "allsections", period: 70) { result in
       
        }
        let strURL = (newsListViewModel.getURL(section: "allsections", period: 70)).absoluteString
        XCTAssertNotEqual( strURL, "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=hJRTJaDqwclHYzKRjCxwi5WCHGITbgib" )
        
    }
    func testGetResultsSuccessReturns() {
        let newsListViewModel = NewsListResultsViewModel()
      let resultExpectation = expectation(description: "results")
      var resultResponse: [Result]?
        newsListViewModel.getMostPupularNewsFeed(section: "all-sections", period: 7) { result in
            resultResponse = result
            resultExpectation.fulfill()
        }
      waitForExpectations(timeout: 2) { (error) in
        XCTAssertNotNil(resultResponse)
      }
    }
    func testGetResultsFailReturns() {
        let newsListViewModel = NewsListResultsViewModel()
      var resultResponse: [Result]?
        newsListViewModel.getMostPupularNewsFeed(section: "all-sections", period: 70) { result in
            resultResponse = result
        }
       XCTAssertNil(resultResponse)
    }
}
