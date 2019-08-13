//
//  AViewController.swift
//  UrlProtol
//
//  Created by ken.zhang on 2019/2/18.
//  Copyright © 2019年 ken.zhang. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    @IBOutlet weak var textTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func go(_ sender: Any) {
        if let text = textTF.text, text.count > 0 {
            let b = BViewController()
            b.url = text
            self.navigationController?.pushViewController(b, animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
