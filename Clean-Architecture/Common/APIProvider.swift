//
//  APIProvider.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 13/2/2567 BE.
//

import Alamofire

class APIProvider {
    
    public static let shared = APIProvider()
    
    private var session: URLSession!
    private let domain = "https://intproj22.sit.kmutt.ac.th/kp1"
    
    func handler<D: Decodable>(path: APIConstant,
                headers: HTTPHeaders? = nil,
                 onSucess: @escaping (D) -> Void?,
                 onError: @escaping (Error) -> Void?,
                 onRetryNoInternet: (() -> Void)? = nil
    ) {
    
        AF.request(domain + path.url, method: path.method, parameters: path.requestBody, encoding: JSONEncoding.default, headers: headers).responseData { (response) in
            switch response.result {
            case .success(let success):
                let responseBody = String(data: success,encoding: .utf8) //UTF-8
                if let responseBody = try? JSONDecoder().decode(D.self, from: success) {
                    onSucess(responseBody)
                } else {
                    onError(NSError(domain: responseBody ?? "error", code: 400))
                }
            case .failure(let failure):
                onError(failure)
            }
        }
    }
    
}

enum APIConstant {
    
    case login(request: LoginModel.SendLogin.Request)
    case custom
    
    var requestBody: [String: Any]? {
        switch self {
        case .login(let request):
            return request.dictionary
        default:
            return nil
        }
    }
    
    
    var url: String {
        switch self {
        case .custom: ""
        case .login: "/api/token"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .custom: .get
        case .login: .post
        }
    }
}
