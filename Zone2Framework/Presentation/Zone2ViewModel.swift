//
//  Zone2ViewModel.swift
//  Zone2Framework
//
//  Created by Helia Fathi on 10/30/23.
//

import Foundation
import Combine
import SwiftUI

public class Zone2ViewModel: ObservableObject {
    private let useCase: Zone2UseCaseType
    private var cancellables: Set<AnyCancellable> = []

    @Published var data: Zone2Data?
    @Published var error: Error?

    public init(useCase: Zone2UseCaseType) {
        self.useCase = useCase
    }

    func loadData() {
        useCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let err):
                    self.error = err
                case .finished:
                    break
                }
            }, receiveValue: { data in
                self.data = data
            })
            .store(in: &cancellables)
    }
}
