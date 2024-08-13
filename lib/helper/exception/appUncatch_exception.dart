import 'package:todo_app_clean_bloc_test/helper/exception/app_exception.dart';

class AppUncaughtException extends AppException {
  const AppUncaughtException(this.rootError) : super(AppExceptionType.uncaught);

  final Object? rootError;

  @override
  String toString() {
    return 'rootError: ${rootError?.toString()}';
  }
}
