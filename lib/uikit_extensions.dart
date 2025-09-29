import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:flutter/widgets.dart';
import 'package:objective_c/objective_c.dart' as objc;
import 'package:uikit_bindings/uikit.dart' show UIColor;

extension UIKitColorExtension on Color {
  UIColor toUIColor() {
    return UIColor.colorWithRed(
      r,
      green: g,
      blue: b,
      alpha: a,
    );
  }
}

/// Helper to create CGRect.
objc.CGRect createCGRect(double x, double y, double width, double height) {
  final ptr = calloc<objc.CGRect>();
  ptr.ref.origin.x = x;
  ptr.ref.origin.y = y;
  ptr.ref.size.width = width;
  ptr.ref.size.height = height;
  
  
  return ptr.ref;
}

objc.CGSize createCGSize(double width, double height) {
  final ptr = calloc<objc.CGSize>();
  ptr.ref.width = width;
  ptr.ref.height = height;
  return ptr.ref;
}
