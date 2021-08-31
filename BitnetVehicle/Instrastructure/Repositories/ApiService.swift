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
            if(error != nil){
                DispatchQueue.main.async {
                    completion(nil, NetworkError(message: error!.localizedDescription.description))
                }
                return
            }
            
            guard let responseCode = (response as? HTTPURLResponse)?.statusCode else {
                DispatchQueue.main.async {
                    completion(nil, RequestError(message: "Bad response", code: 400))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, RequestError(message: "Bad data", code: 400))
                }
                return
            }
            
            if ((200...299).contains(responseCode)){
                let mfrs = ManufacturersDto.fromJson(json: data)
                DispatchQueue.main.async {
                    completion(mfrs, nil)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil, RequestError(code: responseCode))
                }
            }
        }
        
        task.resume()
    }
    
}
