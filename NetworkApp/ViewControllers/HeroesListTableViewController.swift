import UIKit

class HeroesListTableViewController: UITableViewController {
 
    let network = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        self.network.fetchHeroesList()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        network.heroes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! TableViewCell
        
        let hero = network.heroes[indexPath.row]

        print(hero)
        cell.configure(with: hero)
      
        return cell
    }

}

