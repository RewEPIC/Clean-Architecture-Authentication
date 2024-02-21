//
//  TokenDecodable.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 14/2/2567 BE.
//

import UIKit

enum DecodeErrors: Error {
    case badToken
    case other
}

class TokenDecoder {
    
    private func base64Decode(_ base64: String) throws -> Data? {
        let base64 = base64
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        let padded = base64.padding(toLength: ((base64.count + 3) / 4) * 4, withPad: "=", startingAt: 0)
        guard let decoded = Data(base64Encoded: padded) else {
            return nil
        }
        return decoded
    }
    
    func decode<T: Decodable>(token jwt: String,as type: T.Type) -> T? {
        let segments = jwt.components(separatedBy: ".")
        guard segments.count >= 3 else { return nil }
        guard let bodyData = try? base64Decode(segments[1]) else { return nil }
        return try? JSONDecoder().decode(T.self, from: bodyData)
    }
    
    func decode(token jwt: String) -> [String: Any]? {
        let segments = jwt.components(separatedBy: ".")
        guard let bodyData = try? base64Decode(segments[1]) else { return nil }
        return try? JSONSerialization.jsonObject(with: bodyData, options: []) as? [String: Any]
        
    }
}
