//
//  CovidData.swift
//  Covid Tracer
//
//  Created by Leo Leljak on 23/10/2020.
//

import UIKit

struct CovidData: Codable {
    let country: String
    let countryCode: String
    let province: String
    let city: String
    let cityCode, lat, lon: String
    let confirmed, deaths, recovered, active: Int
    let date: String

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case province = "Province"
        case city = "City"
        case cityCode = "CityCode"
        case lat = "Lat"
        case lon = "Lon"
        case confirmed = "Confirmed"
        case deaths = "Deaths"
        case recovered = "Recovered"
        case active = "Active"
        case date = "Date"
    }
}

struct HeaderData {
    let activeCases: String
    let deathCases: String
    let newCases: String
}

struct StatisticModel {
    let titleCell: String
    let todaysCases: String
    let yesterdayCases: String
    let trendImage: TrendImage
    let percentage: String
}

struct TrendImage {
    static let upTrend = UIImage(systemName: "arrow.up.right.circle")
    static let downTrend = UIImage(systemName: "arrow.down.backward.circle")
}

