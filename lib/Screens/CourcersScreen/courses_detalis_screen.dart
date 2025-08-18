import 'package:admin_cominication/FirebaseController/courses_controller.dart';
import 'package:admin_cominication/FirebaseController/requst_firebase_controller.dart';
import 'package:admin_cominication/Model/CoureseModel.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/Screens/home_screen.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CoursesDitalisScreen extends StatefulWidget {
  CoursesDitalisScreen({Key? key, required this.coureseModel})
      : super(key: key);
CoureseModel coureseModel;
  @override
  State<CoursesDitalisScreen> createState() => _CoursesDitalisScreenState();
}

class _CoursesDitalisScreenState extends State<CoursesDitalisScreen> {
  bool loding=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("بيانات الدورة "),
        centerTitle: true,
      ),

      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          children: [
        Row(children: [
          Text("اسم الدورة :  ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
          Spacer(),
          Text(widget.coureseModel.nameCourses)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("اسم المدرب : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
          Spacer(),
          Text(widget.coureseModel.nameTetsherCourses)
        ],),
        SizedBox(height: 10.h,),
            Text("محتويات الدورة :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
            SizedBox(height: 10.h,),
            Text(widget.coureseModel.contanCourses),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("تاريخ البدأ : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
          Spacer(),
          Text(widget.coureseModel.DateCourses)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("عدد الساعات : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
          Spacer(),
          Text(widget.coureseModel.houresCourses)
        ],),
        SizedBox(height: 10.h,),
            Text("وصف المدرب  : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
            SizedBox(height: 10.h,),
            Text(widget.coureseModel.disTetsherCourses),
        SizedBox(height: 10.h,),
        Row(children: [
          Text(" نوع الدورة  :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
          Spacer(),
          Text(widget.coureseModel.typeCourses)
        ],),
        SizedBox(height: 10.h,),
            Text("وصف الدورة : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
            SizedBox(height: 10.h,),
            Text(widget.coureseModel.disCourses),
            SizedBox(height: 10.h,),
            Row(children: [
              Text(" رابط الدورة : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
              Spacer(),
              Text(widget.coureseModel.urlCoures)
            ],),
            SizedBox(height: 10.h,),
            Row(children: [
              Text("مكان الدورة : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
              Spacer(),
              Text(widget.coureseModel.place)
            ],),
        SizedBox(height: 40.h,),
           loding?Center(child: CircularProgressIndicator(),):
           ElevatedButton(onPressed: () async{
             setState(() {
               loding=true;
             });
             await CoursesFireBaseController().deletCourses(id: widget.coureseModel.id.toString(),context: context);
             setState(() {
               loding=false;
             });
             Navigator.pushAndRemoveUntil(context,
                 MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
            }, child: Text("حذف الدورة"))

      ]),
    );
  }
}
