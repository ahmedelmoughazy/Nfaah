// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum Home {
    internal enum Screen {
      /// سلة الطلبات
      internal static let title = L10n.tr("Localizable", "home.screen.title")
    }
  }

  internal enum Login {
    internal enum Screen {
      /// عن نغعة
      internal static let about = L10n.tr("Localizable", "login.screen.about")
      /// هل انت عميل ؟
      internal static let client = L10n.tr("Localizable", "login.screen.client")
      /// تواصل معنا
      internal static let contact = L10n.tr("Localizable", "login.screen.contact")
      /// تسجيل الدخول
      internal static let login = L10n.tr("Localizable", "login.screen.login")
      /// تسجيل حساب جديد
      internal static let newLogin = L10n.tr("Localizable", "login.screen.newLogin")
    }
  }

  internal enum Order {
    internal enum Screen {
      internal enum Description {
        /// 
        internal static let newOrder = L10n.tr("Localizable", "order.screen.description.newOrder")
      }
      internal enum Title {
        /// طلب جديد
        internal static let newOrder = L10n.tr("Localizable", "order.screen.title.newOrder")
      }
    }
  }

  internal enum Profile {
    internal enum Screen {
      /// حسابى
      internal static let title = L10n.tr("Localizable", "profile.screen.title")
      internal enum TabSubTitle {
        /// من نحن ؟
        internal static let about = L10n.tr("Localizable", "profile.screen.tabSubTitle.about")
        /// لأى استفسار
        internal static let contactUs = L10n.tr("Localizable", "profile.screen.tabSubTitle.contactUs")
        /// الخروج من حسابك والعودة الى صفحة تسجيل الدخول
        internal static let logout = L10n.tr("Localizable", "profile.screen.tabSubTitle.logout")
        /// اطلب الان
        internal static let newOrder = L10n.tr("Localizable", "profile.screen.tabSubTitle.newOrder")
        /// زيارة الموقع
        internal static let ourSite = L10n.tr("Localizable", "profile.screen.tabSubTitle.ourSite")
        /// قيم تجربتك معنا
        internal static let rateUs = L10n.tr("Localizable", "profile.screen.tabSubTitle.rateUs")
        /// شارك التطبيق مع اصدقائك
        internal static let share = L10n.tr("Localizable", "profile.screen.tabSubTitle.share")
      }
      internal enum TabTitle {
        /// حولنا
        internal static let about = L10n.tr("Localizable", "profile.screen.tabTitle.about")
        /// تواصل معنا
        internal static let contactUs = L10n.tr("Localizable", "profile.screen.tabTitle.contactUs")
        /// تسجيل الخروج
        internal static let logout = L10n.tr("Localizable", "profile.screen.tabTitle.logout")
        /// طلب جديد
        internal static let newOrder = L10n.tr("Localizable", "profile.screen.tabTitle.newOrder")
        /// موقعنا
        internal static let ourSite = L10n.tr("Localizable", "profile.screen.tabTitle.ourSite")
        /// قيمنا
        internal static let rateUs = L10n.tr("Localizable", "profile.screen.tabTitle.rateUs")
        /// شاركنا
        internal static let share = L10n.tr("Localizable", "profile.screen.tabTitle.share")
      }
    }
  }

  internal enum Sign {
    internal enum Screen {
      /// أو إختر طريقتك المفضلة للتسجيل
      internal static let chooseWay = L10n.tr("Localizable", "sign.screen.chooseWay")
      /// البريد الإلكترونى
      internal static let email = L10n.tr("Localizable", "sign.screen.email")
      /// الإسم الكامل
      internal static let fullName = L10n.tr("Localizable", "sign.screen.fullName")
      /// رقم الموبايل
      internal static let mobile = L10n.tr("Localizable", "sign.screen.mobile")
      /// كلمة المرور
      internal static let password = L10n.tr("Localizable", "sign.screen.password")
      /// تسجيل الدخول
      internal static let title = L10n.tr("Localizable", "sign.screen.title")
      internal enum New {
        /// تسجيل حساب جديد
        internal static let title = L10n.tr("Localizable", "sign.screen.new.title")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
