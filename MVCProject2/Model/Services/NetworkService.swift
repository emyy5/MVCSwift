//
//  NetworkService.swift
//  MVCProject2
//
//  Created by Eman Khaled on 21/09/2023.
//

import Foundation
protocol EmployeeProtocol {
    static func fetchResult(completionHandler: @escaping (MyResult?)->Void)
}
class NetworkService {
    static func fetchResult(completionHandler: @escaping (MyResult?)->Void){
        let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees")
        guard let newUrl = url else {
            return
        }
            let req = URLRequest(url: newUrl)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: req) { data, response, error in
                do {
                    let res = try JSONDecoder().decode(MyResult.self, from: data!)
                    completionHandler(res)
                }catch let error {
                    print(error)
                    completionHandler(nil)
                    
                }
            }
            task.resume()
            
        }
    }

