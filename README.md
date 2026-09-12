# root_checker_plus

Flutter plugin for **Android root detection** and **iOS jailbreak detection**.

It uses [RootBeer](https://github.com/scottyab/rootbeer) on Android and
[DTTJailbreakDetection](https://github.com/thii/DTTJailbreakDetection) on iOS.

## Requirements

- Flutter **3.44.0** or later
- Dart **3.12.0** or later
- Android `minSdk` **24**
- iOS **13.0** or later

Version `1.1.0` migrates Android to **built-in Kotlin** (AGP 9 compatible) and adds **Swift Package Manager** support alongside CocoaPods.

## Install

```yaml
dependencies:
  root_checker_plus: ^1.1.1
```

```dart
import 'package:root_checker_plus/root_checker_plus.dart';
```

## Usage

Call the APIs from `initState` (or after the first frame). Always handle `PlatformException` — native calls can fail on unsupported states.

```dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:root_checker_plus/root_checker_plus.dart';

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
      rootedCheck = (await RootCheckerPlus.isRootChecker()) ?? false;
    } on PlatformException {
      rootedCheck = false;
    }
    if (!mounted) return;
    setState(() {});
  }

  Future<void> developerMode() async {
    try {
      devMode = (await RootCheckerPlus.isDeveloperMode()) ?? false;
    } on PlatformException {
      devMode = false;
    }
    if (!mounted) return;
    setState(() {});
  }

  Future<void> iosJailbreak() async {
    try {
      jailbreak = (await RootCheckerPlus.isJailbreak()) ?? false;
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
        appBar: AppBar(title: const Text('Root checker example')),
        body: Center(
          child: Platform.isAndroid
              ? Text(
                  'Android\nRooted: $rootedCheck\nDeveloper mode: $devMode',
                  textAlign: TextAlign.center,
                )
              : Text(
                  'iOS\nJailbroken: $jailbreak',
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
```

See the [`example`](example) app for a complete sample.

## API

| Method | Platform | Returns |
| --- | --- | --- |
| `RootCheckerPlus.isRootChecker()` | Android | `true` if RootBeer considers the device rooted |
| `RootCheckerPlus.isDeveloperMode()` | Android | `true` if developer options are enabled |
| `RootCheckerPlus.isJailbreak()` | iOS | `true` if DTTJailbreakDetection considers the device jailbroken |

## Notes

- These checks are **best-effort**. Root and jailbreak hiding tools can produce false negatives; custom ROMs can produce false positives.
- Use the results as a signal, not as the only security control.

## License

MIT. Third-party libraries keep their own licenses (RootBeer, DTTJailbreakDetection).
