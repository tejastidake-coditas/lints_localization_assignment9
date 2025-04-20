class NetworkConstants {
  static const baseUrl = 'https://fakestoreapi.in/api';
  static const String productsEndpoint = '$baseUrl/products';

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const String contentType = 'application/json';
}
