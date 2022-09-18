import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/course_list.dart';
import 'package:vcourse/widget/navigation_drawer_widget.dart';
import 'package:vcourse/widget/text_widget.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.colorWhite,
        title: TextWidget(value: "Vcourse",color: BrandColors.colorTextBlue,fontWeight: FontWeight.w600,size: 16.sp),
        iconTheme: IconThemeData(color: BrandColors.colorText),


      ),

      drawer: NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CourseList(),
          ],
        ),
      ),
    );
  }

}



enum DrawerSections {
  home,
  courses,
  about,
  contact,
  profile,
  logout,

}
/*
  var container;
    if (currentPage == DrawerSections.home) {
      container = HomeScreen();
    } else if (currentPage == DrawerSections.courses) {
      container = CourseScreen();
    } else if (currentPage == DrawerSections.about) {
      container = AboutScreen();
    } else if (currentPage == DrawerSections.contact) {
      container = ContactScreen();
    } else if (currentPage == DrawerSections.profile) {
      container = ProfileScreen();
    }else if (currentPage == DrawerSections.logout) {
      container = SignInScreen();
    }
 */
/*
Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.home_filled,
              currentPage == DrawerSections.home ? true : false),
          menuItem(2, "Courses", Icons.chrome_reader_mode,
              currentPage == DrawerSections.courses ? true : false),
          menuItem(3, "About", Icons.info,
              currentPage == DrawerSections.about ? true : false),
          menuItem(4, "Contact", Icons.contact_phone_rounded,
              currentPage == DrawerSections.contact ? true : false),
          Divider(),
          menuItem(5, "Profile", Icons.person,
              currentPage == DrawerSections.profile ? true : false),
          menuItem(6, "Log out", Icons.logout,
              currentPage == DrawerSections.logout ? true : false),

        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
            } else if (id == 2) {
              currentPage = DrawerSections.courses;
            } else if (id == 3) {
              currentPage = DrawerSections.about;
            } else if (id == 4) {
              currentPage = DrawerSections.contact;
            } else if (id == 5) {
              currentPage = DrawerSections.profile;
            }else if (id == 6) {
              currentPage = DrawerSections.logout;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: TextWidget(size: 14.sp,fontWeight: FontWeight.w500,color: BrandColors.colorText,value: title,),
              ),
            ],
          ),
        ),
      ),
    );
  }
 */
