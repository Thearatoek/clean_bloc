import 'package:meta/meta.dart';
import 'package:todo_app_clean_bloc_test/domain/usecase/base_input.dart';
import 'package:todo_app_clean_bloc_test/helper/utils/logMixin.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> with LogMixin {
  const BaseUseCase();

  @protected
  Output buildUseCase(Input input);
}
