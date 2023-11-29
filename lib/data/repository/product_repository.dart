import 'package:dio/dio.dart';
import 'package:setor_app/data/models/product_response_model.dart';

import '../models/product_detail_response_model.dart';

class ProductRepository {
  static final Dio dio = Dio();

  Future<List<ProductData>> getProduct() async {
    try {
      const url = 'http://rodaroda-api.staging.nikici.com:8001/api/v2/product/';
      final Response response = await dio.get(url);
      ProductResponse productResponse = ProductResponse.fromJson(response.data);
      return productResponse.data.products;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<ProductDetailData> getProductDetail(String? id) async {
    try {
      const url = 'http://rodaroda-api.staging.nikici.com:8001/api/v2/product/';
      final Response response = await dio.get('$url$id');
      ProductDetailResponse productDetail =
          ProductDetailResponse.fromJson(response.data);
      return productDetail.data!.product!;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
