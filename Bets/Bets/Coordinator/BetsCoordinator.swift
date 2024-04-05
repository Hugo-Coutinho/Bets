//
//  BetsCoordinator.swift
//  Bets
//
//  Created by Hugo Coutinho on 2024-04-04.
//

import Foundation
import HGUIComponent

protocol BetsCoordinatorInput {
//    func make(output: BetsSectionOutput) -> BetsSection
    func makeViewModel() -> BetsViewModel
}

class BetsCoordinator: BetsCoordinatorInput {
    
    // MARK: - CONSTRUCTOR -
    init() {}
    
//    func make(output: BetsSectionOutput) -> BetsSection {
//        let viewModel = BetsViewModel(service: RemoteBetService.instance)
//        let section = BetsSection(viewModel: viewModel)
//        section.output = output
//        section.startSection()
//        return section
//    }
    
    func makeViewModel() -> BetsViewModel {
        return BetsViewModel(service: RemoteBetService.instance)
    }
}

// MARK: -SECTION OUTPUT -
protocol BetsSectionOutput: SectionOutput {
    
}
