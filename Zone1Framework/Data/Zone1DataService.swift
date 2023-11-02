//
//  Zone1DataService.swift
//  Zone1Framework
//
//  Created by Helia Fathi on 10/30/23.
//

import Combine

public struct Zone1Data {
    let id: Int
    let description: String
}

public protocol Zone1DataServiceType {
    func fetchData() -> AnyPublisher<Zone1Data, Error>
}

public class Zone1DataService: Zone1DataServiceType {
    public func fetchData() -> AnyPublisher<Zone1Data, Error> {
        return Just(Zone1Data(id: 1, description: "Zone 1 Sample Data"))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
