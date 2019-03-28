//
//  ArtworkMarkerView.swift
//  HonoluluArt
//
//  Created by Benedikt Kurz on 28.03.19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import Foundation
import MapKit

class ArtworkMarkerView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        
        willSet {
            
            guard let artwork = newValue as? Artwork else {
                return
            }
            
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            markerTintColor = artwork.markerTintColor
            // glyphText = String(artwork.discipline.first!)
            
            if let imageName = artwork.imageName {
                
                glyphImage = UIImage(named: imageName)
                
            } else {
                
                glyphImage = nil
                
            }
            
            
        }
        
    }
    
}

class ArtworkView: MKAnnotationView {
    
    
    
    
    
    override var annotation: MKAnnotation? {
        
        willSet {
            
            guard let artwork = newValue as? Artwork else {
                return
            }
            
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            
            
            let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 30, height: 30)))
            mapsButton.setBackgroundImage(UIImage(named: "Maps-icon"), for: UIControlState())
            rightCalloutAccessoryView = mapsButton
            
            
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(12)
            detailLabel.text = artwork.subtitle
            detailCalloutAccessoryView = detailLabel
            
            if let imageName = artwork.imageName {
                
                image = UIImage(named: imageName)
                
            } else {
                
                image = nil
                
            }
            
        }
        
        
        
    }
    
}
