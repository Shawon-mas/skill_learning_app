import 'package:flutter/material.dart';
import 'package:vcourse/widget/brand_color.dart';
class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget(
      {Key? key, required this.imagePath, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(children: [
          buildImage(),
          Positioned(
              bottom: 0,
              right: 4,
              child: buildEditIcon()
          ),
        ],)
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked,),

        ),
      ),
    );
  }

  Widget buildEditIcon() {
    return ClipOval(
      child: Container(
        color: BrandColors.colorWhite,
        padding: EdgeInsets.all(2),
        child: ClipOval(
          child: Container(
            padding: EdgeInsets.all(8),
            color: BrandColors.colorLightBlue,
              child: Icon(Icons.edit, size: 20, color: Colors.white,)
          ),
        ),
      ),
    );
  }

}
