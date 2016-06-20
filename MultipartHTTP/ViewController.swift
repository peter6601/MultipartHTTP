//
//  ViewController.swift
//  MultipartHTTP
//
//  Created by 丁暐哲 on 2016/6/18.
//  Copyright © 2016年 Din. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let api = API()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var msglabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    @IBAction func selectPicture(sender: UIButton) {
        let ImagePicker = UIImagePickerController()
        ImagePicker.delegate = self
        ImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(ImagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        photoImage.image = image
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    @IBAction func upload_request(sender: UIButton) {
        api.ConnectAPI(loaddata)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    func loaddata(data:Shots){
        nameLabel.text! = "name = \((data.datas?.name)!)"
        sizeLabel.text! = "size = \((data.datas?.size)!) KBS"
        typeLabel.text = "type = \((data.datas?.type)!)"
        msglabel.text = "msg = \(data.msg)"
        statusLabel.text! = "status = \(data.status)"
    }

}

