//
//  Encodable+JSON.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 14/2/2567 BE.
//

import UIKit

extension Encodable {
    
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
