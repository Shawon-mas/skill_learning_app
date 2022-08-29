import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/custom_button.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int groupValue = 0;

  static Widget pageWidget(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 20.sp),
      ),
    );
  }

  List<Widget> bodies = [
    coursList(),
    pageWidget("Instructor Page"),
    pageWidget("Categories Page"),
  ];

  static Widget coursList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 5,
        physics: ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("List item $index"),
            leading: const Icon(Icons.list),
            trailing: const Text(
              "GFG",
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Discover",
          style: TextStyle(color: BrandColors.colorText),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: BrandColors.colorText,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Stack(
          children: [
            ListView(
              children: [
                CupertinoSegmentedControl<int>(
                    padding: EdgeInsets.all(10),
                    groupValue: groupValue,
                    selectedColor: BrandColors.yellow,
                    unselectedColor: new Color(0xffF1F2F6),
                    borderColor: BrandColors.yellow,
                    children: {
                      0: buildSegment("Courses"),
                      1: buildSegment("Instructor"),
                      2: buildSegment("Categories"),
                    },
                    onValueChanged: (chageValue) {
                      print(chageValue);
                      setState(() {
                        this.groupValue = chageValue;
                      });
                    }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,50,0,0),
              child: Container(child: bodies[groupValue]),
            )
          ],
        ),
      )
    );
  }

  Widget buildSegment(String text) => Container(
        padding: EdgeInsets.all(10),
        child: Text(
          text,
          style: GoogleFonts.nunito(fontSize: 18.sp),
        ),
      );
}


