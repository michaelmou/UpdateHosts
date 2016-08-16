//
//  DownloadHosts.swift
//  UpdateHosts
//
//  Created by MichaelMo on 8/16/16.
//  Copyright © 2016 MichaelMo. All rights reserved.
//

import Alamofire

class HostsDownloader {
    
    static let URL = "https://raw.githubusercontent.com/racaljk/hosts/master/hosts"
    
    static func downloadHosts(completion:((String)->())?){
        
        Alamofire.request(.GET, URL).validate().responseString { response in
            
            if response.result.isSuccess, let content = response.result.value{
                print("download hosts succeed!")
                if let docURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .AllDomainsMask).first{
                    do {
                        try content.writeToURL(docURL, atomically: true, encoding: NSUTF8StringEncoding)
                    }catch{
                        print("error occu when writting a hosts.")
                    }
                    print("written hosts succeed")
                    var path = docURL.absoluteString
                    path += "hosts"
                    completion?(path)
                }
                

            }
        }
        
        
    }
    
}