//
//  EditProfileViewModel.swift
//  SwayTweets
//
//  Created by Akyl Mukatay  on 23.06.2023.
//

import Foundation

enum EditProfileOptions: Int, CaseIterable {
    case fullname
    case username
    case bio

    var description: String {
        switch self {
        case .fullname: return "Name"
        case .username: return "Username"
        case .bio: return "Bio"
        }
    }
}

struct EditProfileViewModel {

    private let user: User
    let option: EditProfileOptions

    var titleText: String {
        return option.description
    }

    var optionValue: String? {
        switch option {

        case .fullname: return user.fullname
        case .username: return user.username
        case .bio: return user.bio
        }
    }

    var shouldHideTextField: Bool {
        return option == .bio
    }

    var shouldHideTextView: Bool {
        return option != .bio
    }

    var shouldHidePlaceholderLabel: Bool {
        return (user.bio ?? "") != ""
    }

    init(user: User, option: EditProfileOptions) {
        self.user = user
        self.option = option
    }
}

