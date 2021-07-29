//
//  MostPopularNewsListViewControllerTest.swift
//  NYTimesAppTests
//
//  Created by Blessy Elizabeth Saini on 7/28/21.
//

import XCTest
@testable import NYTimesApp
class MostPopularNewsListViewControllerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    var viewControllerUnderTest: MostPopularNewsListViewController!
        
        override func setUp() {
            super.setUp()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "MostPopularNewsListViewController") as? MostPopularNewsListViewController
            
            // in view controller, menuItems = ["one", "two", "three"]
            self.viewControllerUnderTest.loadView()
            self.viewControllerUnderTest.viewDidLoad()
        }
        
        override func tearDown() {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
            super.tearDown()
        }
        
        func testHasATableView() {
            XCTAssertNotNil(viewControllerUnderTest.tblViewNewsList)
        }
        
        func testTableViewHasDelegate() {
            XCTAssertNotNil(viewControllerUnderTest.tblViewNewsList.delegate)
        }
        
        func testTableViewConfromsToTableViewDelegateProtocol() {
            XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
            XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:didSelectRowAt:))))
        }
        
        func testTableViewHasDataSource() {
            XCTAssertNotNil(viewControllerUnderTest.tblViewNewsList.dataSource)
        }
        
        func testTableViewConformsToTableViewDataSourceProtocol() {
            XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
            
            XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
            XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
        }

    func testTableViewCellHasReuseIdentifier() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MostPopularNewsListViewController") as! MostPopularNewsListViewController

            _=controller.view

            let tableView = controller.tblViewNewsList
            let dataProvider = FakeDataSource()
        tableView!.dataSource = dataProvider

        let cell = tableView!.dequeueReusableCell(withIdentifier: "NewsListTableViewCell", for: IndexPath(row: 0, section: 0) ) as! NewsListTableViewCell
        let actualReuseIdentifer = cell.reuseIdentifier
        let expectedReuseIdentifier = "NewsListTableViewCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    func testTableViewCellHasNameLabel() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MostPopularNewsListViewController") as! MostPopularNewsListViewController

            _=controller.view

            let tableView = controller.tblViewNewsList
            let dataProvider = FakeDataSource()
        tableView!.dataSource = dataProvider

        let cell = tableView!.dequeueReusableCell(withIdentifier: "NewsListTableViewCell", for: IndexPath(row: 0, section: 0) ) as! NewsListTableViewCell
        XCTAssertNotNil(cell.lblTitle)
    }
  

  

   

}
extension MostPopularNewsListViewControllerTest{
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

      
    }
}
