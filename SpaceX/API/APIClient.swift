//
//  APIClient.swift
//  SpaceX
//
// 
//

import Foundation
import Alamofire
import KRProgressHUD

class APIClient {
    
    static func webserviceForLaunches(completion:@escaping([LaunchDataModel]) -> Void){
        if !NetworkReachabilityManager()!.isReachable{
            GlobalObj.displayLoader(true, show: false)
            GlobalObj.showNetworkAlert()
            return
        }
        let url = base_url + get_all_launches
        
        AF.request(url, method: .get)
            .responseJSON { response in
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do{
                    let objRes: [LaunchDataModel] = try JSONDecoder().decode([LaunchDataModel].self, from: dataResponse)
                    switch response.result{
                    case .success( _):
                        completion(objRes)
                    case .failure(let error):
                        print(error)
                        GlobalObj.displayLoader(true, show: false)
                        
                    }
                }catch let error{
                    print(error)
                    GlobalObj.displayLoader(true, show: false)
                    
                }
            }
    }
    static func webserviceForPastLaunches(completion:@escaping([LaunchDataModel]) -> Void){
        if !NetworkReachabilityManager()!.isReachable{
            GlobalObj.displayLoader(true, show: false)
            GlobalObj.showNetworkAlert()
            return
        }
        let url = base_url + get_past_launches
        
        AF.request(url, method: .get)
            .responseJSON { response in
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do{
                    let objRes: [LaunchDataModel] = try JSONDecoder().decode([LaunchDataModel].self, from: dataResponse)
                    switch response.result{
                    case .success( _):
                        completion(objRes)
                    case .failure(let error):
                        print(error)
                        GlobalObj.displayLoader(true, show: false)
                        
                    }
                }catch let error{
                    print(error)
                    GlobalObj.displayLoader(true, show: false)
                    
                }
            }
    }
    static func webserviceForUpcomingLaunches(completion:@escaping([LaunchDataModel]) -> Void){
        if !NetworkReachabilityManager()!.isReachable{
            GlobalObj.displayLoader(true, show: false)
            GlobalObj.showNetworkAlert()
            return
        }
        let url = base_url + get_upcoming_launches
        
        AF.request(url, method: .get)
            .responseJSON { response in
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do{
                    let objRes: [LaunchDataModel] = try JSONDecoder().decode([LaunchDataModel].self, from: dataResponse)
                    switch response.result{
                    case .success( _):
                        completion(objRes)
                    case .failure(let error):
                        print(error)
                        GlobalObj.displayLoader(true, show: false)
                        
                    }
                }catch let error{
                    print(error)
                    GlobalObj.displayLoader(true, show: false)
                    
                }
            }
    }
    
    static func webserviceForNextLaunches(completion:@escaping([LaunchDataModel]) -> Void){
        if !NetworkReachabilityManager()!.isReachable{
            GlobalObj.displayLoader(true, show: false)
            GlobalObj.showNetworkAlert()
            return
        }
        let url = base_url + get_next_launches
        
        AF.request(url, method: .get)
            .responseJSON { response in
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do{
                    let objRes: [LaunchDataModel] = try JSONDecoder().decode([LaunchDataModel].self, from: dataResponse)
                    switch response.result{
                    case .success( _):
                        completion(objRes)
                    case .failure(let error):
                        print(error)
                        GlobalObj.displayLoader(true, show: false)
                        
                    }
                }catch let error{
                    print(error)
                    GlobalObj.displayLoader(true, show: false)
                    
                }
            }
    }
    static func webserviceForRockets(completion:@escaping([SpaceXRocket]) -> Void){
        if !NetworkReachabilityManager()!.isReachable{
            GlobalObj.displayLoader(true, show: false)
            GlobalObj.showNetworkAlert()
            return
        }
        let url = base_url + get_all_rockets
        
        AF.request(url, method: .get)
            .responseJSON { response in
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do{
                    let objRes: [SpaceXRocket] = try JSONDecoder().decode([SpaceXRocket].self, from: dataResponse)
                    switch response.result{
                    case .success( _):
                        completion(objRes)
                    case .failure(let error):
                        print(error)
                        GlobalObj.displayLoader(true, show: false)
                        
                    }
                }catch let error{
                    print(error)
                    GlobalObj.displayLoader(true, show: false)
                    
                }
            }
    }
    static func webserviceForHistory(completion:@escaping([HistoryDataModel]) -> Void){
        if !NetworkReachabilityManager()!.isReachable{
            GlobalObj.displayLoader(true, show: false)
            GlobalObj.showNetworkAlert()
            return
        }
        let url = base_url + get_history
        
        AF.request(url, method: .get)
            .responseJSON { response in
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do{
                    let objRes: [HistoryDataModel] = try JSONDecoder().decode([HistoryDataModel].self, from: dataResponse)
                    switch response.result{
                    case .success( _):
                        completion(objRes)
                    case .failure(let error):
                        print(error)
                        GlobalObj.displayLoader(true, show: false)
                        
                    }
                }catch let error{
                    print(error)
                    GlobalObj.displayLoader(true, show: false)
                    
                }
            }
    }
    static func webserviceForMissions(completion:@escaping([MissionModel]) -> Void){
        if !NetworkReachabilityManager()!.isReachable{
            GlobalObj.displayLoader(true, show: false)
            GlobalObj.showNetworkAlert()
            return
        }
        let url = base_url + get_mission
        
        AF.request(url, method: .get)
            .responseJSON { response in
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do{
                    let objRes: [MissionModel] = try JSONDecoder().decode([MissionModel].self, from: dataResponse)
                    switch response.result{
                    case .success( _):
                        completion(objRes)
                    case .failure(let error):
                        print(error)
                        GlobalObj.displayLoader(true, show: false)
                        
                    }
                }catch let error{
                    print(error)
                    GlobalObj.displayLoader(true, show: false)
                    
                }
            }
    }
    
}
