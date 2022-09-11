import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcourse/widget/brand_color.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  Color btnColor = BrandColors.bgColor;
  Color btnText = BrandColors.colorText;
  Color iconColor = BrandColors.colorText;
  late GlobalKey<ScaffoldState> _key;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _key=GlobalKey<ScaffoldState> ();
  }

  @override
  Widget build(BuildContext context) {
    return Column(

      children:
      [
        Row(
          children: [
            actionChips('Programming',BrandColors.colorBrown,() {
              setState(() {
                btnColor=BrandColors.colorBrown;
                btnText=BrandColors.colorWhite;
                iconColor=BrandColors.colorWhite;

              });
            }),
          SizedBox(width: 10,),
            actionChips('Programming',BrandColors.colorPurple,() {
              setState(() {
                btnColor=BrandColors.colorPurple;
                btnText=BrandColors.colorWhite;
                iconColor=BrandColors.colorWhite;

              });
            }),

          ],
        ),



      ],
    );
  }

  rowChip(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(width: 10.w,),

      ],
    );
  }

  Widget actionChips(String label,Color strokeColor,VoidCallback onPressed) {
    return ActionChip(


      avatar: Padding(
        padding: const EdgeInsets.only(left: 7),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(Icons.add,color: iconColor,),
        ),
      ),
      label: Text(label,style: GoogleFonts.nunito(
        color: btnText, fontWeight: FontWeight.w600,fontSize: 16.sp
      ),),
      onPressed: onPressed,
      backgroundColor: btnColor,
      shape: StadiumBorder(
          side: BorderSide(
            width: 1,
            color: strokeColor,
          )),
    );
  }
}
