import 'package:todo_app_clean_bloc_test/domain/usecase/base_input.dart';
import 'package:todo_app_clean_bloc_test/domain/usecase/base_output.dart';
import 'package:todo_app_clean_bloc_test/domain/usecase/base_use_case.dart';
import 'package:todo_app_clean_bloc_test/helper/exception/app_exception.dart';
import 'package:todo_app_clean_bloc_test/helper/utils/log_configure.dart';

abstract class BaseFutureUseCase<Input extends BaseInput,
    Output extends BaseOutput> extends BaseUseCase<Input, Future<Output>> {
  const BaseFutureUseCase();

  Future<Output> execute(Input input) async {
    try {
      if (LogConfig.enableLogUseCaseInput) {
        logD('FutureUseCase Input: $input');
      }
      final output = await buildUseCase(input);
      if (LogConfig.enableLogUseCaseOutput) {
        logD('FutureUseCase Output: $output');
      }

      return output;
    } catch (e) {
      if (LogConfig.enableLogUseCaseError) {
        logE('FutureUseCase Error: $e');
      }

      rethrow;
    }
  }
}
