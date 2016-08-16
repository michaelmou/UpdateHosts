//
//  HostsDetailController.swift
//  UpdateHosts
//
//  Created by Michael on 16/8/16.
//  Copyright © 2016年 MichaelMo. All rights reserved.
//

import UIKit

class HostsDetailController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = .None
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            if let path = HostsDownloader.pathOfAbsoluteString{
                let contentOfHosts = try! String.init(contentsOfURL: NSURL(string:path)!)
                
                dispatch_async(dispatch_get_main_queue(), {
                    let textView = UITextView(frame: self.view.bounds)
                    self.view.addSubview(textView)
                    
                    textView.text = contentOfHosts
                })
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
