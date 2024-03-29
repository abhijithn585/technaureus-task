import 'package:dio/dio.dart';
import 'package:task/constants/api_constants.dart';
import 'package:task/model/customer_model.dart';
import 'package:task/model/product_model.dart';

class ApiService {
  Dio dio = Dio();
  static const apiUrl = "http://143.198.61.94/api/";

  Future<List<ProductModel>> getProducts() async {
    try {
      Response response = await dio.get("${apiUrl}products/");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data!;
        final List data = responseData['data'];
        return data.map((datas) => ProductModel.fromJson(datas)).toList();
      } else {
        print('status code ${response.statusCode}');
        throw Exception("status code error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<CustomerModel>> getCustomers() async {
    try {
      Response response = await dio.get("${apiUrl}customers/");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data!;
        final List data = responseData['data'];
        return data.map((datas) => CustomerModel.fromJson(datas)).toList();
      } else {
        print('status code ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
