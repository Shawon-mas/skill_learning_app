import 'package:flutter/material.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/primary_toolbar.dart';

class AllCourseScreen extends StatefulWidget {
  const AllCourseScreen({Key? key}) : super(key: key);

  @override
  State<AllCourseScreen> createState() => _AllCourseScreenState();
}

class _AllCourseScreenState extends State<AllCourseScreen> {
  late int defaultChoiceIndex;
  List<String> _choicesList = [
    "All Courses",
    "Programming",
    "Computer",
    "Marketing",
    "Photography",
    "Development",
    "Design",
    "Research & Development"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    defaultChoiceIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomToolbar(value: 'All courses'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: chip(),

          ),
          defaultChoiceIndex==null
              ?Container()
              :Text('${_choicesList[defaultChoiceIndex]}'),



        ],
      ),
    );
  }

  Widget chip() {
    return Wrap(
      spacing: 8,
      children: List.generate(_choicesList.length, (index) {
        return ChoiceChip(
          labelPadding: EdgeInsets.all(2.0),
          label: Text(
            _choicesList[index],
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.black54, fontSize: 14),
          ),
         backgroundColor: BrandColors.bgColor,
          selected: defaultChoiceIndex == index,
          selectedColor: BrandColors.colorLightBlue,
          onSelected: (value) {
            setState(() {
              defaultChoiceIndex = value ? index : defaultChoiceIndex;
            });
          },
          // backgroundColor: color,
          elevation: 1,
          padding: EdgeInsets.symmetric(horizontal: 5),
        );
      }),
    );
  }
}
