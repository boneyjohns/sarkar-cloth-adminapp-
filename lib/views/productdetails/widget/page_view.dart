import 'package:flutter/material.dart';
import 'package:sarkaradminapp/const/colors.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    required this.productimage,
    Key? key,
  }) : super(key: key);

  final List productimage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: kwhite,
      ),
      child: PageView.builder(
        itemCount: productimage.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Image.network(productimage[index]);
        },
      ),
    );
  }
}
