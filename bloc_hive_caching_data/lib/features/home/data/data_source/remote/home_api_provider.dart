import 'package:bloc_hive_caching_data/config/constants/api_constants.dart';
import 'package:bloc_hive_caching_data/core/dependency_injection/di_ex.dart';
import 'package:bloc_hive_caching_data/core/helper/log_helper.dart';

class HomeApiProvider {
  final Dio dio;
  HomeApiProvider(this.dio);

  /// Call App Settings  Api
  dynamic callGetProductsEndpoint() async {
    /// request url
    final requestUrl = EnvironmentVariables.getProducts;

    final response = await dio
        .request(
      requestUrl,
    )
        .onError((DioException error, stackTrace) {
      logger.e(error.toString());
      throw error;
    });

    return response;
  }
}
