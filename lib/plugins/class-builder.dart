import 'package:cov2/screens/submenu/localhosp.dart';
import 'package:cov2/screens/submenu/covidnews.dart';
import 'package:cov2/screens/submenu/productpage.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<MainPage>(() => MainPage());
    register<CalendarPage>(() => CalendarPage());
    register<SettingsPage>(() => SettingsPage());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
