import 'package:flutter/material.dart';

import 'app.dart';
import 'core/utils/dependency_injection.dart';

void main() {
  // 의존성 주입 초기화
  DependencyInjection.init();
  runApp(const MyApp());
}
