import 'package:flutter/material.dart';

class NavigationService {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final navigatorKeyContext = navigatorKey.currentContext;
}
