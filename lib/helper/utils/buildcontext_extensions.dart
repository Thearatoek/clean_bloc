import 'package:flutter/widgets.dart';

extension ArgumentsFromContextRoute on BuildContext {
  T? toArgument<T>() => ModalRoute.of(this)?.settings.arguments as T?;
}
