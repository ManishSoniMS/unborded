import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/shared/account/presentation/blocs/account/account_cubit.dart';
import '../routes/route_manager.dart';
import 'injection/injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AccountCubit>(
          create: (context) => getIt<AccountCubit>()..fetch(),
        ),
      ],
      child: _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: RouteManager.instance.router,
      builder: (context, child) {
        return GestureDetector(
          onDoubleTap: () => FocusScope.of(context).unfocus(),
          child: child,
        );
      },
    );
  }
}
