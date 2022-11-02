//
//  NGTestTests.swift
//  NGTestTests
//

import XCTest
@testable import NGTest

class NGTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJsonDecodeWithCorrectData() {
        guard let path = Bundle.main.path(forResource: "articles", ofType: "json") else {
            XCTAssertFalse(true)
            return }
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        JsonDecoderService().decode(of: [Article].self, from: data) { result in
            switch result {
            case .success(let data):
                print(data)
                XCTAssertNotNil(data)
            case .failure(let error):
                print(error)
                XCTAssertNil(error)
            }
        }
        
    }
    func testJsonDecodeWithIncorrectData() {
        JsonDecoderService().decode(of: Article.self, from: "error".data(using: .utf8)!) { result in
            switch result {
            case .success(let data):
                XCTAssertNil(data)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
