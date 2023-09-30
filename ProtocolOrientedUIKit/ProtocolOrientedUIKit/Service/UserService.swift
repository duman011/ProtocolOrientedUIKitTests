//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by Yaşar Duman on 16.09.2023.
//

import Foundation

protocol UserService {
    func fetchUser(completion : @escaping(Result<User, Error>) -> Void)
}
