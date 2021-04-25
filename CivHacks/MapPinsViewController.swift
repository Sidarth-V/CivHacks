//
//  MapPinsViewController.swift
//  CivHacks
//
//  Created by Sidarth V on 25/04/21.
//

import UIKit
import MapKit


class MapPinsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var MapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MapView.delegate = self
        let initialLocation = CLLocation(latitude: 17.43966859847498, longitude: 78.44094979533975)
        let KIMS = Artwork(
          title: "KIMS Hospitals",
          locationName: "Kondapur, Hyderabad",
          discipline: "Hospital",
          coordinate: CLLocationCoordinate2D(latitude: 17.46659124201257, longitude: 78.36765988135964)
         )
        let Kakatiya = Artwork(
          title: "Kakatiya Hospitals",
          locationName: "Medipally, Hyderabad",
          discipline: "Hospital",
          coordinate: CLLocationCoordinate2D(latitude: 17.40927524768896, longitude: 78.5984564813586)
         )
        MapView.addAnnotation(KIMS)
        MapView.addAnnotation(Kakatiya)
        MapView.centerToLocation(initialLocation)

        // Do any additional setup after loading the view.
    }
    
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 10000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
extension MapPinsViewController {
  // 1
  func mapView(
    _ mapView: MKMapView,
    viewFor annotation: MKAnnotation
  ) -> MKAnnotationView? {
    // 2
    guard let annotation = annotation as? Artwork else {
      return nil
    }
    // 3
    let identifier = "artwork"
    var view: MKMarkerAnnotationView
    // 4
    if let dequeuedView = mapView.dequeueReusableAnnotationView(
      withIdentifier: identifier) as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      view = dequeuedView
    } else {
      // 5
      view = MKMarkerAnnotationView(
        annotation: annotation,
        reuseIdentifier: identifier)
      view.canShowCallout = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
    return view
  }
    func mapView(
      _ mapView: MKMapView,
      annotationView view: MKAnnotationView,
      calloutAccessoryControlTapped control: UIControl
    ) {
      guard let artwork = view.annotation as? Artwork else {
        return
      }

        print(artwork.title)
        
    }

}


