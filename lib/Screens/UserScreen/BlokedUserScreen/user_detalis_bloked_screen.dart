import 'package:admin_cominication/FirebaseController/bloke_user_controller.dart';
import 'package:admin_cominication/FirebaseController/requst_firebase_controller.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserDitalisBlokedScreen extends StatefulWidget {
   UserDitalisBlokedScreen({Key? key,required this.userInfoTranselator}) : super(key: key);
  UserInfoTranselator userInfoTranselator;
  @override
  State<UserDitalisBlokedScreen> createState() => _UserDitalisBlokedScreenState();
}

class _UserDitalisBlokedScreenState extends State<UserDitalisBlokedScreen> {
  bool loding=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("بيانات المستخدم "),
        centerTitle: true,
      ),

      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          children: [
        Row(children: [
          Text("اسم المترجم "),
          Spacer(),
          Text(widget.userInfoTranselator.name)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("الايميل "),
          Spacer(),
          Text(widget.userInfoTranselator.email)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("رقم الهاتف "),
          Spacer(),
          Text(widget.userInfoTranselator.phone)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("العنوان "),
          Spacer(),
          Text(widget.userInfoTranselator.address)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("رقم البطاقة او الاقامة "),
          Spacer(),
          Text(widget.userInfoTranselator.IDNumber)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("الجنس  "),
          Spacer(),
          Text(widget.userInfoTranselator.gender)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("الوصف "),
          Spacer(),
          Text(widget.userInfoTranselator.dis)
        ],),
        SizedBox(height: 40.h,),
           loding?Center(child: CircularProgressIndicator(),):
           ElevatedButton(onPressed: () async{
             setState(() {
               loding=true;
             });
             await BlookeUserController().blokeUserOrUnBloke(
                 userInfoTranselator: widget.userInfoTranselator,
                 context: context,
                 bloked: "No");
             setState(() {
               loding=false;
             });
             Navigator.pushAndRemoveUntil(context,
                 MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
            }, child: Text("فك الحظر "))

      ]),
    );
  }
}
