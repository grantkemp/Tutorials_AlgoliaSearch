//
//  ViewController.swift
//  Algolia
//
//  Created by Grant Kemp on 14/10/2015.
//  Copyright © 2015 Grant Kemp. All rights reserved.
//

import UIKit
import AlgoliaSearch

//Based on https://www.algolia.com/doc/tutorials/ios-instant-search#UI

class ViewController: UIViewController {

    let client = AlgoliaSearch.Client(appID: "KX5XYTCNAY", apiKey: "67d8b75247f3b87368159e06eaba546b")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

