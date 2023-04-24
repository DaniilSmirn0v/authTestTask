// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Alert {
    /// Error
    internal static let errorTitle = L10n.tr("Localizable", "Alert.errorTitle", fallback: "Error")
    /// You want to exit, are you sure?
    internal static let exitMessage = L10n.tr("Localizable", "Alert.exitMessage", fallback: "You want to exit, are you sure?")
    /// Success
    internal static let successTitle = L10n.tr("Localizable", "Alert.successTitle", fallback: "Success")
    internal enum Actions {
      /// Cancel
      internal static let cancelAction = L10n.tr("Localizable", "Alert.Actions.cancelAction", fallback: "Cancel")
      /// Exit
      internal static let extiAction = L10n.tr("Localizable", "Alert.Actions.extiAction", fallback: "Exit")
      /// Ok
      internal static let okAction = L10n.tr("Localizable", "Alert.Actions.okAction", fallback: "Ok")
    }
  }
  internal enum AuthError {
    /// Something went wrong...
    internal static let unknownError = L10n.tr("Localizable", "AuthError.unknownError", fallback: "Something went wrong...")
  }
  internal enum Authorization {
    /// Localizable.strings
    ///   authTestTask
    /// 
    ///   Created by Daniil on 24.04.2023.
    internal static let login = L10n.tr("Localizable", "Authorization.login", fallback: "Login with VK")
  }
  internal enum Error {
    /// Data conversion error "%@"
    internal static func decoding(_ p1: Any) -> String {
      return L10n.tr("Localizable", "Error.decoding", String(describing: p1), fallback: "Data conversion error \"%@\"")
    }
    /// Data is empty
    internal static let emptyData = L10n.tr("Localizable", "Error.emptyData", fallback: "Data is empty")
    /// Error "%@"
    internal static func invalidStatusCode(_ p1: Any) -> String {
      return L10n.tr("Localizable", "Error.invalidStatusCode", String(describing: p1), fallback: "Error \"%@\"")
    }
    /// Unknown error
    internal static let unknown = L10n.tr("Localizable", "Error.unknown", fallback: "Unknown error")
  }
  internal enum Main {
    /// Exit
    internal static let exit = L10n.tr("Localizable", "Main.exit", fallback: "Exit")
    /// MobileUp Gallery
    internal static let mobileup = L10n.tr("Localizable", "Main.mobileup", fallback: "MobileUp Gallery")
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
