//
//  SimpleMapViewController.swift
//  Seoul-Weather
//
//  Created by KimSuyoung on 12/06/2018.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit
import WebKit

class MapViewController: UIViewController {
    
    enum MapType {
        case Atype, Btype, Dtype
    }
    var choiceType = MapType.Atype
    
    let wkwebView = WKWebView()
    let daumView = MTMapView()
    
    @IBOutlet weak var svgView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorizeView()
        loadMap()
    }
    
    private func colorizeView() {
        guard choiceType == MapType.Btype else { return }
        let themeColor = UIColor.init(hexString: "#696969")
        view.backgroundColor = themeColor
        svgView?.backgroundColor = themeColor
    }
    
    private func loadMap() {
        guard choiceType != MapType.Dtype else {
            loadDaumMap()
            return
        }
        
        let type = choiceType==MapType.Atype ? "mSeoul_type_A" : "mSeoul_type_B"
        let htmlPath = Bundle.main.path(forResource: type, ofType: "html")
        let htmlUrl = URL(fileURLWithPath: htmlPath!, isDirectory: false)
        wkwebView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        wkwebView.navigationDelegate = self
        wkwebView.loadFileURL(htmlUrl, allowingReadAccessTo: htmlUrl)
        wkwebView.scrollView.showsVerticalScrollIndicator = false
    }
    
    private func loadDaumMap() {
        daumView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        daumView.delegate = self
        daumView.baseMapType = .standard
        daumView.isUserInteractionEnabled = false
        let mapPointGeo = MTMapPointGeo(latitude: 37.526804306404337, longitude: 126.96612433919596)
        let mapPoint = MTMapPoint(geoCoord: mapPointGeo)
        daumView.setMapCenter(mapPoint, zoomLevel: 7, animated: true)
        view.addSubview(daumView)
    }
    
}

extension MapViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let svgframe = svgView?.frame else {
            return
        }
        wkwebView.frame = svgframe
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        view.addSubview(wkwebView)
    }
    
}

extension MapViewController: MTMapViewDelegate {
    
    func mapView(_ mapView: MTMapView!, finishedMapMoveAnimation mapCenterPoint: MTMapPoint!) {
        guard let svgframe = svgView?.frame else {
            return
        }
        daumView.frame = svgframe
    }
    
    func mapView(_ mapView: MTMapView!, centerPointMovedTo mapCenterPoint: MTMapPoint!) {
        print(daumView.mapCenterPoint.mapPointGeo())
    }
    
    
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
