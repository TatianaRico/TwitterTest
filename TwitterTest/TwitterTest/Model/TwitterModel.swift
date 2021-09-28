//
//  TwitterModel.swift
//  TwitterTest
//
//  Created by Tatiana Rico on 24/09/21.
//  Copyright © 2021 Tatiana Rico. All rights reserved.
//

import Foundation


// MARK: - Model
struct TwitterModel: Codable {
    let data: UserTwitter?
}

struct UserTwitter: Codable {
    let id: String?
    let name: String?
    let username: String?
}

struct MsgIdTwitter: Codable {
    let data: [MsgTwitter]?
}

struct MsgTwitter: Codable {
    let id: String?
    let text: String?
}
