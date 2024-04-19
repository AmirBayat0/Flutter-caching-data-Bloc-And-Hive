class EnvironmentVariables {
  EnvironmentVariables._();

  // base url Endpoint
  static String get baseUrl => 'https://api.slingacademy.com';
  // get Products
  static String get getProducts => '$baseUrl/v1/sample-data/products?&limit=30';
}
