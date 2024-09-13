//
//  APIManager.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 9/13/24.
//

import Foundation

final class APIManager {

    static let shared = APIManager()
    private let networkHandler: NetworkHandler
    private let responseHandler: ResponseHandler

    private init(networkHandler: NetworkHandler = NetworkHandler(),
         responseHandler: ResponseHandler = ResponseHandler()) {
        self.networkHandler = networkHandler
        self.responseHandler = responseHandler
    }

    func request<T: Codable>(
        modelType: T.Type,
        type: APIEndPointType,
        completion: @escaping ResultHandler<T>
    ) {
        guard let url = type.url else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = type.method.rawValue

        if let parameters = type.body {
            request.httpBody = try? JSONEncoder().encode(parameters)
        }

        request.allHTTPHeaderFields = type.headers

        networkHandler.requestDataAPI(url: request) { result in
            switch result {
            case .success(let data):
                self.responseHandler.parseResponseDecode(
                    data: data,
                    modelType: modelType) { response in
                        switch response {
                        case .success(let mainResponse):
                            completion(.success(mainResponse))
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }


    static var defaultHeaders: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }

}
enum HTTPMethod: String {
    case GET
    case POST
    case DELETE
    case PUT
}

protocol APIEndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethod { get }
    var body: Encodable? { get }
    var headers: [String: String]? { get }
}
