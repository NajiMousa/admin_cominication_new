import 'package:admin_cominication/FirebaseController/bloke_user_controller.dart';
import 'package:admin_cominication/FirebaseController/requst_firebase_controller.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class UserDitalisScreen extends StatefulWidget {
   UserDitalisScreen({Key? key,required this.userInfoTranselator}) : super(key: key);
  UserInfoTranselator userInfoTranselator;
  @override
  State<UserDitalisScreen> createState() => _UserDitalisScreenState();
}

class _UserDitalisScreenState extends State<UserDitalisScreen> {
  bool loding=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F5F5F5"),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.15),
        backgroundColor: HexColor("#257BFB"),
        toolbarHeight: 60.h,
        title: Text(
          "بيانات المستخدم ",
          style: GoogleFonts.ibmPlexSansArabic(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          children: [
        Row(children: [
          Text("اسم المترجم ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
          const Spacer(),
          Text(widget.userInfoTranselator.name, style: GoogleFonts.ibmPlexSansArabic(
              fontWeight: FontWeight.bold, fontSize: 12.sp),)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("الايميل ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
          const Spacer(),
          Text(widget.userInfoTranselator.email, style: GoogleFonts.ibmPlexSansArabic(
              fontWeight: FontWeight.bold, fontSize: 12.sp),)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("رقم الهاتف ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
          const Spacer(),
          Text(widget.userInfoTranselator.phone, style: GoogleFonts.ibmPlexSansArabic(
              fontWeight: FontWeight.bold, fontSize: 12.sp),)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("العنوان ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
          const Spacer(),
          Text(widget.userInfoTranselator.address, style: GoogleFonts.ibmPlexSansArabic(
              fontWeight: FontWeight.bold, fontSize: 12.sp),)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("رقم البطاقة او الاقامة ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
          const Spacer(),
          Text(widget.userInfoTranselator.IDNumber, style: GoogleFonts.ibmPlexSansArabic(
              fontWeight: FontWeight.bold, fontSize: 12.sp),)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("الجنس  ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
          const Spacer(),
          Text(widget.userInfoTranselator.gender, style: GoogleFonts.ibmPlexSansArabic(
              fontWeight: FontWeight.bold, fontSize: 12.sp),)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("الوصف ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
          const Spacer(),
          Text(widget.userInfoTranselator.dis, style: GoogleFonts.ibmPlexSansArabic(
              fontWeight: FontWeight.bold, fontSize: 12.sp),)
        ],),
        SizedBox(height: 40.h,),
           loding?const Center(child: CircularProgressIndicator(),):
           ElevatedButton(
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.red,
               minimumSize: Size(double.infinity, 42.h),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(50),
               ),
             ),
             onPressed: () async{
               setState(() {
                 loding=true;
               });
               await BlookeUserController().blokeUserOrUnBloke(
                   userInfoTranselator: widget.userInfoTranselator,
                   context: context,
                   bloked: "Yes");
               setState(() {
                 loding=false;
               });
               Navigator.pushAndRemoveUntil(context,
                   MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
             },
             child: Text(
               "حظر",
               style: GoogleFonts.ibmPlexSansArabic(
                 fontSize: 16.sp,
                 color: Colors.white,
               ),
             ),
           )

      ]),
    );
  }
}
