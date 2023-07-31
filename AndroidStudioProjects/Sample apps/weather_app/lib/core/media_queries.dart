import 'package:flutter/material.dart';

extension BuildContextDimention on BuildContext {
  double get mQHeight => MediaQuery.of(this).size.height;
  double get mQWidth => MediaQuery.of(this).size.width;

  double get appBarHeight => AppBar().preferredSize.height;
  double get mQPaddingTopHeight => MediaQuery.of(this).padding.top;
  double get mQPaddingBottomHeight => MediaQuery.of(this).padding.bottom;
  double get defaultPadding => MediaQuery.of(this).size.width * 0.08;
}