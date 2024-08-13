enum RemoteExceptionType {
  noInternet,
  network,
  serverDefined,
  serverUndefined,
  badCertificate,
  decodeError,
  updateCardError,
  requestForgotCardPinError,
  submitBillError,
  billNotFound,
  forceLogout,
  timeout,
  cancellation,
  unknown,
  forceUpdate,
  callHotline,
}

class RemoteException implements Exception {
  final RemoteExceptionType type;
  final String message;

  RemoteException({
    required this.type,
    required this.message,
  });

  @override
  String toString() {
    return 'RemoteException(type: $type, message: $message)';
  }
}
