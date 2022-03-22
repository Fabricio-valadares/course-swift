//
//  model.swift
//  desafio-list-api
//
//  Created by FL00027 on 21/03/22.
//

import Foundation

struct Card: Codable {
    let id: Int
    let profile: String
    let name: String
    let company: CompanyData
}

struct CompanyData: Codable {
    let name: String
}
