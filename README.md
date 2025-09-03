# Root Checker Plus

A Flutter plugin for detecting rooted Android devices and jailbroken iOS devices.

## Features

- **Android Root Detection**: Uses [RootBeer](https://github.com/scottyab/rootbeer) library
- **iOS Jailbreak Detection**: Uses [DTTJailbreakDetection](https://github.com/thii/DTTJailbreakDetection) library
- **Developer Mode Detection**: Check if Android developer options are enabled
- **Cross-platform**: Works on both Android and iOS

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  root_checker_plus: ^latest_version
```

Then run:

```bash
flutter pub get
```

## Usage

### Import the package

```dart
import 'package:root_checker_plus/root_checker_plus.dart';
import 'dart:io';
import 'package:flutter/services.dart';
```

### Basic Implementation

```dart
class _MyAppState extends State<MyApp> {
  bool rootedCheck = false;
  bool devMode = false;
  bool jailbreak = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      androidRootChecker();
      developerMode();
    }
    if (Platform.isIOS) {
      iosJailbreak();
    }
  }

  Future<void> androidRootChecker() async {
    try {
      rootedCheck = (await RootCheckerPlus.isRootChecker())!;
    } on PlatformException {
      rootedCheck = false;
    }
    if (!mounted) return;
    setState(() {});
  }

  Future<void> developerMode() async {
    try {
      devMode = (await RootCheckerPlus.isDeveloperMode())!;
    } on PlatformException {
      devMode = false;
    }
    if (!mounted) return;
    setState(() {});
  }

  Future<void> iosJailbreak() async {
    try {
      jailbreak = (await RootCheckerPlus.isJailbreak())!;
    } on PlatformException {
      jailbreak = false;
    }
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Root Checker Plus'),
        ),
        body: Center(
          child: Platform.isAndroid
              ? Text(
                  'Android Device\n\nRoot Status: ${rootedCheck ? "Rooted" : "Not Rooted"}\nDeveloper Mode: ${devMode ? "Enabled" : "Disabled"}',
                  textAlign: TextAlign.center,
                )
              : Text(
                  'iOS Device\n\nJailbreak Status: ${jailbreak ? "Jailbroken" : "Not Jailbroken"}',
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
```

## API Reference

### Methods

| Method | Platform | Return Type | Description |
|--------|----------|-------------|-------------|
| `isRootChecker()` | Android | `Future<bool?>` | Checks if the Android device is rooted |
| `isDeveloperMode()` | Android | `Future<bool?>` | Checks if Android developer options are enabled |
| `isJailbreak()` | iOS | `Future<bool?>` | Checks if the iOS device is jailbroken |

## Platform Support

| Platform | Supported |
|----------|:---------:|
| Android  |     ✅     |
| iOS      |     ✅     |
| Web      |     ❌     |
| Windows  |     ❌     |
| macOS    |     ❌     |
| Linux    |     ❌     |

## License

This project is licensed under the MIT License.
