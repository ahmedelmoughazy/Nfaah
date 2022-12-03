// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Colors {
    internal static let bahamaBlue = ColorAsset(name: "BahamaBlue")
    internal static let manateeColor = ColorAsset(name: "ManateeColor")
    internal static let sharkColor = ColorAsset(name: "SharkColor")
    internal static let silverColor = ColorAsset(name: "SilverColor")
    internal static let tunaColor = ColorAsset(name: "TunaColor")
  }
  internal enum Images {
    internal static let about = ImageAsset(name: "about")
    internal static let backArrow = ImageAsset(name: "back_arrow")
    internal static let checklist1 = ImageAsset(name: "checklist (1)")
    internal static let checklist2 = ImageAsset(name: "checklist (2)")
    internal static let clock = ImageAsset(name: "clock")
    internal static let close = ImageAsset(name: "close")
    internal static let delete = ImageAsset(name: "delete")
    internal static let fries = ImageAsset(name: "fries")
    internal static let group = ImageAsset(name: "group")
    internal static let icMail = ImageAsset(name: "icMail")
    internal static let icArrowRight = ImageAsset(name: "ic_arrow-right")
    internal static let icAssetsLback = ImageAsset(name: "ic_assets_lback")
    internal static let icCartSelected = ImageAsset(name: "ic_cart_selected")
    internal static let icCartUnselected = ImageAsset(name: "ic_cart_unselected")
    internal static let icFacebook = ImageAsset(name: "ic_facebook")
    internal static let icGmail = ImageAsset(name: "ic_gmail")
    internal static let icHomeSelected = ImageAsset(name: "ic_home_selected")
    internal static let icHomeUnselected = ImageAsset(name: "ic_home_unselected")
    internal static let icTabbarSelectedProfile = ImageAsset(name: "ic_tabbar_selected_profile")
    internal static let icTabbarUnselectedProfile = ImageAsset(name: "ic_tabbar_unselected_profile")
    internal static let icons8AddImage48 = ImageAsset(name: "icons8-add-image-48")
    internal static let icons8Google32 = ImageAsset(name: "icons8-google-32")
    internal static let icons8Time52 = ImageAsset(name: "icons8-time-52")
    internal static let logo = ImageAsset(name: "logo")
    internal static let logout = ImageAsset(name: "logout")
    internal static let orderForm = ImageAsset(name: "order_form")
    internal static let placeholder = ImageAsset(name: "placeholder")
    internal static let profilePlaceholder = ImageAsset(name: "profile_placeholder")
    internal static let rate = ImageAsset(name: "rate")
    internal static let share = ImageAsset(name: "share")
    internal static let shoppingList = ImageAsset(name: "shopping-list")
    internal static let support = ImageAsset(name: "support")
    internal static let website = ImageAsset(name: "website")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = Color(asset: self)

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
