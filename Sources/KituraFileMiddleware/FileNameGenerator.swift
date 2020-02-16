//
//  FileNameGenerator.swift
//  KituraFileMiddleware
//
//  Created by Hugo Medina on 08/02/2020.
//

import Foundation

public protocol FileNameGenerator {
    func generateFileName() -> String
}

extension UUID: FileNameGenerator {
    public func generateFileName() -> String {
        return UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased()
    }
}
