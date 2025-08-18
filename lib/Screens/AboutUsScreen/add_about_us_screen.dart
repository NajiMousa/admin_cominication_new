import 'package:admin_cominication/FirebaseController/courses_controller.dart';
import 'package:admin_cominication/Model/CoureseModel.dart';
import 'package:admin_cominication/Screens/home_screen.dart';
import 'package:admin_cominication/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddAboutUsScreen extends StatefulWidget {
  const AddAboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AddAboutUsScreen> createState() => _AddAboutUsScreenState();
}

class _AddAboutUsScreenState extends State<AddAboutUsScreen> with Helpers {
  late TextEditingController howUs;
  late TextEditingController adoutCompany;
  late TextEditingController serverWeConet;
  late TextEditingController whyJoinUs;


  @override
  void initState() {
    // TODO: implement initState

    howUs = TextEditingController();
    adoutCompany = TextEditingController();
    serverWeConet = TextEditingController();
    whyJoinUs = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    howUs.dispose();
    adoutCompany.dispose();
    serverWeConet.dispose();
    whyJoinUs.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  bool loding=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("اظافة معلومات الشركة "), centerTitle: true,),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [

            Text("من نحن "),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: howUs,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "من نحن ة",
                  border: OutlineInputBorder()),
            ),
            Text("عن الشركة"),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: adoutCompany,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "عن الشركة ",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("الخدمات التي نقدمها "),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: serverWeConet,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "الخدمات التي نقدمها",
                  border: OutlineInputBorder()),
            ),

            Text("لماذا ننصحك بالانظمام الينا "),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: whyJoinUs,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "لماذا ننصحك بالانظمام الينا ",
                  border: OutlineInputBorder()),
            ),

            SizedBox(
              height: 8.h,
            ),

            SizedBox(
              height: 8.h,
            ),

            loding?Center(child: CircularProgressIndicator(),):   ElevatedButton(onPressed: () async{
              setState(() {
                loding=true;
              });
              await performAddCourses();

              setState(() {
                loding=false;
              });
            }, child: Text("اظافة"))
          ]),
    );
  }

  Future<void> performAddCourses() async {
    if (checkData()) {
      await saveCourses();
    }
  }

  bool checkData() {
    if (
    howUs.text
        .toString()
        .isNotEmpty &&
        adoutCompany.text
            .toString()
            .isNotEmpty &&
        serverWeConet.text
            .toString()
            .isNotEmpty &&
        whyJoinUs.text
            .toString()
            .isNotEmpty
    ) {

        return true;

    }
    showSnackBar(
        context: context,
        message: "يرجى ملئ جميع الحقول ",
        error: true);
    return false;
  }

  Future<void> saveCourses() async {
    // await CoursesFireBaseController().SaveCoursesData(coureseModel: coureseModel(),context:context );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
      ModalRoute.withName('/'),
    );
  }

  void clear(){
    howUs.clear();
    adoutCompany.clear();
    serverWeConet.clear();
    whyJoinUs.clear();
  }
}
