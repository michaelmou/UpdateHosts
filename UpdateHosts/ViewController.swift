//
//  ViewController.swift
//  UpdateHosts
//
//  Created by MichaelMo on 8/16/16.
//  Copyright © 2016 MichaelMo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    @IBOutlet weak var buttonOfViewDetail: UIButton!
    @IBOutlet weak var buttonOfCopy: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonOfUpdateDidTap(button: UIButton) {
        
        button.hidden = true
        self.activityIndecator.startAnimating()
        HostsDownloader.downloadHosts { (hostsPath) in
            print(hostsPath)
            
            if let hostsPath = hostsPath, let _ = try? String.init(contentsOfURL: NSURL(string: hostsPath)!){
                self.buttonOfViewDetail.hidden = false
                self.buttonOfCopy.hidden = false
            }
            
            button.hidden = false
            self.activityIndecator.stopAnimating()
        }
        
    }

    @IBAction func buttonOfViewHostsDidTap(sender: AnyObject) {
        self.navigationController?.pushViewController(HostsDetailController(), animated: true)
    }
    
    @IBAction func buttonOfCopyDidTap(sender: AnyObject) {
        if let path = HostsDownloader.pathOfHosts{
            UIPasteboard.generalPasteboard().string = path
            let alert = UIAlertController(title: "", message: "copied the hosts' path to the pastboard", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "ok", style: .Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
}

