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

class BViewController: UIViewController, URLSessionDelegate, WKNavigationDelegate {
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
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        print(url!)
        let request = URLRequest(url: URL(string: url!)!)

        if let response = URLCache.shared.cachedResponse(for: request) {
            webView.load(response.data, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: URL(string: url!)!)
        } else {
            webView.load(request)
        }


    }

    func loadWeb(url: String) {

    }

    func clearCache() -> Void {
        URLCache.shared.removeAllCachedResponses();
        URLCache.shared.diskCapacity = 0;
        URLCache.shared.memoryCapacity = 0;
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish")
        let url = webView.url
        if let url = webView.url {
            let request = URLRequest(url: url)
            let data = try? Data(contentsOf: url)
            let cache = URLCache.shared
            let response = URLResponse(url: url, mimeType: "text/html", expectedContentLength: 0, textEncodingName: "UTF-8")

            let cResponse = CachedURLResponse(response: response, data: data!)

            cache.storeCachedResponse(cResponse, for: request)

        }

    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("start")
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("error\(error.localizedDescription)")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("failP\(error.localizedDescription)")
    }

}
