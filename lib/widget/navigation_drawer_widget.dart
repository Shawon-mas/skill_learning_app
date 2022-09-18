import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcourse/screen/drawerScreen/course_screen.dart';
import 'package:vcourse/screen/drawerScreen/instructor_screen.dart';

import 'package:vcourse/screen/drawerScreen/myheader.dart';
import 'package:vcourse/screen/drawerScreen/profile_screen.dart';
import 'package:vcourse/screen/signin_screen.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/course_list.dart';
import 'package:vcourse/widget/text_widget.dart';
class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 15);
  @override
  Widget build(BuildContext context) {
    final name = 'Sarah Abs';
    final email = 'sarah@abs.com';
    final urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        color: BrandColors.bgColor,
        child: ListView(
          children: <Widget>[
            MyHeaderDrawer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(color: BrandColors.colorPrimaryDark),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),

                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'My Profile',
                    icon: Icons.person,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Courses',
                    icon: Icons.read_more_outlined,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  buildMenuItem(
                    text: 'Instructor',
                    icon: Icons.person_outline,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'About us',
                    icon: Icons.info,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Contact us',
                    icon: Icons.contact_phone_rounded,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: BrandColors.colorPrimaryDark),
                  const SizedBox(height: 24),

                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Log out',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {


    return ListTile(
      leading: Icon(icon, color: BrandColors.colorTextBlue),
      title: TextWidget(value: text,fontWeight: FontWeight.w500,size: 14.sp,color: BrandColors.colorText,),
      hoverColor: Colors.grey,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfileScreen(),));
        
        break;
      case 1:
      /*  Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavouritesPage(),
          CourseScreen
        ));*/
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CourseScreen(),));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => InstructorScreen(),));
        break;
      case 3:

        break;
      case 4:

        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SignInScreen(),));
        break;
    }
  }
}