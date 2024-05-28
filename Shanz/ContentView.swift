//
//  ContentView.swift
//  Shanz
//
//  Created by Phani Shanmukh on 28/05/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = DashboardViewModel()
    @State private var showingTopLinks = true

    var body: some View {
        NavigationView {
            VStack {
                Text(greeting())
                    .font(.largeTitle)
                    .padding()

                if let data = viewModel.dashboardData, let chartData = data.data?.getChartData() {
                    LineChartView(data: chartData)
                        .padding(.bottom, 20)
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        QuickStatView(stat: "\(viewModel.dashboardData?.todayClicks ?? 0)", label: "Today's clicks", icon: "today_clicks_icon")
                        QuickStatView(stat: viewModel.dashboardData?.topLocation ?? "NA", label: "Top Location", icon: "location_icon")
                        QuickStatView(stat: viewModel.dashboardData?.topSource ?? "NA", label: "Top Source", icon: "source_icon")
                    }
                    .padding()
                }

                ViewAnalyticsButton()

                HStack {
                    Button("Top Links") {
                        withAnimation {
                            showingTopLinks = true
                        }
                    }
                    .modifier(ButtonStyleModifier(isSelected: showingTopLinks))

                    Button("Recent Links") {
                        withAnimation {
                            showingTopLinks = false
                        }
                    }
                    .modifier(ButtonStyleModifier(isSelected: !showingTopLinks))
                }
                .padding()

                if showingTopLinks {
                    ForEach(viewModel.dashboardData?.data?.topLinks ?? [], id: \.urlId) { link in
                        LinkView(link: link)
                    }
                } else {
                    ForEach(viewModel.dashboardData?.data?.recentLinks ?? [], id: \.urlId) { link in
                        LinkView(link: link)
                    }
                }

                Spacer()
            }
            .navigationTitle("Dashboard")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "globe")
                            .imageScale(.large)
                    }
                }
            }
            .onAppear {
                viewModel.fetchDashboardData()
            }
            .background(Color(red: 0.9608, green: 0.9608, blue: 0.9608))
            .listStyle(PlainListStyle())
        }
    }

    func greeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<12:
            return "Good Morning, Shanmukh"
        case 12..<17:
            return "Good Afternoon, Shanmukh"
        case 17..<22:
            return "Good Evening, Shanmukh"
        default:
            return "Good Night, Shanmukh"
        }
    }
}


struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
