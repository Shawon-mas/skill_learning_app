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
  List<String> reportList = [
    "Programming",
    "Computer",
    "Marketing",
    "Photography",
    "Development",
    "Design",
    "Research & Development"
  ];
  List<Color> colorList = [
    BrandColors.colorBrown,
    BrandColors.colorPurple,
    BrandColors.colorRed,
    BrandColors.colorGreenLight,
    BrandColors.yellow,
    BrandColors.colorText,
    BrandColors.colorLightBlue,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    btnColor = BrandColors.colorBrown;
                  });
                  print("ok");
                },
                child: chip("Programming", BrandColors.colorBrown)),
            SizedBox(width: 7.w,),
            GestureDetector(
                onTap: () {
                  print("nice");
                },
                child: chip("Computer", BrandColors.colorPurple)),

          ],
        ),

        SizedBox(height: 50.h,),
        Center(
          child: OutlinedButton(

            onPressed: () {},
            child: Text("Continue"),
            style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(10.0),
                fixedSize: Size(300.w, 45.h),
                side: BorderSide(color: BrandColors.colorText, width: 1),
                shape: StadiumBorder(),
                textStyle: GoogleFonts.nunito(
                    fontSize: 14.sp, fontWeight: FontWeight.w700),
                primary: BrandColors.colorText
            ),

          ),
        )

      ],
    );
  }

  Widget chip(String label, Color color) {
    return Chip(
        labelPadding: EdgeInsets.all(5.0),
        avatar: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(Icons.add, color: BrandColors.colorText,),
        ),
        label: Text(
          label,
          style: GoogleFonts.nunito(
              color: BrandColors.colorText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600
          ),
        ),
        backgroundColor: btnColor,

        padding: EdgeInsets.all(6.0),
        side: BorderSide(
          width: 1,
          color: color,
        )
    );
  }
}
/*class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final List<Color> colorList;


  MultiSelectChip(this.reportList, this.colorList);
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}
class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "";
  // this function will build and return the choice list
  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(6.0),
        child: ChoiceChip(
          backgroundColor: BrandColors.bgColor,
          selectedColor: widget.colorList[0],
          label: Text(item),
          selected: selectedChoice == item,
            side: BorderSide(
              width: 1,
              color: widget.colorList[widget.colorList.length],
            ),
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    });
    return choices;
  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}*/



/*
Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              GestureDetector(
                  onTap: (){
                    setState(() {
                      btnColor= BrandColors.colorBrown;
                    });
                    print("ok");
                  },
                  child: chip("Programming", BrandColors.colorBrown)),
            SizedBox(width: 7.w,),
            GestureDetector(
                onTap: (){
                  print("nice");
                },
                child: chip("Computer", BrandColors.colorPurple)),

          ],
        ),
        SizedBox(height: 7.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: (){
                  setState(() {
                    btnColor= BrandColors.colorBrown;
                  });
                  print("ok");
                },
                child: chip("Marketing", BrandColors.colorRed)),
            SizedBox(width: 7.w,),
            GestureDetector(
                onTap: (){
                  print("nice");
                },
                child: chip("Photography", BrandColors.colorGreenLight)),

          ],
        ),
        SizedBox(height: 7.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: (){
                  setState(() {
                    btnColor= BrandColors.colorBrown;
                  });
                  print("ok");
                },
                child: chip("Development", BrandColors.yellow)),
            SizedBox(width: 7.w,),
            GestureDetector(
                onTap: (){
                  print("nice");
                },
                child: chip("Design", BrandColors.colorText)),

          ],
        ),
        SizedBox(height: 7.h,),
        InkWell(
           /* onTap: (){
             setState(() {
               btnColor=BrandColors.colorLightBlue;
             });
            },*/

            child: chip("Research & Development", BrandColors.colorLightBlue)),
        SizedBox(height: 50.h,),
        Center(
          child: OutlinedButton(

            onPressed: () {},
            child: Text("Continue"),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(10.0),
              fixedSize: Size(300.w, 45.h),
              side: BorderSide(color: BrandColors.colorText,width: 1),
              shape: StadiumBorder(),
              textStyle: GoogleFonts.nunito(fontSize: 14.sp,fontWeight: FontWeight.w700 ),
              primary: BrandColors.colorText
            ),

          ),
        )



  }


 */
