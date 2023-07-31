import 'package:flutter/material.dart';

extension RouterContext on BuildContext {
  //Push Screens
  toNamed(String routeName, {Object? args}) =>
      Navigator.of(this).pushNamed(routeName, arguments: args);

  //Push ReplacementNamed Screens (remove previous route from stack)
  pushReplacementNamed(String routeName, {Object? result, Object? args}) =>
      Navigator.of(this).pushReplacementNamed(routeName, result: result, arguments: args,);

  //Push Named And Remove Until
  pushNamedAndRemoveUntil(String routeName, String rmUntilRouteName, {Object? args}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(routeName, ModalRoute.withName(rmUntilRouteName), arguments: args,);

  //Pop Until
  popUntil(String routeName) =>
      Navigator.of(this).popUntil(ModalRoute.withName(routeName));

  //Pop Screen
  popScreen() => Navigator.of(this).pop();
}