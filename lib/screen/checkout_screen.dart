import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:vcourse/cousemodule/courseCart/cart_model.dart';
import 'package:vcourse/cousemodule/courseCart/cart_provider/cart_provider.dart';
import 'package:vcourse/cousemodule/courseCart/database/db_helper.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/primary_toolbar.dart';
import 'package:vcourse/widget/text_widget.dart';


class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreen();
}

class _CheckOutScreen extends State<CheckOutScreen> {
  DBHelper? dbHelper=DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: CustomToolbar(
        value: "Checkout",
      ),
      backgroundColor: BrandColors.bgColor,
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h,),
              TextWidget(
                value: 'Summery',
                color: BrandColors.colorText,
                size: 18.sp,
                fontWeight: FontWeight.w700,
              ),
              FutureBuilder(
                  future: cart.getData(),
                  builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                    if (snapshot.hasData) {
                      if(snapshot.data!.isEmpty)
                      {
                        return Center(

                          child: Column(
                            children: [
                              Lottie.network('https://assets6.lottiefiles.com/packages/lf20_iezsnh5g.json')
                            ],
                          ),
                        );
                      }else{
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: SizedBox(
                                    width: double.infinity,
                                    height: 120.h,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max
                                      ,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 120.h,
                                            width: 130.w,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: CachedNetworkImageProvider(
                                                        'https://vcourse.net/${snapshot.data![index].courseImage.toString()}'),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,

                                            children: [
                                              TextWidget(
                                                value: snapshot
                                                    .data![index].courseName
                                                    .toString(),
                                                color: BrandColors.colorText,
                                                size: 14.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              TextWidget(
                                                value:
                                                'By ${snapshot.data![index].courseInstructor.toString()}',
                                                color: BrandColors.colorTextBlue,
                                                size: 12.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              TextWidget(
                                                value:
                                                'Price: ৳${snapshot.data![index].coursePrice.toString()}',
                                                color: BrandColors.colorText,
                                                size: 12.sp,
                                                fontWeight: FontWeight.w700,
                                              ),

                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              );
                            });
                      }

                    }
                    return Text('');
                  }),
              SizedBox(height: 10.h,),

              Divider(
                thickness: 1.0,
                color: Colors.black,
              ),
              Consumer<CartProvider>(builder: (context,value,child){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            value: 'Total',
                            color: BrandColors.colorBlue,
                            size: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          TextWidget(
                            value: '৳${value.getTotalPrice().toStringAsFixed(2)}',
                            color: BrandColors.colorBlue,
                            size: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ],),
                      SizedBox(height: 10.h,),

                    ],
                  ),
                );

              }),
              SizedBox(height: 20.h,),
              TextWidget(
                value: 'Checkout',
                color: BrandColors.colorText,
                size: 18.sp,
                fontWeight: FontWeight.w700,
              ),
              Card(
                child: SizedBox(
                  width: double.infinity,
                  height: 350.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        TextWidget(
                          value: 'Customer Name',
                          color: BrandColors.colorBlue,
                          size: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 5.h,),
                        TextFormField(

                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value){

                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: BrandColors.bgColor,


                            hintText: 'Type here',
                            hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                            contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 0,
                                style: BorderStyle.none,),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),

                        ),
                        SizedBox(height: 5.h,),
                        TextWidget(
                          value: ' Customer Phone ',
                          color: BrandColors.colorBlue,
                          size: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 5.h,),
                        TextFormField(

                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value){

                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: BrandColors.bgColor,


                            hintText: 'Type here',
                            hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                            contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 0,
                                style: BorderStyle.none,),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),

                        ),
                        SizedBox(height: 5.h,),
                        TextWidget(
                          value: 'Address',
                          color: BrandColors.colorBlue,
                          size: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 5.h,),
                        TextFormField(

                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value){

                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: BrandColors.bgColor,


                            hintText: 'Type here',
                            hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                            contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 0,
                                style: BorderStyle.none,),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),

                        ),
                        SizedBox(height: 5.h,),
                        TextWidget(
                          value: 'City',
                          color: BrandColors.colorBlue,
                          size: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 5.h,),
                        TextFormField(

                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value){

                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: BrandColors.bgColor,


                            hintText: 'Type here',
                            hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                            contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 0,
                                style: BorderStyle.none,),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),

                        ),
                        SizedBox(height: 8.h,),
                        MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            height: 50,
                            minWidth: double.maxFinite,
                            color: BrandColors.yellow,

                            child: Text("Confirm Payment",style: TextStyle(
                                color: BrandColors.colorText,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold

                            ),),
                            onPressed: ()
                            {


                            }

                        ),
                        SizedBox(height: 5.h,),
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ) ,

    );
  }
}
