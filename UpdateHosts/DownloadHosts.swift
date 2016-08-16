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
    static var pathOfHosts:String?
    static var pathOfAbsoluteString:String?
    
    static func downloadHosts(completion:((String?)->())?){
        
        Alamofire.request(.GET, URL).validate().responseString { response in
            if response.result.isSuccess, let content = response.result.value{
                print("download hosts succeed!")
                if let docURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .AllDomainsMask).first{
                    do {
                        var path = docURL.absoluteString
                        path += "/hosts"
                        try content.writeToURL(NSURL(string: path)!, atomically: true, encoding: NSUTF8StringEncoding)
                        print("written hosts succeed")
                        self.pathOfAbsoluteString = path
                        completion?(path)
                        
                        if let relativePath = docURL.relativePath{
                            HostsDownloader.pathOfHosts = relativePath + "/hosts"
                        }
                    
                    } catch let error{
                        print("error occu when writting a hosts.\(error)")
                        completion?(nil)
                    }
                }
            }
        }
    }
}