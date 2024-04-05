import UIKit
import Combine

class ViewController: UIViewController {
    // MARK: - UI ELEMENTS -
    public lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    private lazy var updateOddsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update Odds", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - PROPERTIES -
    private var viewModel: BetsViewModel = BetsCoordinator().makeViewModel()
    private var cancellables = Set<AnyCancellable>()
    private var items: Odds = [] {
        didSet {
            self.isLoading = false
        }
    }
    
    private var isLoading: Bool = true {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - LIFE CYCLE -
    override func viewWillLayoutSubviews() {
        title = Constants.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        fetchData()
        view.addSubview(updateOddsButton)
        view.addSubview(tableView)
        setupConstraints()
    }
    
    @objc func buttonTapped() {
        Task {
            await viewModel.updateOdds()
        }
        
        isLoading = true
    }
    
    struct Constants {
        static let title = "Bets"
    }
}

// MARK: - ASSISTANT -
extension ViewController {
    func fetchData() {
        viewModel.$odds
            .receive(on: DispatchQueue.main)
            .sink { [weak self] odds in
                guard let self = self,
                      odds.count > 1 else { return }
                
                self.items = odds
            }
            .store(in: &cancellables)
    }
    
    private func registerCells() {
        tableView.register(LoadingTableViewCell.self, forCellReuseIdentifier: "LoadingTableViewCell")
        tableView.register(BetsTableViewCell.self, forCellReuseIdentifier: "BetsTableViewCell")
    }
    
    private func cellForRowAt(indexPath: IndexPath) -> UITableViewCell {
        if isLoading {
            if let loadingCell = tableView.dequeueReusableCell(withIdentifier: "LoadingTableViewCell", for: indexPath) as? LoadingTableViewCell {
                return loadingCell
            }
        } else {
            if let betsCell = tableView.dequeueReusableCell(withIdentifier: "BetsTableViewCell", for: indexPath) as? BetsTableViewCell {
                let odd = items[indexPath.row]
                betsCell.setup(domain: odd)
                return betsCell
            }
        }
        
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isLoading ? 1 : items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForRowAt(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - CONSTRAINTS -
extension ViewController {
    private func setupConstraints() {
        setupOddsButtonConstraints()
        setupTableViewConstraints()
    }
    
    private func setupTableViewConstraints() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: updateOddsButton.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupOddsButtonConstraints() {
        NSLayoutConstraint.activate([
            updateOddsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            updateOddsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            updateOddsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            updateOddsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
