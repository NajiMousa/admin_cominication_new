import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


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
          "الرئيسية",
          style: GoogleFonts.ibmPlexSansArabic(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _menuCard(
              icon: Icons.translate,
              title: "طلبات المترجمين",
              color: Colors.pinkAccent,
              onTap: () => Navigator.pushNamed(context, "/requst_translat_screen"),
            ),
            SizedBox(height: 12.h),
            _menuCard(
              icon: Icons.monetization_on,
              title: "طلبات سحب اموال",
              color: Colors.green,
              onTap: () => Navigator.pushNamed(context, "/requst_payMent_screen"),
            ),
            SizedBox(height: 12.h),
            _menuCard(
              icon: Icons.people,
              title: "المستخدمين",
              color: Colors.blue,
              onTap: () => Navigator.pushNamed(context, "/user_view_screen"),
            ),
            SizedBox(height: 12.h),
            _menuCard(
              icon: Icons.person_search,
              title: "المترجمين",
              color: Colors.deepOrange,
              onTap: () => Navigator.pushNamed(context, "/transaltor_view_screen"),
            ),
            SizedBox(height: 12.h),
            _menuCard(
              icon: Icons.block,
              title: "المستخدمين المحظورين",
              color: Colors.red,
              onTap: () => Navigator.pushNamed(context, "/user_view_bloked_screen"),
            ),
            SizedBox(height: 12.h),
            _menuCard(
              icon: Icons.g_translate,
              title: "المترجمين المحظورين",
              color: Colors.grey,
              onTap: () => Navigator.pushNamed(context, "/transaltor_bloked_view_screen"),
            ),
            SizedBox(height: 12.h),
            _menuCard(
              icon: Icons.library_books,
              title: "الدورات",
              color: Colors.indigo,
              onTap: () => Navigator.pushNamed(context, "/course_list_screen"),
            ),
            SizedBox(height: 12.h),
            _menuCard(
              icon: Icons.work,
              title: "الوظائف",
              color: Colors.teal,
              onTap: () => Navigator.pushNamed(context, "/job_list_screen"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: color.withOpacity(0.4), width: 1),
        ),
        child: Row(
          children: [
            SizedBox(width: 16.w),
            CircleAvatar(
              backgroundColor: color,
              radius: 28.r,
              child: Icon(icon, color: Colors.white, size: 28.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.ibmPlexSansArabic(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18.sp),
            SizedBox(width: 12.w),
          ],
        ),
      ),
    );
  }

}
