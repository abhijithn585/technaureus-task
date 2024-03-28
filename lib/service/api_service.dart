import 'package:dio/dio.dart';
import 'package:task/constants/api_constants.dart';
import 'package:task/model/product_model.dart';

class ApiService {
  Dio dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    try {
      Response response = await dio.get(products);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data!;
        final List data = responseData['data'];
        return data.map((datas) => ProductModel.fromJson(datas)).toList();
      } else {
        print('status code ${response.statusCode}');
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
