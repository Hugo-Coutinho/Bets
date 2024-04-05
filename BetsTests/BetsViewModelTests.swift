//
//  BetsTests.swift
//  BetsTests
//
//  Created by Hugo Coutinho on 2024-04-05.
//

import XCTest
import Combine
@testable import Bets

final class BetsViewModelTests: XCTestCase {

    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    func test_shouldLoadBets() async {
        // 1. GIVEN
        let expectedFirstName = "Winning team"
        let expectedSecondName = "Total score"
        let sut: BetsViewModel = makeSUT()
        let expectation = self.expectation(description: "BetsViewModel")
        
        // 2. WHEN
        sut.$odds
            .sink(receiveCompletion: {_ in }, receiveValue: { odds in
                guard odds.count > 1 else { return }
                
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        await fulfillment(of: [expectation], timeout: 10)
        
        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.odds.count, 16)
        XCTAssertEqual(sut.odds.first?.name, expectedFirstName)
        XCTAssertEqual(sut.odds[1].name, expectedSecondName)
    }
    
    func test_shouldLoadBetsFail() async {
        // 1. GIVEN
        let sut: BetsViewModel = makeSUTErrorHandler()
        let expectation = self.expectation(description: "BetsViewModel")
        
        // 2. WHEN
        sut.$odds
            .sink(receiveCompletion: {_ in }, receiveValue: { odds in
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        await fulfillment(of: [expectation], timeout: 10)
        
        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.odds.count, 0)
    }
}

// MARK: - MAKE SUT -
extension BetsViewModelTests {
    private func makeSUT() -> BetsViewModel {
        return BetsViewModel(service: RemoteBetService.instance)
    }
    
    private func makeSUTErrorHandler() -> BetsViewModel {
        return BetsViewModel(service: BetsServiceErrorHandlerSpy())
    }
}
