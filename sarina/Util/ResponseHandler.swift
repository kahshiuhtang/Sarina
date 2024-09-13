//
//  ResponseHandler.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 9/13/24.
//

import Foundation

class ResponseHandler {

    func parseResponseDecode<T: Decodable>(
        data: Data,
        modelType: T.Type,
        completionHandler: ResultHandler<T>
    ) {
        do {
            let userResponse = try JSONDecoder().decode(modelType, from: data)
            completionHandler(.success(userResponse))
        }catch {
            completionHandler(.failure(.decoding(error)))
        }
    }

}
