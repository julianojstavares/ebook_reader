import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'core/service_locator/service_locator.dart';
import 'features/home/domain/entities/book.dart';

void main() async {
  setupLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>('favoritesBox');
  runApp(const App());
}
