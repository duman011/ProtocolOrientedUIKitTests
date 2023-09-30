//
//  ProtocolOrientedUIKitTests.swift
//  ProtocolOrientedUIKitTests
//
//  Created by Yaşar Duman on 16.09.2023.
//

import XCTest
@testable import ProtocolOrientedUIKit

final class ProtocolOrientedUIKitTests: XCTestCase {
    private var userViewModel : UserViewModel!
    private var userService : MockUserService!
    private var output : MockUserViewModelOutput!
    
    override func setUpWithError() throws {
        userService = MockUserService()
        userViewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        userViewModel.output = output
    }

    override func tearDownWithError() throws {
     userService = nil
     userViewModel = nil
    }

    func testUpdateView_whenAPISuccess_showEmailNameUserName() throws {
      let mockUser = User(id: 1, name: "Yaşar", username: "01.yasarduman", email: "01.yasarduman@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        userService.fetchUserMockResult = .success(mockUser)
        userViewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.userName, "01.yasarduman")
    }
    
    func testUpdateView_whenAPIFailure_showNoUser() throws {
        userService.fetchUserMockResult = .failure(NSError())
        userViewModel.fetchUsers()
        XCTAssertEqual(output.updateViewArray.first?.name, "No user")
    }

 

}

class MockUserService : UserService {
    var fetchUserMockResult : Result<ProtocolOrientedUIKit.User, Error>?
    func fetchUser(completion: @escaping (Result<ProtocolOrientedUIKit.User, Error>) -> Void) {
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
}

class MockUserViewModelOutput : UserViewModelOutput {
    var updateViewArray : [(name: String, email: String, userName: String)] = []
    func updateView(name: String, email: String, userName: String) {
        updateViewArray.append((name,email,userName))
    }
}
