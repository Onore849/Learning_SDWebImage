//
//  ViewController.swift
//  DownloadImage
//
//  Created by 野澤拓己 on 2020/09/02.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let urlString = "https://iosacademy.io/assets/images/brand/header.png"
    
    private let imageView: UIImageView = {
       
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.center = view.center
        
        fetchImage()
    }
    
    private func fetchImage() {
        // get data
        // convert the data to image
        // set image to image View
        guard let url = URL(string: urlString) else {
            return
        }
        
        let getDataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        }
        
        getDataTask.resume()
        
    }
    

}

