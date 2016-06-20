//
//  API.swift
//  MultipartHTTP
//
//  Created by 丁暐哲 on 2016/6/18.
//  Copyright © 2016年 Din. All rights reserved.
//

import Foundation
import UIKit

class API{
    
    
    func ConnectAPI(completion:((Shots) -> Void)){
        let url = "https://test.wanting.athene.idv.tw/training/upload.php"
    
            let oneURL = NSURL(string: url)
            let session = NSURLSession.sharedSession()
            let request = NSMutableURLRequest(URL: oneURL!)
            request.HTTPMethod = "POST"
            
            let boundary = generateBoundaryString()
//            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
         request.setValue("multipart/form-data; charset=utf-8; boundary= \(boundary)", forHTTPHeaderField: "Content-Type")
        
            let fname = "cat11.png"
            let mimetype = "image/png"
        
            let body = NSMutableData()
        
        
        
            body.appendData("--\(boundary)\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
            body.appendData("Content-Disposition:form-data; name=\"upload\"; filename=\"\(fname)\"\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
            body.appendData("Content-Type: \(mimetype)\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
            body.appendData("Content-Transfer-Encoding: binary\r\n\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
        
            body.appendData(UIImagePNGRepresentation(UIImage(named: "cat11")!)!)
            body.appendData("\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
            body.appendData("--\(boundary)--\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
            request.HTTPBody = body

            let task = session.dataTaskWithRequest(request){(data, response, error)  in
                print("data = \(response)")
                
                do {
                    let shotData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
                    print("shotData = \(shotData)")
                    let somedata = Shots(data: shotData)
                    print(somedata)
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(somedata)
                    }
                    
                }catch{
                    print("inside error = \(error)")
                }
                
            }
            task.resume()
    }
    func generateBoundaryString() -> String
    {
        return "Boundary-\(NSUUID().UUIDString)"
    }
}