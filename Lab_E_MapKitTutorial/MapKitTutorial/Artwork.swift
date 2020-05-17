import Foundation
import Contacts
import MapKit


class Artwork: NSObject, MKAnnotation{
    let title: String?
    let locationName : String
    let discipline : String
    let coordinate : CLLocationCoordinate2D
    
    init(title : String, locationName : String, discipline : String, coordinate : CLLocationCoordinate2D){
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    init?(json: [Any]){
        self.title = json[16] as? String ?? "No Title"
        self.locationName = json[12] as! String
        self.discipline = json[15] as! String
        
        if let latitude = Double(json[18] as! String), let longitude = Double(json[19] as! String) {
            self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        }else{
            self.coordinate = CLLocationCoordinate2D()
        }
    }
    var subtitle : String? {
        return locationName
    }
    
    func mapItem() -> MKMapItem{
        let addressDict = [CNPostalAddressStreetKey : subtitle!]
        let placemark = MKPlacemark(coordinate : coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
