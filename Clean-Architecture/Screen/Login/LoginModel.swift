//
//  LoginModel.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

enum LoginModel {
    
    enum SendLogin {
        struct Request: Encodable {
            let username: String
            let password: String
        }
        
        struct Response {
            let dataResult: DataResult
        }
        
        struct ViewModel {
            let contentResult: ContentResult
        }
        
        enum DataResult {
            case success(name: String)
            case error(message: String)
        }
        
        enum ContentResult {
            case success(name: String)
            case error(message: String)
        }
    }
    
}
