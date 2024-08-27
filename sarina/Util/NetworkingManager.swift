//
//  NetworkingManager.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 8/26/24.
//

import Foundation

final class NetworkManager{
    static let shared = NetworkManager()
    static let baseURL = "localhost:8005/"
    private let taskURL = baseURL + "/api/v1/task"
    private let stickerURL = baseURL + "/api/v1/sticker"
    private init(){}
    
    func getTasks(completed: @escaping(Result<[UserTask], SRError>) -> Void){
        guard let url = URL(string: taskURL) else {
            completed(.failure(.invalidURL))
            return
        }
        let tsk = URLSession.shared.dataTask(with: URLRequest(url: url)) {
            data, response, error in
            guard let _ = error else {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(UserTasksResponse.self, from: data)
                completed(.success(decodedResponse.request))
            }catch {
                completed(.failure(.invalidData))
            }
        }
        tsk.resume()
    }
    
}
