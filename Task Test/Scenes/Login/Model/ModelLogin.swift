//
//  ModelLogin.swift
//  Task Test
//
//  Created by Ali Wicca on 22/01/2023.
//


import Foundation

// MARK: - Welcome
struct loginmodel: Codable {
    let id: Int
    let username, email, firstName, lastName: String
    let gender: String
    let image: String
    let token: String
}
