////
////  LeaguesPresenter.swift
////  Sports-App
////
////  Created by MAC on 17/05/2025.
////
//import Foundation
//
//class LeaguesPresenter {
//    weak var vc : LeaguesViewProtocol!
//   
//    func attachView(MyController: LeaguesViewProtocol) {
//        vc = MyController
//    }
//
//    func fetchLeagues(for sport: SportType) {
//        let url = sport.url
//
//        NetworkService.fetchData(urlString: url, responseType: FLeagueResponse.self) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let data):
//                    self?.vc.displayLeagues(data.result)
//                case .failure(let error):
//                    self?.vc.showError(error.localizedDescription)
//                }
//            }
//        }
//    }
//}
