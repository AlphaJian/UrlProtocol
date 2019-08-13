//
//  BViewController.swift
//  UrlProtol
//
//  Created by ken.zhang on 2019/2/18.
//  Copyright © 2019年 ken.zhang. All rights reserved.
//

import UIKit
import WebKit
import SnapKit

class BViewController: UIViewController, URLSessionDelegate {
    var configuration: WKWebViewConfiguration {
        let _configuration = WKWebViewConfiguration()

        if #available(iOS 10.0, *) {
            _configuration.mediaTypesRequiringUserActionForPlayback = []
        } else {
            _configuration.requiresUserActionForMediaPlayback = false
        }
        _configuration.allowsInlineMediaPlayback = true

        return _configuration
    }

    var webView: WKWebView!

    var url: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "H5"

        clearCache()
        webView = WKWebView(frame: UIScreen.main.bounds, configuration: self.configuration)
        self.view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        print(url!)
        let request = URLRequest(url: URL(string: url!)!)
        webView.load(request)

    }

    func loadWeb(url: String) {

    }

    func clearCache() -> Void {
        URLCache.shared.removeAllCachedResponses();
        URLCache.shared.diskCapacity = 0;
        URLCache.shared.memoryCapacity = 0;
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
