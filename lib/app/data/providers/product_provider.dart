import 'dart:ffi';

import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductProvider extends GetConnect {
  String BASEURL =
      "https://get-cli-project-89a69-default-rtdb.asia-southeast1.firebasedatabase.app/";

  Future<void> editProduct(String id, String name) async {
    final response = await patch(BASEURL + 'products/$id.json', {
      "name": name,
    });
    return response.body;
  }

  Future<dynamic> postProduct(String name, String date) async {
    final response = await post(BASEURL + 'products.json', {
      "name": name,
      "createdAt": date,
    });
    return response.body;
  }

  Future<void> deleteProduct(String id) async =>
      await delete(BASEURL + 'products/$id.json');
}
