//
//  ApiService.swift
//  BitnetVehicle
//
//  Created by Borbély Viktor on 2021. 08. 30..
//

import Foundation

class ApiService : URLSessionDataTask, URLSessionDelegate {
    let mfrUrl = "https://vpic.nhtsa.dot.gov/api/vehicles/getallmanufacturers?format=json&page=2"
    private let session : URLSession
    
    override init(){
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    
    func getManufacturers(completion: @escaping ( ManufacturersDto?, Error?) -> (Void) ) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: mfrUrl)!
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error", error)
                DispatchQueue.main.async {
                    completion(nil, RequestError(message: error.localizedDescription, code: 400))
                }
            }
            
            guard let responseCode = (response as? HTTPURLResponse)?.statusCode else {
                print("not a HTTP response")
                return
            }
            
            guard let data = data else {
                print("bad data")
                return
            }
            
            if ((200...299).contains(responseCode)){
                let mfrs = ManufacturersDto.fromJson(json: data)
                DispatchQueue.main.async {
                    completion(mfrs, nil)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil, RequestError(code: 400))
                }
            }
        }
        
        task.resume()
    }
    
}
