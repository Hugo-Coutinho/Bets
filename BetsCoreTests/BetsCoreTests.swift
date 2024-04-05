import XCTest
import Combine
@testable import Bets

//class BetsViewModelTests: XCTestCase {
//
//    private var cancellables: Set<AnyCancellable>!
//    
//    override func setUp() {
//        super.setUp()
//        cancellables = []
//    }
//    
//    func test_shouldLoadBets() async {
//        // 1. GIVEN
//        let expectedFirstName = ""
//        let expectedSecondName = ""
//        let sut: BetsViewModel = makeSUT()
//        let expectation = self.expectation(description: "BetsViewModel")
//        
//        // 2. WHEN
//        sut.$odds
//            .sink(receiveCompletion: {_ in }, receiveValue: { odds in
//                guard odds.count > 1 else { return }
//                
//                expectation.fulfill()
//            })
//            .store(in: &cancellables)
//        
//        await fulfillment(of: [expectation], timeout: 10)
//        
//        // 3. THEN
//        XCTAssertNotNil(sut)
//        XCTAssertEqual(sut.odds.count, 10)
//        XCTAssertEqual(sut.odds.first?.name, expectedFirstName)
//        XCTAssertEqual(sut.odds[1].name, expectedSecondName)
//    }
//}
//
//// MARK: - MAKE SUT -
//extension BetsViewModelTests {
//    private func makeSUT() -> BetsViewModel {
//        return BetsViewModel(service: RemoteBetService.instance)
//    }
//    
//    private func makeSUTErrorHandler() -> BetsViewModel {
//        return BetsViewModel(service: RemoteBetService.instance)
//    }
//}
//
//
////
////func test_shouldMatchName() async {
////    // 1. GIVEN
////    let expectedFirstName = "Leanne Graham"
////    let expectedSecondName = "Ervin Howell"
////    let sut: UserModel = makeSUT()
////    let expectation = self.expectation(description: "UserModel")
////    
////    // 2. WHEN
////    sut.$state
////        .sink(receiveCompletion: {_ in }, receiveValue: { state in
////            switch state {
////            case .loaded:
////                expectation.fulfill()
////            default:
////                print("loading")
////            }
////        })
////        .store(in: &cancellables)
////    
////    await fulfillment(of: [expectation], timeout: 10)
////    
////    // 3. THEN
////    XCTAssertNotNil(sut)
////    XCTAssertEqual(sut.users.count, 10)
////    XCTAssertEqual(sut.users.first?.name, expectedFirstName)
////    XCTAssertEqual(sut.users[1].name, expectedSecondName)
////}
////}
////
////// MARK: - MAKE SUT -
////extension UserModelTests {
////private func makeSUT() -> UserModel {
////    let baseRequestSpy = BaseRequestSuccessHandlerSpy(service: .users)
////    let service = UserService(baseRequest: baseRequestSpy)
////    return UserModel(service: service)
////}
////
////private func makeSUTErrorHandler() -> UserModel {
////    let baseRequestSpy = BaseRequestErrorHandlerSpy()
////    let service = UserService(baseRequest: baseRequestSpy)
////    return UserModel(service: service)
////}
////}
