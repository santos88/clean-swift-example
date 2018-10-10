//
//  BreedsAPI.swift
//  DogsApiCleanSwiftExample
//
//  Created by Santos Ramon on 10/10/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import Foundation

struct BreedsApiResponseModel: Codable {
    var status: String
    var message: [String]
}

enum BreedServices {
    case listAllBreeds
    case listPictures(breed:String)

    var url: URL {
        switch self {
        case .listAllBreeds:
            return URL(string: "https://dog.ceo/api/breeds/list")!
        case .listPictures(let breed):
            return URL(string: "https://dog.ceo/api/" + breed + "/list")!
        }
    }
}

class BreedsAPI {

    static let shared = BreedsAPI()

    func listAll(service: BreedServices, completion: @escaping (BreedsApiResponseModel?, Error?) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: service.url) {
            (data, response, error) in

            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let parsedServerResponse = try decoder.decode(BreedsApiResponseModel.self, from: data)
                completion(parsedServerResponse, nil)
            } catch let err {
                completion(nil, err)
            }
        }
        task.resume()
    }


}
