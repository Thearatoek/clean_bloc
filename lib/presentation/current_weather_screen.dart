import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather/bloc/bloc_bloc.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather/bloc/bloc_event.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather/bloc/bloc_state.dart';

import '../helper/service_locator/di.dart';

class MYCurrentWeatherScreen extends StatefulWidget {
  const MYCurrentWeatherScreen({super.key});

  @override
  State<MYCurrentWeatherScreen> createState() => _MYCurrentWeatherScreenState();
}

class _MYCurrentWeatherScreenState extends State<MYCurrentWeatherScreen> {
  @override
  void initState() {
    super.initState();
  }

  final bloc = getIt.get<BlocBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocBloc>(
      create: (context) => getIt.get<BlocBloc>(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Back"),
            leading: const Icon(Icons.arrow_back_ios),
          ),
          body: BlocListener<BlocBloc, CurrentState>(
            listener: (context, state) {},
            child: InkWell(
              onTap: () {
                bloc.add(CurrentWeatherEvent(zipCountryCode: "120101"));
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                      width: 120,
                      height: 50,
                      color: Colors.red,
                      child: const Center(
                        child: Text("Get Current Weather"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
