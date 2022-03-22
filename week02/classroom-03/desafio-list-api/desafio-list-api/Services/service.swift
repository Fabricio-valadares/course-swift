//
//  service.swift
//  desafio-list-api
//
//  Created by FL00027 on 21/03/22.
//

import Foundation

enum CardError: Error {
    case urlInvalid
    case noProcessdateio
    case noDataAvailable
}

protocol ServiceProtocol {
    func getByDataCard(completion: @escaping(Result<[Card], CardError>) -> Void)
}

class Service: ServiceProtocol {
    let session = URLSession.shared
    let url = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    
    static var shared: Service = {
        let instance = Service()
        
        return instance
    }()
    
    func getByDataCard(completion: @escaping(Result<[Card], CardError>) -> Void) {
        guard let url = URL(string: self.url) else { return completion(.failure(.urlInvalid)) }
        
        let dataUserCard = self.session.dataTask(with: url) {data, _, _ in
            
            
            do {
                
                guard let json = data else { return completion(.failure(.noDataAvailable)) }
                
                let decoder = JSONDecoder()
                
                
                let cardResponse = try decoder.decode([Card].self, from: json)
                
                completion(.success(cardResponse))
                
            } catch {
                completion(.failure(.noProcessdateio))
            }
        }
        
        dataUserCard.resume()
        
    }
}
