import 'package:app/src/features/login/data/data_sources/remote/login_api_data_source.dart';
import 'package:app/src/features/login/data/login_repository_impl.dart';
import 'package:app/src/features/login/presentation/cubits/login/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/features/login/presentation/login_screen.dart';
import 'src/foundation/data/network/network_config.dart';
import 'src/foundation/environments/dev.dart';

void main() {
  final environment = Dev();
  final dio = NetworkConfig.providesDioInstance(environment);

  runApp(OkeeperApp(dio));
}

class OkeeperApp extends StatelessWidget {
  const OkeeperApp(this.dio);

  final Dio dio;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (_) => LoginCubit(
        LoginRepositoryImpl(
          LoginApiDataSource(
            dio: dio,
          ),
        ),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
