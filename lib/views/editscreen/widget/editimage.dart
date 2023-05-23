import 'package:flutter/material.dart';
import 'package:sarkaradminapp/const/colors.dart';
import 'package:sarkaradminapp/const/const.dart';
import 'package:sarkaradminapp/fuctions/image_picker.dart';

class EditImageWidget extends StatefulWidget {
  const EditImageWidget({super.key, required this.image});
  final List? image;
  @override
  State<EditImageWidget> createState() => _EditImageWidgetState();
}

class _EditImageWidgetState extends State<EditImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: kwhite, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() async {
                    final imageurl = await Images.getimage();
                    Images.addimage(imageurl!, widget.image!);

                    //  await Images.addimage(imageurl!, image);
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.add,
                      size: 36,
                      color: kblue,
                    ),
                    Text(
                      'Add Images',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kblue),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.image!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return imageContainer(context, widget.image![index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        kheight20,
                  ),
                )),
            // k20Height
          ],
        ),
      ),
    );
  }

  imageContainer(
    context,
    imgUrl,
  ) {
    final srcWidth = MediaQuery.of(context).size.width * 0.9;
    return Stack(children: [
      Container(
        width: srcWidth,
        height: srcWidth * 0.7,
        decoration: BoxDecoration(
          color: kwhite,
          image: DecorationImage(
            image: NetworkImage(imgUrl),
          ),
        ),
      ),
      Positioned(
        bottom: 5,
        right: 5,
        child: GestureDetector(
          onTap: () {
            setState(() {
              widget.image!.remove(imgUrl);
            });
          },
          child: const CircleAvatar(
            backgroundColor: kblue,
            radius: 20,
            child: Icon(Icons.remove),
          ),
        ),
      )
    ]);
  }
}
