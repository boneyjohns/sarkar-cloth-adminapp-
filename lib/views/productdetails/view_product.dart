import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkaradminapp/const/colors.dart';
import 'package:sarkaradminapp/model/product_model.dart';
import 'package:sarkaradminapp/views/productdetails/widget/page_view.dart';
import 'package:sarkaradminapp/views/productdetails/widget/productdetaillist.dart';

class ProductView extends StatelessWidget {
  const ProductView({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhite,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        title: Text(
          productModel.name,
          style: const TextStyle(color: kblue),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageViewWidget(productimage: productModel.imagelist),
            Productdetails(
              detail: productModel.name,
              title: 'Product Name',
            ),
            Productdetails(detail: productModel.price, title: 'Price'),
          ],
        ),
      ),
    );
  }
}
