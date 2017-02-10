//
//  DetailViewController.swift
//  TumblrFeed
//
//  Created by Bconsatnt on 2/9/17.
//  Copyright © 2017 Bconsatnt. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var post : NSDictionary!
//    var refreshControl : UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(post)
        //set description
        if let des = post["caption"] as? String {
            let fixed = try! NSAttributedString (
                data: des.data(using: String.Encoding.unicode, allowLossyConversion: true)!,
                options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType],
                documentAttributes: nil)
            descriptionLabel.text = fixed.string
        } else { descriptionLabel.text = nil }
        
        //set photo
        if let photos = post.value(forKeyPath: "photos") as? [NSDictionary] {
            let imageUrlString = photos[0].value(forKeyPath: "original_size.url") as? String
            if let imageUrl = URL(string: imageUrlString!) {
                //print(imageUrl);
                imageView.setImageWith(imageUrl)
            } else {
                imageView = nil
            }
        } else {
            imageView = nil
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
