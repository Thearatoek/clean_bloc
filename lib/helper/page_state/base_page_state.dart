import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_clean_bloc_test/helper/service_locator/di.dart';

abstract class BasePageState<T extends StatefulWidget, B extends Bloc>
    extends BasePageStateDelegete<T, B> {}

abstract class BasePageStateDelegete<T extends StatefulWidget, B extends Bloc>
    extends State<T> with AutomaticKeepAliveClientMixin {
  late B bloc = getIt.get<B>();

  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => bloc,
        ),
      ],
      child: buildPage(context),
    );
  }

  Widget buildPage(BuildContext context);

  @override
  void dispose() {
    super.dispose();
  }
}
