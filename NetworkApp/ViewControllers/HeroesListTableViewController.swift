import UIKit

class HeroesListTableViewController: UITableViewController {
   
    private var hero: [Hero?] = []
    private let searchController = UISearchController(searchResultsController: nil)
    private var filteredHero: [Hero?] = []
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        setupSearchController()
        NetworkManager.shared.fetchHeroesList(from: URLExamples.urlJson.rawValue) { character in
            self.hero = character
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltering ? filteredHero.count : hero.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! TableViewCell
        
        let certainHero = (isFiltering ? filteredHero[indexPath.row] : hero[indexPath.row]) ?? Hero(heroData: ["": ""])

        cell.configure(with: certainHero)
        
        return cell
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.barTintColor = .white
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textField.font = UIFont.boldSystemFont(ofSize: 17)
            textField.textColor = .black
        }
    }

}

// MARK: - UISearchResultsUpdating
extension HeroesListTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredHero = hero.filter({ hero in
            (hero?.superhero?.lowercased().contains(searchText.lowercased()) ?? false)
        })
      tableView.reloadData()
    }
}
