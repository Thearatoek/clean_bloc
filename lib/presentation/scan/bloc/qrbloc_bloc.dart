import 'package:flutter_bloc/flutter_bloc.dart';

part 'qrbloc_event.dart';
part 'qrbloc_state.dart';

class QrblocBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrblocBloc() : super(QrCodeIniState());
}
