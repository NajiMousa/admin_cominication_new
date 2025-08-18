import 'package:admin_cominication/FirebaseController/courses_controller.dart';
import 'package:admin_cominication/FirebaseController/job_controller.dart';
import 'package:admin_cominication/FirebaseController/requst_firebase_controller.dart';
import 'package:admin_cominication/Model/CoureseModel.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/Screens/home_screen.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class JobDitalisScreen extends StatefulWidget {
  JobDitalisScreen({Key? key, required this.jobModel})
      : super(key: key);
JobModel jobModel;
  @override
  State<JobDitalisScreen> createState() => _JobDitalisScreenState();
}

class _JobDitalisScreenState extends State<JobDitalisScreen> {
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
          Text("المسمى الوظيفي :  ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
          Spacer(),
          Text(widget.jobModel.nameJob)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("مكان الوظيفة : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
          Spacer(),
          Text(widget.jobModel.plaseJop)
        ],),
            Row(children: [
              Text("المستوى التعليمي المطلوب :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
              Spacer(),
              Text(widget.jobModel.degreeLeranJob),
            ],),
        SizedBox(height: 10.h,),
            Text("تفاصيل الوظيفة : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
            SizedBox(height: 10.h,),
            Text(widget.jobModel.disJob),
            SizedBox(height: 10.h,),

        SizedBox(height: 10.h,),
            Text("المهام الوظيفية : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
            SizedBox(height: 10.h,),
            Text(widget.jobModel.disRequsirdJob),
            SizedBox(height: 10.h,),
            Row(children: [
              Text("اخر معاد للتقديم  : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
              Spacer(),
              Text(widget.jobModel.lastTimeToAdd),
            ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("نوع الوظيفة  :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
          Spacer(),
          Text(widget.jobModel.typeJob)
        ],),
        SizedBox(height: 10.h,),
            Text("عدد سنوات الخبرة : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
            SizedBox(height: 10.h,),
            Text(widget.jobModel.yeersExperenas),
            SizedBox(height: 10.h,),
            Row(children: [
              Text(" رابط الوظيفة : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
              Spacer(),
              Text(widget.jobModel.urlJop)
            ],),
        SizedBox(height: 40.h,),
           loding?Center(child: CircularProgressIndicator(),):
           ElevatedButton(onPressed: () async{
             setState(() {
               loding=true;
             });
             await JopFireBaseController().deletJob(id: widget.jobModel.id.toString(),context: context);
             setState(() {
               loding=false;
             });
             Navigator.pushAndRemoveUntil(context,
                 MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
            }, child: Text("حذف الوظيفة"))

      ]),
    );
  }
}
