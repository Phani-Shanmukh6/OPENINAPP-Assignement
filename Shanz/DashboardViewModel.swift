//
//  DashboardViewModel.swift
//  Shanz
//
// 
//

import Foundation


class DashboardViewModel: ObservableObject {
    @Published var dashboardData: DashboardData?
    @Published var talkwithusText: String = ""
    @Published var questionmarkText: String = ""

    private let apiUrl = "https://api.inopenapp.com/api/v1/dashboardNew"
    private let bearerToken = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"

    func fetchDashboardData() {
        let headers = ["Authorization": bearerToken]

        NetworkManager.shared.fetchData(from: apiUrl, headers: headers) {[weak self] (result: Result<DashboardData, Error>) in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                self.dashboardData = data
            case .failure(let error):
                print("Error fetching dashboard data: \(error.localizedDescription)")
            }
        }
    }
}
