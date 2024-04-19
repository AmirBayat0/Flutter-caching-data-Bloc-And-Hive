import 'di_ex.dart';

GetIt di = GetIt.instance;

Future<void> setupDi() async {
  /// Network services
  di.registerSingleton<Dio>(Dio());

  /// Helper
  di.registerSingleton(InternetConnectionHelper());

  /// Hive DataBase
  await Hive.initFlutter();

  /// DB Services
  // Home DataBase Service
  di.registerSingleton(HomeDataBaseService());
  await di<HomeDataBaseService>().initDataBase();

  /// Api Providers
  di.registerSingleton(HomeApiProvider(di<Dio>()));

  /// DataBase Providers
  // Home
  di.registerSingleton(HomeDataBaseProvider(
    homeDataBaseService: di<HomeDataBaseService>(),
  ));

  /// Repository
  // Home
  di.registerSingleton(HomeRepository(
    di<HomeApiProvider>(),
    di<HomeDataBaseProvider>(),
  ));

  /// Blocs
  // Home
  di.registerSingleton<HomeBloc>(HomeBloc(di<HomeRepository>()));
}
