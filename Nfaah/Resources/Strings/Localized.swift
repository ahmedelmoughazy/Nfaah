// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// The utility of an application that delivers customer orders from restaurants, cafes, supermarkets, etc.. in the city of Aden.
  /// Through this application, we seek to gain the trust of our customers from all over the country by adopting a method that focuses on quality and customer satisfaction in the first place.
  /// Nafaa is one of the first applications that provide this type of service in the city of Aden, through an integrated and coordinated team distinguished by high efficiency and sincerity in performing tasks, and this is what we consider one of the secrets of success.
  internal static let about = L10n.tr("Localizable", "about", fallback: "The utility of an application that delivers customer orders from restaurants, cafes, supermarkets, etc.. in the city of Aden.\nThrough this application, we seek to gain the trust of our customers from all over the country by adopting a method that focuses on quality and customer satisfaction in the first place.\nNafaa is one of the first applications that provide this type of service in the city of Aden, through an integrated and coordinated team distinguished by high efficiency and sincerity in performing tasks, and this is what we consider one of the secrets of success.")
  internal enum Home {
    internal enum Screen {
      /// there are no requests
      internal static let noOrders = L10n.tr("Localizable", "home.screen.noOrders", fallback: "there are no requests")
      /// Localizable.strings
      ///   Channels
      /// 
      ///   Created by Ahmed Refaat on 4/3/20.
      ///   Copyright © 2020 Ibtikar. All rights reserved.
      internal static let title = L10n.tr("Localizable", "home.screen.title", fallback: "Order basket")
    }
  }
  internal enum Login {
    internal enum Screen {
      /// About Nafaa
      internal static let about = L10n.tr("Localizable", "login.screen.about", fallback: "About Nafaa")
      /// Are you a customer?
      internal static let client = L10n.tr("Localizable", "login.screen.client", fallback: "Are you a customer?")
      /// Contact us 
      internal static let contact = L10n.tr("Localizable", "login.screen.contact", fallback: "Contact us ")
      /// Login
      internal static let login = L10n.tr("Localizable", "login.screen.login", fallback: "Login")
      /// Create a new Account
      internal static let newLogin = L10n.tr("Localizable", "login.screen.newLogin", fallback: "Create a new Account")
    }
  }
  internal enum NewOrder {
    internal enum Screen {
      /// add image
      internal static let chooseImage = L10n.tr("Localizable", "newOrder.screen.chooseImage", fallback: "add image")
      /// choose delivery time
      internal static let deliveryTime = L10n.tr("Localizable", "newOrder.screen.deliveryTime", fallback: "choose delivery time")
      /// Done
      internal static let done = L10n.tr("Localizable", "newOrder.screen.done", fallback: "Done")
      /// Image added Successfully
      internal static let imageChoosen = L10n.tr("Localizable", "newOrder.screen.imageChoosen", fallback: "Image added Successfully")
      /// Phone
      internal static let mobile = L10n.tr("Localizable", "newOrder.screen.mobile", fallback: "Phone")
      /// Name
      internal static let name = L10n.tr("Localizable", "newOrder.screen.name", fallback: "Name")
      /// Where do you want to order from
      internal static let orderPlace = L10n.tr("Localizable", "newOrder.screen.orderPlace", fallback: "Where do you want to order from")
      /// Shop Address
      internal static let placeAddress = L10n.tr("Localizable", "newOrder.screen.placeAddress", fallback: "Shop Address")
      /// Shop Name
      internal static let placeName = L10n.tr("Localizable", "newOrder.screen.placeName", fallback: "Shop Name")
      /// raise a request
      internal static let submit = L10n.tr("Localizable", "newOrder.screen.submit", fallback: "raise a request")
      /// Site update
      internal static let yourLocation = L10n.tr("Localizable", "newOrder.screen.yourLocation", fallback: "Site update")
      /// Your Order
      internal static let yourOrder = L10n.tr("Localizable", "newOrder.screen.yourOrder", fallback: "Your Order")
      internal enum Order {
        /// An error occurred, try again later!
        internal static let error = L10n.tr("Localizable", "newOrder.screen.order.error", fallback: "An error occurred, try again later!")
        /// pending
        internal static let pending = L10n.tr("Localizable", "newOrder.screen.order.pending", fallback: "pending")
      }
    }
  }
  internal enum Order {
    internal enum Screen {
      /// Order Now
      internal static let newOrder = L10n.tr("Localizable", "order.screen.newOrder", fallback: "Order Now")
      internal enum Description {
        /// The Nafaa platform provides a unique online ordering experience with ease and security
        /// We receive your order with all the additional details and deliver it to you immediately.
        internal static let newOrder = L10n.tr("Localizable", "order.screen.description.newOrder", fallback: "The Nafaa platform provides a unique online ordering experience with ease and security\nWe receive your order with all the additional details and deliver it to you immediately.")
      }
      internal enum Title {
        /// New Order
        internal static let newOrder = L10n.tr("Localizable", "order.screen.title.newOrder", fallback: "New Order")
      }
    }
  }
  internal enum Profile {
    internal enum Screen {
      /// There is no WhatsApp application on your mobile phone
      internal static let noWhatsApp = L10n.tr("Localizable", "profile.screen.noWhatsApp", fallback: "There is no WhatsApp application on your mobile phone")
      /// My Account
      internal static let title = L10n.tr("Localizable", "profile.screen.title", fallback: "My Account")
      internal enum Alert {
        /// All user data will be lost.
        internal static let subTitle = L10n.tr("Localizable", "profile.screen.alert.subTitle", fallback: "All user data will be lost.")
        /// Are you sure ?
        internal static let title = L10n.tr("Localizable", "profile.screen.alert.title", fallback: "Are you sure ?")
      }
      internal enum TabSubTitle {
        /// Who we are ?
        internal static let about = L10n.tr("Localizable", "profile.screen.tabSubTitle.about", fallback: "Who we are ?")
        /// For any question
        internal static let contactUs = L10n.tr("Localizable", "profile.screen.tabSubTitle.contactUs", fallback: "For any question")
        /// Delete your account and return to the login page
        internal static let deleteAccount = L10n.tr("Localizable", "profile.screen.tabSubTitle.deleteAccount", fallback: "Delete your account and return to the login page")
        /// Log out of your account and return to the login page
        internal static let logout = L10n.tr("Localizable", "profile.screen.tabSubTitle.logout", fallback: "Log out of your account and return to the login page")
        /// Order Now
        internal static let newOrder = L10n.tr("Localizable", "profile.screen.tabSubTitle.newOrder", fallback: "Order Now")
        /// Site Visit
        internal static let ourSite = L10n.tr("Localizable", "profile.screen.tabSubTitle.ourSite", fallback: "Site Visit")
        /// Rate your experience with us
        internal static let rateUs = L10n.tr("Localizable", "profile.screen.tabSubTitle.rateUs", fallback: "Rate your experience with us")
        /// Share the application with your friends
        internal static let share = L10n.tr("Localizable", "profile.screen.tabSubTitle.share", fallback: "Share the application with your friends")
      }
      internal enum TabTitle {
        /// about us
        internal static let about = L10n.tr("Localizable", "profile.screen.tabTitle.about", fallback: "about us")
        /// Contact us
        internal static let contactUs = L10n.tr("Localizable", "profile.screen.tabTitle.contactUs", fallback: "Contact us")
        /// Delete Account
        internal static let deleteAccount = L10n.tr("Localizable", "profile.screen.tabTitle.deleteAccount", fallback: "Delete Account")
        /// Logout
        internal static let logout = L10n.tr("Localizable", "profile.screen.tabTitle.logout", fallback: "Logout")
        /// new Order
        internal static let newOrder = L10n.tr("Localizable", "profile.screen.tabTitle.newOrder", fallback: "new Order")
        /// Our Site
        internal static let ourSite = L10n.tr("Localizable", "profile.screen.tabTitle.ourSite", fallback: "Our Site")
        /// Rate
        internal static let rateUs = L10n.tr("Localizable", "profile.screen.tabTitle.rateUs", fallback: "Rate")
        /// Share
        internal static let share = L10n.tr("Localizable", "profile.screen.tabTitle.share", fallback: "Share")
      }
    }
  }
  internal enum Sign {
    internal enum Screen {
      /// or choose your preferred method of registration
      internal static let chooseWay = L10n.tr("Localizable", "sign.screen.chooseWay", fallback: "or choose your preferred method of registration")
      /// E-Mail
      internal static let email = L10n.tr("Localizable", "sign.screen.email", fallback: "E-Mail")
      /// Please fill in all fields
      internal static let emptyFields = L10n.tr("Localizable", "sign.screen.emptyFields", fallback: "Please fill in all fields")
      /// Full Name
      internal static let fullName = L10n.tr("Localizable", "sign.screen.fullName", fallback: "Full Name")
      /// Phone
      internal static let mobile = L10n.tr("Localizable", "sign.screen.mobile", fallback: "Phone")
      /// Password
      internal static let password = L10n.tr("Localizable", "sign.screen.password", fallback: "Password")
      /// Login
      internal static let title = L10n.tr("Localizable", "sign.screen.title", fallback: "Login")
      internal enum New {
        /// Create a new Account
        internal static let title = L10n.tr("Localizable", "sign.screen.new.title", fallback: "Create a new Account")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
