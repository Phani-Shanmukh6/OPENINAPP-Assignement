//
//  LineChartView.swift
//  Shanz
//
//  Created by Phani Shanmukh on 28/05/24.
//


import Foundation
import SwiftUI
import Charts

struct ChartData {
    var month: String
    var value: Double
}

struct LineChartView: View {
    var data = [ChartData]()

    var body: some View {
        VStack {
            Chart {
                ForEach(data, id: \.month) { point in
                    LineMark(
                        x: .value("Month", point.month),
                        y: .value("Value", point.value)
                    )
                }
            }
            .frame(height: 210)
            .padding([.top, .leading], 20)
            .background(RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 0.9, green: 1.0, blue: 0.9)) 
                            .shadow(radius: 5))
            .padding(.horizontal)
        }
        .chartYAxis {
            AxisMarks(preset: .automatic, position: .leading) {
                AxisGridLine()
                AxisValueLabel()
            }
        }
        .chartXAxis {
            AxisMarks(preset: .automatic, position: .bottom) {
                AxisGridLine()
                AxisValueLabel()
            }
        }
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView(data: sampleChartData())
    }
}
