import 'package:bloc_hive_caching_data/config/theme/app_theme.dart';
import 'package:bloc_hive_caching_data/core/dependency_injection/di.dart';
import 'package:bloc_hive_caching_data/features/home/presentation/bloc/home_bloc.dart';
import 'package:bloc_hive_caching_data/features/home/presentation/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: BlocProvider(
        create: (context) => di<HomeBloc>()..add(const HomeCallProductsEvent()),
        child: const HomePage(),
      ),
    );
  }
}
