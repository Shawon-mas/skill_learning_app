import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vcourse/cousemodule/courseCart/cart_model.dart';
import 'package:vcourse/cousemodule/courseCart/cart_provider/cart_provider.dart';
import 'package:vcourse/cousemodule/courseCart/database/db_helper.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/custom_button.dart';
import 'package:vcourse/widget/primary_toolbar.dart';
import 'package:vcourse/widget/text_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
    var price;

  DBHelper? dbHelper=DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: CustomToolbar(
        value: "My Cart",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              value: '${cart.getCounter()} Course in cart',
              color: BrandColors.colorText,
              size: 18.sp,
              fontWeight: FontWeight.w700,
            ),
            FutureBuilder(
                future: cart.getData(),
                builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                  if (snapshot.hasData) {

                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            price='https://vcourse.net/${snapshot.data![index].courseImage.toString()}';
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
                                        CustomButton(
                                          value: 'Remove',
                                          buttonColor: BrandColors.yellow,
                                          onPressed: () {
                                            dbHelper!.delete(snapshot.data![index].courseId!);
                                            cart.removerCounter();
                                            cart.removeTotalPrice(double.parse(snapshot.data![index].coursePrice.toString()));
                                          },
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                            );
                          }),
                    );
                  }
                  return Text('data');
                }),
            SizedBox(height: 10.h,),

            SizedBox(height: 10.h,),
            Consumer<CartProvider>(builder: (context,value,child){
              return Visibility(
                visible: value.getTotalPrice().toStringAsFixed(2)=="0.00"? false: true,
                child: Card(
                  child: Container(

                    width: double.infinity,
                    height: 180.h,
                    color: BrandColors.colorWhite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          TextWidget(
                            value: 'Summery',
                            color: BrandColors.colorText,
                            size: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                value: 'Subtotal',
                                color: BrandColors.colorText,
                                size: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              TextWidget(
                                value: '৳${value.getTotalPrice().toStringAsFixed(2)}',
                                color: BrandColors.colorText,
                                size: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],),
                          SizedBox(height: 10.h,),
                          Divider(
                            thickness: 1.0,
                            color: Colors.black,
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                value: 'Total',
                                color: BrandColors.colorText,
                                size: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              TextWidget(
                                value: '৳${value.getTotalPrice().toStringAsFixed(2)}',
                                color: BrandColors.colorText,
                                size: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ],),
                          SizedBox(height: 10.h,),
                          MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              height: 50,
                              minWidth: double.maxFinite,
                              color: BrandColors.bgColor,

                              child: Text("Checkout",style: TextStyle(
                                  color: BrandColors.colorText,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold

                              ),),
                              onPressed: ()
                              {
                                print(price);

                              }

                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );

            }),
            SizedBox(height: 10.h,),
          ],
        ),
      ),
    );
  }
}


