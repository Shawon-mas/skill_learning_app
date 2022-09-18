import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/primary_toolbar.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? imagePath;
   File? _image;
   Future pickImage() async{
     try{
       final image=await ImagePicker().pickImage(source: ImageSource.gallery);

       final imageTemp= File(image!.path);
       setState(() {
         _image=imageTemp;
          saveImage(_image!.path);
       });
     }  on PlatformException catch(e){
       print('Failed: $e');
     }
   }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomToolbar(value: 'My Profile'),
      body: ListView(
        children:
        [
          SizedBox(height: 10,),
          Center(
            child: Stack(
              children: [
              imagePath !=null?
              CircleAvatar(backgroundImage: FileImage(File(imagePath!)), radius: 80,)
              :CircleAvatar(
                  radius: 80,
                  backgroundImage: _image!=null?Image.file(_image!).image:NetworkImage('https://cutt.ly/yVi8MKf'),
                ),
                Positioned(
                    bottom: 0,
                    right: 4,
                    child: InkWell(
                      onTap: (){
                        pickImage();
                      },
                        child: buildEditIcon())
                ),

              ],
            ),
          ),
          Column(
            children: [
              Text('data'),
              Text('data'),
            ],
          )
        ],
      ),
    );
  }

  void saveImage(String path) async{
     SharedPreferences saveImage= await SharedPreferences.getInstance();
     saveImage.setString("imagepath", path);
  }

  void loadImage() async{
    SharedPreferences saveImage= await SharedPreferences.getInstance();
    setState(() {
      imagePath=saveImage.getString("imagepath");
    });

  }



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

