import 'package:flutter/material.dart';
import 'package:objective_c/objective_c.dart';

import 'package:uikit_bindings/uikit.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void showAlert() {
    try {
      final handler = ObjCBlock_ffiVoid_UIAlertAction.listener((action) {
        print('done: ${action.title?.toDartString()}');
      });
      final completion = ObjCBlock_ffiVoid.listener(() {
        print('completed');
      });
      final controller = UIAlertController.alertControllerWithTitle(
        'Title'.toNSString(),
        message: 'Message'.toNSString(),
        preferredStyle: UIAlertControllerStyle.UIAlertControllerStyleAlert,
      );
      controller.title = 'Dialog Title'.toNSString();
      controller.message = 'This is a dialog message.'.toNSString();
      controller.addAction(
        UIAlertAction.actionWithTitle(
          'OK'.toNSString(),
          style: UIAlertActionStyle.UIAlertActionStyleDefault,
          handler: handler,
        ),
      );
      controller.addAction(
        UIAlertAction.actionWithTitle(
          'Cancel'.toNSString(),
          style: UIAlertActionStyle.UIAlertActionStyleCancel,
          handler: handler,
        ),
      );

      UIApplication.getSharedApplication().keyWindow?.rootViewController?.presentViewController(
        controller,
        animated: true,
        completion: completion,
      );
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  void showViewController() {
    try {
      final completion = ObjCBlock_ffiVoid.listener(() {
        print('completed');
      });
      final newViewController = UIViewController();
      final view = UIView();
      final size = MediaQuery.of(context).size;
      final screenWidth = size.width;
      final label = UILabel();
      label.text = 'This is a custom view controller'.toNSString();
      view.addSubview(label);
      label.textAlignment = NSTextAlignment.NSTextAlignmentCenter;
      final labelWidth = label.intrinsicContentSize.width;

      UIViewGeometry(label).frame = createCGRect(
        screenWidth / 2 - labelWidth / 2,
        100,
        labelWidth,
        label.intrinsicContentSize.height,
      );
      label.sizeToFit();
      newViewController.view = view;
      newViewController.view.backgroundColor = Colors.amber.toUIColor();
      UIApplication.getSharedApplication().keyWindow?.rootViewController?.presentViewController(
        newViewController,
        animated: true,
        completion: completion,
      );
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UIKit Bindings Example')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: showAlert,
                child: const Text('Show Alert Dialog'),
              ),
              ElevatedButton(
                onPressed: showViewController,
                child: const Text('Show View Controller'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
