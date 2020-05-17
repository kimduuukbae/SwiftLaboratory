import Foundation
import MapKit

extension ViewController : MKMapViewDelegate{
    
    func mapView(_ mapView : MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        guard let annotation = annotation as? Artwork else {return nil}
        
        let identifier = "marker"
        var view : MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView{
            dequeuedView.annotation = annotation
            view = dequeuedView
        }else{
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x : -5, y : 5)
            view.rightCalloutAccessoryView = UIButton(type : .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView : MKMapView, annotationView view : MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        let location = view.annotation as! Artwork
        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
}
