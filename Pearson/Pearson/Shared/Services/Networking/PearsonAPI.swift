//
//  PearsonAPI.swift
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

let pearsonProvider = MoyaProvider<PeasonAPI>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

// MARK: - Provider support
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum PeasonAPI {
    case auth(login: String, password: String)
    case getUserProfile
}

extension PeasonAPI: TargetType {
    
    public var baseURL: URL { return URL(string: "http://auth.pulse.pearson.com/user")! }
    
    public var path: String {
        switch self {
        case .auth:
            return "/authenticate"
        case .getUserProfile:
            return ""
        }
    }
    public var method: Moya.Method {
        switch self {
        case .auth:
            return .post
        case .getUserProfile:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .auth(let login, let password):
            return .requestParameters(parameters: ["username": login, "password": password], encoding: JSONEncoding.default)
        case .getUserProfile:
            return .requestPlain
        }
    }
    public var validate: Bool {
        return false
    }
    
    public var sampleData: Data {
       return Data()
    }
    
    public var headers: [String: String]? {
        var headers = ["deviceid": "8d90d28e-9a4a-47ef-8be0-1cac12303ef0", "appversion": "appversion"]
        switch self {
        case .auth:
            return headers
        case .getUserProfile:
            let token = XAppToken().token ?? ""
            headers["Authorization"] = "Bearer " + token
            return headers
        }
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

// MARK: - Response Handlers
extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}
