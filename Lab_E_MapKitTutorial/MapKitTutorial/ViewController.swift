import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let regionRadius : CLLocationDistance = 1000
    
    var artworks : [Artwork] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        centerMapOnLocation(location: initialLocation)
        
        mapView.delegate = self
        
        let artwork = Artwork(title : "King David Kalakaua",
                          locationName: "Waikiki Gateway Park",
                          discipline: "Sculpture",
                          coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        loadInitialData()
        mapView.addAnnotations(artworks)
    }
    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func loadInitialData(){
        guard let fileName = Bundle.main.path(forResource: "PublicArt", ofType: "json")
            else{return}
        let optionalData = try? Data(contentsOf: URL(fileURLWithPath: fileName))
        
        guard let data = optionalData,
            let json = try? JSONSerialization.jsonObject(with: data),
            let dictionary = json as? [String: Any],
            let works = dictionary["data"] as? [[Any]]
            else {
            return
        }
        let validWorks = works.flatMap {Artwork(json:$0)}
        artworks.append(contentsOf : validWorks)
    }
    
}

