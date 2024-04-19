import 'package:bloc_hive_caching_data/core/dependency_injection/di.dart';
import 'package:bloc_hive_caching_data/core/dependency_injection/di_ex.dart';
import 'package:bloc_hive_caching_data/core/helper/log_helper.dart';
import 'package:bloc_hive_caching_data/core/resources/data_state.dart';
import 'package:bloc_hive_caching_data/features/home/data/models/product_model.dart';

class HomeRepository {
  // Remote Source
  final HomeApiProvider _apiProvider;
  // Local Source
  final HomeDataBaseProvider _dbProvider;

  HomeRepository(
    this._apiProvider,
    this._dbProvider,
  );

  /// Fetch App Settings
  Future<DataState<dynamic>> fetchProducts() async {
    // Connection checker
    final bool isInternetConnected =
        await di<InternetConnectionHelper>().checkInternetConnection();

    /// is DataBase Empty or Not
    final bool isDataBaseEmpty = await _dbProvider.isPostDataAvailable();

    if (isInternetConnected) {
      try {
        final Response response = await _apiProvider.callGetProductsEndpoint();
        logger.d(
            'Fetch [Products] from the Server and cache it in the local DataBase');

        /// Success
        if (response.statusCode == 200 &&
            response.data['success'] == true &&
            (response.data['products'] as List).isNotEmpty) {
          ProductsModel products = ProductsModel.fromJson(response.data);

          _dbProvider.insertProducts(post: products);

          /// send the cached data to server
          final ProductsModel? cachedProducts = await _dbProvider.getProducts();

          /// Send it to state management class as success response
          return DataSuccess(cachedProducts);
        }

        /// Unknown Error
        else {
          /// Read From DB
          if (!isDataBaseEmpty) {
            logger.d('Load [Products] from Local DataBase');

            final ProductsModel? localSourceResponse =
                await _dbProvider.getProducts();
            return DataSuccess(localSourceResponse);
          }

          /// Failed
          return const DataFailed("Unknown Error Happened!");
        }
      } catch (e) {
        if (!isDataBaseEmpty) {
          logger.d('Load [Products] from Local DataBase');
          final ProductsModel? localSourceResponse =
              await _dbProvider.getProducts();
          return DataSuccess(localSourceResponse);
        }

        /// Error
        else {
          return const DataFailed('Unexpected error happened!');
        }
      }
    }

    /// Use data from the database
    else {
      if (!isDataBaseEmpty) {
        logger.d('Load [Products] from Local DataBase');
        final ProductsModel? localSourceResponse =
            await _dbProvider.getProducts();
        return DataSuccess(localSourceResponse);
      }

      /// Error
      else {
        return const DataFailed('No Network Connection!');
      }
    }
  }
}
