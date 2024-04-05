//
//  BetsViewModel.swift
//  Bets
//
//  Created by Hugo Coutinho on 2024-04-04.
//

import Foundation

class BetsViewModel {
    // MARK: - PROPERTIES -
    @Published var odds: Odds = []
    
    private var service: BetService
    private var bets: Bets = []
    
    // MARK: - CONSTRUCTOR -
    init(service: BetService) {
        self.service = service
        fetchBets()
    }
    
    public func updateOdds() async {
        bets.forEach{( $0.update() )}
        fetchNames()
        try? await service.saveBets(bets)
    }
}

// MARK: - ASSISTANT -
extension BetsViewModel {
    private func fetchBets() {
        Task {
            bets = try await service.loadBets()
            fetchNames()
        }
    }
    
    private func fetchNames() {
        odds = bets
            .map({ (bet) -> Odd in
                let sellIn = "Sell in: \(bet.sellIn)"
                let quality = "Quality: \(bet.quality)"
                
                return Odd(name: bet.name, quality: quality, sellIn: sellIn)
            })
    }
}

struct Odd {
    var name, quality, sellIn: String
}

typealias Odds = [Odd]
