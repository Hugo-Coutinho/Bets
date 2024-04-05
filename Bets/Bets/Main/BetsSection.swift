//
//  BetsSection.swift
//  Bets
//
//  Created by Hugo Coutinho on 2024-04-04.
//

import Foundation
import UIKit
import HGUIComponent
import BetsCore
import Combine

//final class BetsSection: Section {
//    
//    // MARK: - VARIABLE DELCARATIONS -
//    var viewModel: BetsViewModel?
//    
//    private var cancellables = Set<AnyCancellable>()
//    
//    // MARK: - CONSTRUCTORS -
//    init(viewModel: BetsViewModel) {
//        super.init()
//        self.items = [NSObject()]
//        self.viewModel = viewModel
//    }
//    
//    // MARK: - INPUT METHODS -
//    func startSection() {
//        viewModel?.$names
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] names in
//                guard let self = self else { return }
//                
//                self.items = names
//                self.scene = .sceneSuccess
//                self.output?.reloadSection(section: self, animation: .automatic)
//            }
//            .store(in: &cancellables)
//    }
//    
//    func updateOdds() {
//        Task {
//            await viewModel?.updateOdds()
//        }
//    }
//}
//
//// MARK: - TABLEVIEW SECTION INPUT -
//extension BetsSection: TableSectionCellInput {
//    func didSelectCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
//        
//    }
//    
//    func cell(for indexPath: IndexPath) -> UITableViewCell.Type {
//        switch self.scene {
//        case .sceneloading:
//            return LoadingTableViewCell.self
//        default:
//            return BetsTableViewCell.self
//        }
//    }
//    
//    func willDisplayCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
//        guard let cell = cell as? BetsTableViewCell,
//              let name = items[indexPath.row] as? String else { return }
//        
//        cell.setup(name: name)
//    }
//    
//    func estimatedRowHeight() -> CGFloat {
//        return 50
//    }
//}
