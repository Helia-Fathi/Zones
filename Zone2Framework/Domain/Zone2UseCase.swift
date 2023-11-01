//
//  Zone2UseCases.swift
//  Zone2Framework
//
//  Created by Helia Fathi on 10/30/23.
//

import Foundation
import Combine

public protocol Zone2UseCaseType {
    func fetchZone2Items() -> AnyPublisher<[Zone2Item], Error>
}

public class Zone2UseCases: Zone2UseCaseType {
    public init() {}

    public func fetchZone2Items() -> AnyPublisher<[Zone2Item], Error> {
        // In a real-world scenario, you'd call an API or a local database.
        // For now, let's just return a mock list:
        return Just([
            Zone2Item(title: "Zone 2 Item 1", description: "Description for Zone 2 Item 1"),
            Zone2Item(title: "Zone 2 Item 2", description: "Description for Zone 2 Item 2")
        ])
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
}
