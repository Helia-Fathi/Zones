//
//  Zone1ViewModel.swift
//  Zone1Framework
//
//  Created by Helia Fathi on 10/30/23.
//

import Combine

public class Zone1ViewModel: ObservableObject {
    public let useCase: Zone1UseCaseType
    public var cancellables: Set<AnyCancellable> = []
    
    @Published var data: Zone1Data?
    @Published var error: Error?
    
    public init(useCase: Zone1UseCaseType) {
        self.useCase = useCase
    }
    
    public func loadData() {
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
