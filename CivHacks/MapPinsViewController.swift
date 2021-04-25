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
        let Apex = Artwork(
          title: "Apex Hospitals",
          locationName: "Uppal, Hyderabad",
          discipline: "Hospital",
          coordinate: CLLocationCoordinate2D(latitude: 17.408314899190223, longitude: 78.59872336601447)
         )
        let AIG = Artwork(
          title: "AIG Hospitals",
          locationName: "Gachibowli, Hyderabad",
          discipline: "Hospital",
          coordinate: CLLocationCoordinate2D(latitude: 17.44358352894977, longitude: 78.36623812739153)
         )
        let Lotus = Artwork(
          title: "Lotus Hospitals",
          locationName: "Kukatpally, Hyderabad",
          discipline: "Hospital",
          coordinate: CLLocationCoordinate2D(latitude: 17.491191410721804, longitude: 78.39312864088426)
         )
        let Srinivasa = Artwork(
          title: "Srinivasa Hospitals",
          locationName: "Madhapur, Hyderabad",
          discipline: "Hospital",
          coordinate: CLLocationCoordinate2D(latitude: 17.440888693255246, longitude: 78.39441949855548)
         )

        
        MapView.addAnnotation(KIMS)
        MapView.addAnnotation(Kakatiya)
        MapView.addAnnotation(Apex)
        MapView.addAnnotation(AIG)
        MapView.addAnnotation(Lotus)
        MapView.addAnnotation(Srinivasa)
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
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        VC.SelectedName = artwork.title!
        self.present(VC, animated: true, completion: nil)
        
    }

}


