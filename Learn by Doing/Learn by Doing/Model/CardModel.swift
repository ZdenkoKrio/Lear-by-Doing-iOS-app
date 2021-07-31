//
//  CardModel.swift
//  Learn by Doing
//
//  Created by Zdenko Čepan on 01/08/2021.
//

import SwiftUI

struct Card: Identifiable {
    let id: UUID
    let title: String
    let headline: String
    let image: String
    let callToAction: String
    let message: String
    let gradientColors: [Color]
}
