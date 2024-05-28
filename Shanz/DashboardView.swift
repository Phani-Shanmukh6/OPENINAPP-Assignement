//
//  DashboardView.swift
//  Shanz
//
//  Created by Phani Shanmukh on 28/05/24.
//

import Foundation
import SwiftUI
import Charts

struct DashboardView: View {
    @ObservedObject var viewModel = DashboardViewModel()
    @State private var showingTopLinks = true

    var body: some View {
        NavigationView {
            List {
                VStack {
                    Text("Good morning, Shanmukh")
                        .font(.headline) 
                        .foregroundColor(.red) 
                    if let data = viewModel.dashboardData {
                        LineChartView(data: data.data?.getChartData() ?? sampleChartData())
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            QuickStatView(stat: "639", label: "Today's clicks", icon: "today_clicks_icon")
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
                            // Action
                        }) {
                            Image("nav_icon")
                                .imageScale(.large)
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchDashboardData()
                }
            }
            .background(Color(red: 0.8, green: 0.9, blue: 1.0)) 
            .listStyle(PlainListStyle())
        }
    }

}
