//
//  MyUrlProtocol.swift
//  UrlProtocol
//
//  Created by ken.zhang on 2019/8/13.
//  Copyright © 2019 ken.zhang. All rights reserved.
//

import Foundation

var requestCount = 0

class MyUrlProtocol: URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
//        if URLProtocol.property(forKey: "MyURLProtocolHandledKey", in: request) != nil {
//            return false
//        }
        print("---\(request.url?.absoluteString)")
        return true
    }

    override func startLoading() {
        print("start loading")
        print("---\(request.description)")
    }
}
