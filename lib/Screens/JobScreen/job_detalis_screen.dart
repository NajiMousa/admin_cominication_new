import 'package:admin_cominication/FirebaseController/job_controller.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class JobDitalisScreen extends StatefulWidget {
  JobDitalisScreen({Key? key, required this.jobModel}) : super(key: key);
  JobModel jobModel;

  @override
  State<JobDitalisScreen> createState() => _JobDitalisScreenState();
}

class _JobDitalisScreenState extends State<JobDitalisScreen> {
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
          "بيانات الوظيفة",
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
                  "المسمى الوظيفي :  ",
                  style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),
                ),
                Spacer(),
                Text(
                  widget.jobModel.nameJob,
                  style: GoogleFonts.ibmPlexSansArabic(
                      fontWeight: FontWeight.bold, fontSize: 12.sp),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  "مكان الوظيفة : ",
                  style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),
                ),
                Spacer(),
                Text(
                  widget.jobModel.plaseJop,
                  style: GoogleFonts.ibmPlexSansArabic(
                      fontWeight: FontWeight.bold, fontSize: 12.sp),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "المستوى التعليمي المطلوب :",
                  style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),
                ),
                Spacer(),
                Text(
                  widget.jobModel.degreeLeranJob,
                  style: GoogleFonts.ibmPlexSansArabic(
                      fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "تفاصيل الوظيفة : ",
              style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              widget.jobModel.disJob,
              style: GoogleFonts.ibmPlexSansArabic(
                  fontWeight: FontWeight.bold, fontSize: 12.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "المهام الوظيفية : ",
              style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              widget.jobModel.disRequsirdJob,
              style: GoogleFonts.ibmPlexSansArabic(
                  fontWeight: FontWeight.bold, fontSize: 12.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  "اخر موعد للتقديم  : ",
                  style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),
                ),
                Spacer(),
                Text(
                  widget.jobModel.lastTimeToAdd,
                  style: GoogleFonts.ibmPlexSansArabic(
                      fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  "نوع الوظيفة  :",
                  style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),
                ),
                Spacer(),
                Text(
                  widget.jobModel.typeJob,
                  style: GoogleFonts.ibmPlexSansArabic(
                      fontWeight: FontWeight.bold, fontSize: 12.sp),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  "عدد سنوات الخبرة : ",
                  style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),
                ),
                Spacer(),
                Text(
                  widget.jobModel.yeersExperenas,
                  style: GoogleFonts.ibmPlexSansArabic(
                      fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  " رابط الوظيفة : ",
                  style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),
                ),
                Spacer(),
                Text(
                  widget.jobModel.urlJop,
                  style: GoogleFonts.ibmPlexSansArabic(
                      fontWeight: FontWeight.bold, fontSize: 12.sp),
                )
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
                      await JopFireBaseController().deletJob(
                          id: widget.jobModel.id.toString(), context: context);
                      setState(() {
                        loding = false;
                      });
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                          (route) => false);
                    },
                    child: Text(
                      "حذف الوظيفة",
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
