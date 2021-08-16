import UIKit
import GooglePlaces
import GoogleMaps

class ViewController: UIViewController, UISearchResultsUpdating {
    
    

    let mapView = GMSMapView()
    let searchVC = UISearchController(searchResultsController: ResultsViewController())
    
    override func viewDidLoad() {
        view.addSubview(mapView)
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = CGRect(x:0, y:view.safeAreaInsets.top,
                               width: view.frame.size.width,
                               height: view.frame.size.height - view.safeAreaInsets.top)
        
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              let resultsVC = searchController.searchResultsController as? ResultsViewController else {
            return
        }
        resultsVC.delegate = self
        GooglePlacesManager.shared.findPlaces(query: query) { result in
            switch result {
            case .success(let places):
                DispatchQueue.main.async {
                    resultsVC.update(with: places)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension ViewController: ResultsViewControllerDelegate {
    func didTapPlace(with coordinates: CLLocationCoordinate2D) {
        
    }
}
