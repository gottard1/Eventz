//
//  ProfileHomeViewModel.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 05/04/24.
//

import Foundation

struct ProfileModel {
    let name: String
    let email: String
    let age: Int
    let followers: Int
    let following: Int
    let eventsAttended: Int
    let icon: String?
    let banner: String?
}


class ProfileHomeViewModel: ObservableObject {
    
    /// Mock
    var profile: ProfileModel = ProfileModel(
        name: "Fabio Assunção",
        email: "fabio.assuncao@eventz.com",
        age: 38,
        followers: 15000,
        following: 130,
        eventsAttended: 540,
        icon: nil,
        banner: nil)
    
}
