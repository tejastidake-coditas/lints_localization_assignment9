// import 'package:dio/dio.dart';
// import 'package:lints_localization_assignment9/core/networking/network_constants.dart';
// import 'package:lints_localization_assignment9/features/product_details/data/model/product_details_model.dart';
//
// class ProductDetailsRemoteDataSource {
//   final Dio dio;
//
//   ProductDetailsRemoteDataSource(this.dio);
//   Future<ProductDetailsModel> fetchProductDetails(int productId) async {
//     try {
//       final url = '${NetworkConstants.productsEndpoint}/$productId';
//       print('Hitting URL: $url');
//
//       final response = await dio.get(url);
//       print('Response: ${response.data}');
//
//       final productJson = response.data['product'];
//       return ProductDetailsModel.fromJson(productJson);
//     } catch (e) {
//       print("Dio Exception: $e");
//       throw Exception("Failed to fetch product details");
//     }
//   }
// }
