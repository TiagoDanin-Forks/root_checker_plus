/// A Flutter plugin for detecting rooted Android devices and jailbroken iOS devices.
/// 
/// This library provides cross-platform functionality to detect:
/// - Rooted Android devices using RootBeer library
/// - Jailbroken iOS devices using DTTJailbreakDetection library  
/// - Android developer mode status
library root_checker_plus;

import 'package:flutter/services.dart';

/// Main class for root and jailbreak detection functionality.
/// 
/// Provides static methods to check device security status across
/// Android and iOS platforms.
class RootCheckerPlus {
  /// Private constructor to prevent instantiation.
  /// 
  /// This class only provides static methods and should not be instantiated.
  RootCheckerPlus._();
  
  static const MethodChannel _channel = MethodChannel('root_checker_plus');

  /// Checks if the Android device is rooted.
  /// 
  /// Uses the RootBeer library to perform comprehensive root detection
  /// including checking for:
  /// - Root management apps
  /// - Dangerous props
  /// - Root native binaries
  /// - RW paths
  /// 
  /// Returns `true` if the device is rooted, `false` otherwise.
  /// Returns `false` if the check fails or if called on non-Android platforms.
  /// 
  /// Example:
  /// ```dart
  /// bool isRooted = await RootCheckerPlus.isRootChecker() ?? false;
  /// if (isRooted) {
  ///   print('Device is rooted');
  /// }
  /// ```
  static Future<bool?> isRootChecker() async {
    final bool? isRootChecker = await _channel.invokeMethod('isRootChecker');
    return isRootChecker ?? false;
  }

  /// Checks if Android developer options are enabled.
  /// 
  /// Detects whether the developer options are currently enabled
  /// on the Android device, which can indicate potential security risks.
  /// 
  /// Returns `true` if developer mode is enabled, `false` otherwise.
  /// Returns `false` if the check fails or if called on non-Android platforms.
  /// 
  /// Example:
  /// ```dart
  /// bool devModeEnabled = await RootCheckerPlus.isDeveloperMode() ?? false;
  /// if (devModeEnabled) {
  ///   print('Developer mode is enabled');
  /// }
  /// ```
  static Future<bool?> isDeveloperMode() async {
    final bool? isDeveloperMode =
        await _channel.invokeMethod('isDeveloperMode');
    return isDeveloperMode ?? false;
  }

  /// Checks if the iOS device is jailbroken.
  /// 
  /// Uses the DTTJailbreakDetection library to detect jailbreak status
  /// by checking for:
  /// - Jailbreak files and directories
  /// - Cydia and other jailbreak apps
  /// - System modifications
  /// 
  /// Returns `true` if the device is jailbroken, `false` otherwise.
  /// Returns `false` if the check fails or if called on non-iOS platforms.
  /// 
  /// Example:
  /// ```dart
  /// bool isJailbroken = await RootCheckerPlus.isJailbreak() ?? false;
  /// if (isJailbroken) {
  ///   print('Device is jailbroken');
  /// }
  /// ```
  static Future<bool?> isJailbreak() async {
    bool? isJailbreak = await _channel.invokeMethod('isJailbreak');
    return isJailbreak ?? false;
  }
}
