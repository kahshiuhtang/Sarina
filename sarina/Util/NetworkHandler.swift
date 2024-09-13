//
//  NetworkHandler.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 9/13/24.
//

import Foundation

class NetworkHandler {

    func requestDataAPI(
        url: URLRequest,
        completionHandler: @escaping (Result<Data, NetworkError>) -> Void
    ) {
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                  switch response.statusCode {
                      case 400 ..< 500: completionHandler(.failure(.network(error)))
                        case 500 ..< 600: completionHandler(.failure(.serverError))
                        default: break
                   }
                return
            }

            guard let data, error == nil else {
                completionHandler(.failure(.invalidData))
                return
            }

            completionHandler(.success(data))
        }
        session.resume()
    }

}
