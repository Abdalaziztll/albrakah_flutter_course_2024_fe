import 'package:dio/dio.dart';
import 'package:full_app_with_mockapi_and_search/model/product_model.dart';

abstract class ProductService {
  Dio req = Dio();
  late Response response;
  String baseUrl = 'https://dummyjson.com/products';

  Future<List<ProductModel>> getAllProduct();
}

class ProductSerivceImpl extends ProductService {
  @override
  Future<List<ProductModel>> getAllProduct() async {
    try {
      response = await req.get(baseUrl);

      if (response.statusCode == 200) {
        List<ProductModel> products = List.generate(
          response.data["products"].length,
          (index) => ProductModel.fromMap(
            response.data["products"][index],
          ),
        );
        return products;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
