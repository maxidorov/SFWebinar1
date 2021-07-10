import UIKit
import Alamofire

class MainTableViewController: UITableViewController {
  var films: [Film] = []
  var items: [Displayable] = []
  var selectedItem: Displayable?

  @IBOutlet weak var searchBar: UISearchBar!

  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self
    fetchFilms()
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
    let item = items[indexPath.row]
    cell.textLabel?.text = item.titleLabelText
    cell.detailTextLabel?.text = item.subtitleLabelText
    return cell
  }

  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    selectedItem = items[indexPath.row]
    return indexPath
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let destinationVC = segue.destination as? DetailViewController else {
      return
    }
    destinationVC.data = selectedItem
  }
}

// MARK: - UISearchBarDelegate
extension MainTableViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let shipName = searchBar.text else { return }
    searchStarships(for: shipName)
  }

  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = nil
    searchBar.resignFirstResponder()
    items = films
    tableView.reloadData()
  }
}

// MARK: - Alamofire
extension MainTableViewController {
  func fetchFilms() {
    AF.request("https://swapi.dev/api/films").validate().responseDecodable(of: Films.self) { (response) in
      guard let films = response.value else { return }
      self.films = films.all
      self.items = films.all
      self.tableView.reloadData()
    }
  }

  func searchStarships(for name: String) {
    let url = "https://swapi.dev/api/starships"
    let parameters: [String: String] = ["search": name]
    AF.request(url, parameters: parameters).validate()
      .responseDecodable(of: Starships.self) { response in
        guard let starships = response.value else { return }
        self.items = starships.all
        self.tableView.reloadData()
    }
  }
}
