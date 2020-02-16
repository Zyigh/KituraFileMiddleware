//
//  FileNameGenerator.swift
//  KituraFileMiddleware
//
//  Created by Hugo Medina on 08/02/2020.
//

import Foundation

protocol FileNameGenerator {
    func generateFileName() -> String
}

extension UUID: FileNameGenerator {
    func generateFileName() -> String {
        return UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased()
    }
}
