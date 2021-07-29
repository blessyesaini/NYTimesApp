//
//  NewsListResultsViewModel.swift
//  NYTimesApp
//
//  Created by Blessy Elizabeth Saini on 7/28/21.
//

import Foundation

struct NewsListResultsViewModel {

    func getMostPupularNewsFeed(section:String,period:Int,completion:@escaping([Result]?) -> Void) {
        
     
      
        SessionHandlers.sessionHandler(url: getURL(section: section, period: period), parameters: nil, method: .get) { apiResponse in
            DispatchQueue.main.async {
            if apiResponse.status{
            guard let responseData = apiResponse.response as? Data else { return }
             let response =  try? JSONDecoder().decode(Results.self, from: responseData)
                completion(response?.results)
            }
            }
        }
    }
    
    func getURL(section:String,period:Int) -> URL {
        let urlString = WebserviceURL.mostPopularurl+"\(section)"+"/\(period).json"
        let queryItems = [URLQueryItem(name: "api-key", value: WebserviceURL.apiKey)]
        var urlComponents = URLComponents(string: urlString)
        urlComponents?.queryItems = queryItems
        let url = urlComponents?.url
        return url!
    }
}
