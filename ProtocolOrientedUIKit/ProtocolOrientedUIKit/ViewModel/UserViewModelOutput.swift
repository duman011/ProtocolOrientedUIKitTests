//
//  UserViewModelOutput.swift
//  ProtocolOrientedUIKit
//
//  Created by Yaşar Duman on 16.09.2023.
//

import Foundation

protocol UserViewModelOutput : AnyObject {
    func updateView(name: String, email: String, userName: String)
}
