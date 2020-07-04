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
      /// لا يوجد طلبات
      internal static let noOrders = L10n.tr("Localizable", "home.screen.noOrders")
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

  internal enum NewOrder {
    internal enum Screen {
      /// اضافة صورة
      internal static let chooseImage = L10n.tr("Localizable", "newOrder.screen.chooseImage")
      /// اختار وقت التسليم
      internal static let deliveryTime = L10n.tr("Localizable", "newOrder.screen.deliveryTime")
      /// تم
      internal static let done = L10n.tr("Localizable", "newOrder.screen.done")
      /// تمت اضافة صورة
      internal static let imageChoosen = L10n.tr("Localizable", "newOrder.screen.imageChoosen")
      /// رقم الهاتف
      internal static let mobile = L10n.tr("Localizable", "newOrder.screen.mobile")
      /// الاسم
      internal static let name = L10n.tr("Localizable", "newOrder.screen.name")
      /// من اين تريد الطلب
      internal static let orderPlace = L10n.tr("Localizable", "newOrder.screen.orderPlace")
      /// عنوان المحل
      internal static let placeAddress = L10n.tr("Localizable", "newOrder.screen.placeAddress")
      /// اسم المحل
      internal static let placeName = L10n.tr("Localizable", "newOrder.screen.placeName")
      /// رفع الطلب
      internal static let submit = L10n.tr("Localizable", "newOrder.screen.submit")
      /// تحديث الموقع
      internal static let yourLocation = L10n.tr("Localizable", "newOrder.screen.yourLocation")
      /// طلبك
      internal static let yourOrder = L10n.tr("Localizable", "newOrder.screen.yourOrder")
      internal enum Order {
        /// قيد الإنتظار
        internal static let pending = L10n.tr("Localizable", "newOrder.screen.order.pending")
      }
    }
  }

  internal enum Order {
    internal enum Screen {
      /// اطلب الان
      internal static let newOrder = L10n.tr("Localizable", "order.screen.newOrder")
      internal enum Description {
        /// توفر منصة نفعة تجربة فريدة للطلب عبر الانترنت بكل سهولة وأمان\nنستقبل طلبك مع كافة التفاصيل الاضافية ونقوم بتوصيله اليك حالا.
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
      /// الرجاء ملئ كافة الخانات
      internal static let emptyFields = L10n.tr("Localizable", "sign.screen.emptyFields")
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
