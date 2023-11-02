//
//  Zone2DataService.swift
//  Zone2Framework
//
//  Created by Helia Fathi on 10/30/23.
//

import Combine

public struct Zone2Data {
    let id: Int
    let description: String
}

public protocol Zone2DataServiceType {
    func fetchData() -> AnyPublisher<Zone2Data, Error>
}

public class Zone2DataService: Zone2DataServiceType {
    public func fetchData() -> AnyPublisher<Zone2Data, Error> {
        return Just(Zone2Data(id: 1, description: "Zone 2 Sample Data"))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
