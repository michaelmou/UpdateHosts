//
//  ViewController.swift
//  UpdateHosts
//
//  Created by MichaelMo on 8/16/16.
//  Copyright © 2016 MichaelMo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        HostsDownloader.downloadHosts { (hostsPath) in
            print(hostsPath)
            do{
                if let hostsContent = try? String.init(contentsOfURL: NSURL(string: hostsPath)!){
                    print(hostsContent)
                }
            }catch {
                
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

