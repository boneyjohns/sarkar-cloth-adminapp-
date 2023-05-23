import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkaradminapp/const/const.dart';
import 'package:sarkaradminapp/fuctions/addproduct_fun.dart';
import 'package:sarkaradminapp/model/product_model.dart';
import 'package:sarkaradminapp/views/addproduct/widget/add_image_widget.dart';

class AddProduct extends StatelessWidget {
  AddProduct({Key? key, required this.brand}) : super(key: key);
  final TextEditingController nameconroller = TextEditingController();
  final TextEditingController priceconroller = TextEditingController();
  final String brand;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
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
              const AddImageWidget(),
              kheight50,
              ElevatedButton(
                  onPressed: () async {
                    await addproduct(
                        brandname: brand,
                        product: ProductModel(
                            doc: nameconroller.text,
                            name: nameconroller.text,
                            price: priceconroller.text,
                            imagelist: image));
                    Get.back();
                  },
                  child: const Text('Add'))
            ],
          ),
        ));
  }
}
