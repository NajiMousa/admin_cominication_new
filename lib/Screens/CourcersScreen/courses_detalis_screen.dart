import 'package:admin_cominication/FirebaseController/courses_controller.dart';
import 'package:admin_cominication/FirebaseController/requst_firebase_controller.dart';
import 'package:admin_cominication/Model/CoureseModel.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/Screens/home_screen.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CoursesDitalisScreen extends StatefulWidget {
  CoursesDitalisScreen({Key? key, required this.coureseModel})
      : super(key: key);
  CoureseModel coureseModel;

  @override
  State<CoursesDitalisScreen> createState() => _CoursesDitalisScreenState();
}

class _CoursesDitalisScreenState extends State<CoursesDitalisScreen> {
  bool loding = false;

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
          "بيانات الدورة",
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
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          children: [
            Row(
              children: [
                Text(
                  "اسم الدورة :  ",
                  style:
                  GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),
                ),
                const Spacer(),
                Text(widget.coureseModel.nameCourses,style: GoogleFonts.ibmPlexSansArabic(fontWeight: FontWeight.bold, fontSize: 12.sp),)
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  "اسم المدرب : ",
                  style:
                  GoogleFonts.ibmPlexSansArabic( fontSize: 12.sp),
                ),
                const Spacer(),
                Text(widget.coureseModel.nameTetsherCourses,style: GoogleFonts.ibmPlexSansArabic(fontWeight: FontWeight.bold, fontSize: 12.sp),)
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "محتويات الدورة :",
              style: GoogleFonts.ibmPlexSansArabic( fontSize: 12.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(widget.coureseModel.contanCourses,style: GoogleFonts.ibmPlexSansArabic(fontWeight: FontWeight.bold, fontSize: 12.sp),),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  "تاريخ البدأ : ",
                  style:
                  GoogleFonts.ibmPlexSansArabic( fontSize: 12.sp),
                ),
                Spacer(),
                Text(widget.coureseModel.DateCourses,style: GoogleFonts.ibmPlexSansArabic(fontWeight: FontWeight.bold, fontSize: 12.sp),)
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  "عدد الساعات : ",
                  style:
                  GoogleFonts.ibmPlexSansArabic( fontSize: 12.sp),
                ),
                const Spacer(),
                Text(widget.coureseModel.houresCourses,style: GoogleFonts.ibmPlexSansArabic(fontWeight: FontWeight.bold, fontSize: 12.sp),)
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "وصف المدرب  : ",
              style: GoogleFonts.ibmPlexSansArabic( fontSize: 12.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(widget.coureseModel.disTetsherCourses,style: GoogleFonts.ibmPlexSansArabic(fontWeight: FontWeight.bold, fontSize: 12.sp),),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  " نوع الدورة  :",
                  style:
                  GoogleFonts.ibmPlexSansArabic( fontSize: 12.sp),
                ),
                Spacer(),
                Text(widget.coureseModel.typeCourses,style: GoogleFonts.ibmPlexSansArabic(fontWeight: FontWeight.bold, fontSize: 12.sp),)
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "وصف الدورة : ",
              style: GoogleFonts.ibmPlexSansArabic( fontSize: 12.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(widget.coureseModel.disCourses,style: GoogleFonts.ibmPlexSansArabic(fontWeight: FontWeight.bold, fontSize: 12.sp),),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  " رابط الدورة : ",
                  style:
                  GoogleFonts.ibmPlexSansArabic( fontSize: 12.sp),
                ),
                Spacer(),
                Text(widget.coureseModel.urlCoures,style: GoogleFonts.ibmPlexSansArabic(fontWeight: FontWeight.bold, fontSize: 12.sp),)
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  "مكان الدورة : ",
                  style:
                      GoogleFonts.ibmPlexSansArabic( fontSize: 12.sp),
                ),
                const Spacer(),
                Text(widget.coureseModel.place,style: GoogleFonts.ibmPlexSansArabic(fontWeight: FontWeight.bold, fontSize: 12.sp),)
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            loding
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: Size(double.infinity, 42.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        loding = true;
                      });
                      await CoursesFireBaseController().deletCourses(
                          id: widget.coureseModel.id.toString(),
                          context: context);
                      setState(() {
                        loding = false;
                      });
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                          (route) => false);
                    },
                    child: Text(
                      "حذف الدورة",
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
