import 'package:http/http.dart' as http;
import 'package:keva/models/categories.dart';
import 'package:keva/constants/index.dart';
import 'package:keva/models/products.dart';

class Products {
  var client = http.Client();

  Future<List<Categories>> getAllCategories() async {
    var apiuri = Uri.parse(baseurl + categoriesEP);

    try {
      var res = await client.get(
        apiuri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

      return Categories.fromJsonList(res.body);
    } finally {
      client.close();
    }
  }

  getCategory() {}

  Future<List<ProductsModel>> getAllProducts() async {
    var apiuri = Uri.parse(baseurl + productsEP);

    try {
      var res = await client.get(
        apiuri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

      return ProductsModel.fromJsonList(res.body);
    } finally {
      client.close();
    }
  }

  Future<ProductsModel> getProduct(int id) async {
    var apiuri = Uri.parse('$baseurl$productsEP/$id');

    try {
      var res = await client.get(
        apiuri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

      print(res.body);

      return ProductsModel.fromJson(res.body);
    } finally {
      client.close();
    }
  }
}
