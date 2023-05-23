import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:sarkaradminapp/model/cate_model.dart';
import 'package:sarkaradminapp/model/product_model.dart';
import 'package:sarkaradminapp/views/category_screen/category_list.dart';

Future addproduct(
    {required ProductModel product, required String brandname}) async {
  final add = FirebaseFirestore.instance
      .collection('categories')
      .doc(brandname)
      .collection(brandname)
      .doc(product.doc);
  final json = product.toJson();
  await add.set(json);
  log('added');
  final search =
      FirebaseFirestore.instance.collection('search').doc(product.doc);

  await search.set(json);
  log('add product to search screen');
}

Future addcategory({required CateModel cate}) async {
  final add =
      FirebaseFirestore.instance.collection('categories').doc(cate.name);
  final json = cate.toJson();

  await add.set(json);
  log('added cate');
  Get.to(() => const CategoryList());
}
