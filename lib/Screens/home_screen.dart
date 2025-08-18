import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الرئيسية"),
        centerTitle: true,
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
           InkWell(
             onTap: () {
               Navigator.pushNamed(context, "/requst_translat_screen");
             },
             child: Container(
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(color: Colors.grey)),
               padding:EdgeInsets.all(20) ,
               child: Center(child: Text("طلبات انظمام مترجم ")),),
           ),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/requst_payMent_screen");
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(color: Colors.grey)),
                padding:EdgeInsets.all(20) ,
                child: Center(child: Text("طلبات سحب اموال ")),),
            ),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/user_view_screen");
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(color: Colors.grey)),
                padding:EdgeInsets.all(20) ,
                child: Center(child: Text("المستخدمين ")),),
            ),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/transaltor_view_screen");
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(color: Colors.grey)),
                padding:EdgeInsets.all(20) ,
                child: Center(child: Text("المترجمين ")),),
            ),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/user_view_bloked_screen");
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(color: Colors.grey)),
                padding:EdgeInsets.all(20) ,
                child: Center(child: Text("المستخدمين المحضورين ")),),
            ),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/transaltor_bloked_view_screen");
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(color: Colors.grey)),
                padding:EdgeInsets.all(20) ,
                child: Center(child: Text("المترجمين المحضورين ")),),
            ),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/course_list_screen");
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(color: Colors.grey)),
                padding:EdgeInsets.all(20) ,
                child: Center(child: Text("اظافة دورات ")),),
            ),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/job_list_screen");
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(color: Colors.grey)),
                padding:EdgeInsets.all(20) ,
                child: Center(child: Text("اظافة وظائف ")),),
            ),
          ]),

    );
  }
}
