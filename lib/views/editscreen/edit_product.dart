import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkaradminapp/const/const.dart';
import 'package:sarkaradminapp/fuctions/updateproduct.dart';
import 'package:sarkaradminapp/model/product_model.dart';
import 'package:sarkaradminapp/views/editscreen/widget/editimage.dart';

class EditProduct extends StatelessWidget {
  EditProduct({
    required this.productModel,
    Key? key,
    required this.brand,
  }) : super(key: key);
  final ProductModel productModel;
  final String brand;
  late final nameconroller = TextEditingController(text: productModel.name);
  late final priceconroller = TextEditingController(text: productModel.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              TextFormField(
                controller: nameconroller,
                decoration:
                    const InputDecoration(labelText: 'Name of the Product'),
              ),
              TextFormField(
                controller: priceconroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
              EditImageWidget(image: productModel.imagelist),
              kheight50,
              ElevatedButton(
                  onPressed: () async {
                    await updateproduct(
                        product: ProductModel(
                            doc: productModel.doc,
                            name: nameconroller.text,
                            price: priceconroller.text,
                            imagelist: productModel.imagelist),
                        brand: brand);
                    Get.back();
                  },
                  child: const Text('edit'))
            ],
          ),
        ));
  }
}
