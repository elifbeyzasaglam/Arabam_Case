import UIKit

class MainVC: BaseVC<MainVM> {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        viewModel.fetchData()
    }

    // MARK: - Configures
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CarCell", bundle: nil), forCellReuseIdentifier: "CarCell")
    }
}

// MARK: - Table View DataSource
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = viewModel.cars[indexPath.row]
        viewModel.didSelectCar(from: self, car: car)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as? CarCell else {
            return UITableViewCell()
        }
        
         let car = viewModel.cars[indexPath.row]
         cell.configure(with: car)
         return cell
    }
}

