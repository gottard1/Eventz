//
//  NetworkManager.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 09/10/23.
//

import Foundation

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
}

struct HTTPError: Error, Codable {
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message = "error"
    }
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    func downloadImage(from urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Erro ao converter String para URL")
            completion(nil)
            return
        }
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            completion(cachedResponse.data)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Erro ao baixar a imagem: \(error?.localizedDescription ?? "Erro desconhecido")")
                completion(nil)
                return
            }
            
            let cachedResponse = CachedURLResponse(response: response!, data: data)
            URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: url))

            completion(data)
        }.resume()
    }
    
    func request<T: Decodable>(
        httpMethod: HTTPMethod,
        endpoint: Endpoint,
        body: Encodable? = nil,
        responseType: T.Type? = nil
    ) async throws -> T? {
        guard let baseUrl = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String,
              let url = URL(string: baseUrl + endpoint.rawValue) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.timeoutInterval = 10
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let body = body {
            let jsonData = try JSONEncoder().encode(body)
            request.httpBody = jsonData
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, (400...499).contains(httpResponse.statusCode) {
            if let apiError = try? JSONDecoder().decode(HTTPError.self, from: data) {
                throw apiError
            } else {
                throw NSError(domain: "Unknown", code: (response as? HTTPURLResponse)?.statusCode ?? -1)
            }
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}
