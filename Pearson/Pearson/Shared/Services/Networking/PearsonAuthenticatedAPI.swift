//
//  PearsonAuthenticatedAPI.swift
//  Pearson
//
//  Created by Dmitriy Tsurkan on 11/13/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation
import Moya

// MARK: - Provider setup
private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

let pearsonAuthenticatedProvider = MoyaProvider<PearsonAuthenticatedAPI>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

// MARK: - Provider support
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}

public enum PearsonAuthenticatedAPI {
    case myCourses
}

extension PearsonAuthenticatedAPI: TargetType {
    
    public var baseURL: URL { return URL(string: "https://api.pulse.pearson.com")! }
    
    public var path: String {
        switch self {
        case .myCourses:
            return "/coursesection"
        }
    }
    public var method: Moya.Method {
       return .get
    }
    
    public var task: Task {
        return .requestParameters(parameters: ["schoolId": "5742722bca57901e00d6da44"], encoding: URLEncoding.default)
    }
    public var validate: Bool {
        return false
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var headers: [String: String]? {
        let token = XAppToken().token ?? ""
        return ["deviceid": "8d90d28e-9a4a-47ef-8be0-1cac12303ef0",
                "appversion": "appversion",
                "Authorization": "Bearer " + token]
    }
}

