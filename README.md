# uikit_bindings

This plugin allows you to use native UIKit components in your Flutter app using FFI.

Bindings are generated from UIKit Headers using ffigen.

![](https://raw.githubusercontent.com/orestesgaolin/uikit_bindings/refs/heads/main/doc/screenshot.png)

This is experimental plugin and currently only limited number of components are supported.

## Regenerating bindings

This project uses Dart-API to use ffigen. To regenerate the bindings, run:

```bash
dart run tool/ffigen.dart
```

## Known issues:

- classes like `UISwitch`, `UIScrollView` don't get default constructor, see https://github.com/dart-lang/native/issues/2655
