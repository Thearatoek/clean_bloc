class LogConfig {
  const LogConfig._();

  static const enableGeneralLog = true;
  static const isPrettyJson = true;

  /// bloc observer
  static const logOnBlocChange = false;
  static const logOnBlocCreate = false;
  static const logOnBlocClose = false;
  static const logOnBlocError = false;
  static const logOnBlocEvent = false;
  static const logOnBlocTransition = false;

  /// navigator observer
  static const enableNavigatorObserverLog = true;

  /// disposeBag
  static const enableDisposeBagLog = false;

  /// stream event log
  static const logOnStreamListen = false;
  static const logOnStreamData = false;
  static const logOnStreamError = false;
  static const logOnStreamDone = false;
  static const logOnStreamCancel = false;

  /// log interceptor
  static const enableLogInterceptor = true;
  static const enableLogRequestInfo = true;
  static const enableLogSuccessResponse = true;
  static const enableLogErrorResponse = true;

  /// enable log usecase
  static const enableLogUseCaseInput = false;
  static const enableLogUseCaseOutput = false;
  static const enableLogUseCaseError = false;
}
