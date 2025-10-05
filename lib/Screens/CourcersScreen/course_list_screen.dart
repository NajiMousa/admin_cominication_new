import 'package:admin_cominication/FirebaseController/courses_controller.dart';
import 'package:admin_cominication/Model/CoureseModel.dart';
import 'package:admin_cominication/Screens/CourcersScreen/courses_detalis_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../FirebaseController/requst_firebase_controller.dart';

class CoursesListScreen extends StatefulWidget {
  const CoursesListScreen({Key? key}) : super(key: key);

  @override
  State<CoursesListScreen> createState() => _CoursesListScreenState();
}

class _CoursesListScreenState extends State<CoursesListScreen> {
  List<CoureseModel> listU = [];

  Future<List<CoureseModel>> getData() async {
    listU = await CoursesFireBaseController().getCourses();
    return listU;
  }

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
            "الدورات ",
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
        floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
          onPressed: () {
            Navigator.pushNamed(context, "/add_coures_screen");
          },
          backgroundColor: HexColor('#257BFB'),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),

        body: FutureBuilder<List<CoureseModel>>(
          future: getData(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              if(listU.isNotEmpty){
                return ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  itemCount: listU.length,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(bottom: 8.h),
                    child: ListTile(
                      onTap: () async{
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursesDitalisScreen(coureseModel: listU[index]),
                          ),
                        );
                      },
                      title: Text(listU[index].nameCourses,style: GoogleFonts.ibmPlexSansArabic(fontSize: 13.sp),),
                      subtitle: Text(listU[index].nameTetsherCourses,style: GoogleFonts.ibmPlexSansArabic(fontSize: 11.sp),),
                      trailing: Icon(Icons.arrow_forward_ios,color: HexColor('#257BFB'),size: 18.w,),
                      leading: SizedBox(
                        width: 60.w,
                        height: 60.h,
                        child: FutureBuilder<String>(
                          future: RequstFireBaseController()
                              .uploadImageToFirebase(
                              name: listU[index].image),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return CircleAvatar(
                                  radius: 30.r,
                                  backgroundColor: Colors.transparent,
                                  child: ClipOval(
                                    child: Image.network(
                                      snapshot.data.toString(),
                                      fit: BoxFit.cover,
                                      height: 60.h,
                                      width: 50.w,
                                    ),
                                  ));
                            } else {
                              return CircleAvatar(
                                  radius: 30.r,
                                  backgroundColor: Colors.transparent,
                                  child: ClipOval(
                                    child: Image.asset(
                                      "images/15.png",
                                      fit: BoxFit.cover,
                                      height: 60.h,
                                      width: 50.w,
                                    ),
                                  ));
                            }
                          },
                        ),
                      ),
                    ),
                  );
                },);
              }
              else{
                return Center(child: Text("لا يوجد دورات مضافة لحتى الان",style: GoogleFonts.ibmPlexSansArabic(fontSize: 13.sp),),);
              }
            }
            else{
             return const Center(child: CircularProgressIndicator(),);
            }
          },
        ));
  }
}
