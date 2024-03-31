import 'package:flutter/material.dart';
import 'package:task/model/product_model.dart';
import 'package:task/service/api_service.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController queryController = TextEditingController();
  final ApiService service = ApiService();
  List<ProductModel> searchResults = [];
  void searchMovies(String query) async {
    if (query.isNotEmpty) {
      try {
        List<ProductModel> movies = await service.searchProducts(query);
        searchResults = movies;
        notifyListeners();
      } catch (e) {
        print("Error: $e");
      }
    } else {
      searchResults = [];
      notifyListeners();
    }
  }
}
