import 'package:admin_cominication/FirebaseController/courses_controller.dart';
import 'package:admin_cominication/Model/CoureseModel.dart';
import 'package:admin_cominication/Screens/home_screen.dart';
import 'package:admin_cominication/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddCoursesScreen extends StatefulWidget {
  const AddCoursesScreen({Key? key}) : super(key: key);

  @override
  State<AddCoursesScreen> createState() => _AddCoursesScreenState();
}

class _AddCoursesScreenState extends State<AddCoursesScreen> with Helpers {
  late TextEditingController nameCourses;
  late TextEditingController disCourses;
  late TextEditingController contanCourses;
  late TextEditingController houresCourses;
  late TextEditingController typeCourses;
   TextEditingController DateCourses=TextEditingController();
  late TextEditingController nameTetsherCourses;
  late TextEditingController disTetsherCourses;
  late TextEditingController urlCoures;
  late TextEditingController place;

  late String dateTime;
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        DateCourses.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState

    nameCourses = TextEditingController();
    disCourses = TextEditingController();
    contanCourses = TextEditingController();
    houresCourses = TextEditingController();
    typeCourses = TextEditingController();
    nameTetsherCourses = TextEditingController();
    disTetsherCourses = TextEditingController();
    urlCoures = TextEditingController();
    place = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameCourses.dispose();
    disCourses.dispose();
    contanCourses.dispose();
    houresCourses.dispose();
    typeCourses.dispose();
    DateCourses.dispose();
    nameTetsherCourses.dispose();
    disTetsherCourses.dispose();
    urlCoures.dispose();
    place.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedFile;

  Future<void> _pickImage() async {
    XFile? imageFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    if (imageFile != null) {
      setState(() {
        _pickedFile = imageFile;
      });
      // AppLocalizations.of(context)!.getstarted,
    }
  }
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
          "اضافة دورة",
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
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            Text("اختر صورة للعرض ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp)),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.w, vertical: 16.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: IconButton(onPressed: () {
                    _pickImage();
                  }, icon: const Icon(Icons.camera_alt)),
                ),
              ],
            ),
            Text("اسم الدورة ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp)),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: nameCourses,
              decoration: InputDecoration(
                  hintText: "اسم الدورة",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            Text("نبذه عن  الدورة ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp)),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: disCourses,
              decoration: InputDecoration(
                  hintText: "نبذه عن  الدورة",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("محتويات الدورة",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp)),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: contanCourses,
              decoration: InputDecoration(
                  hintText: "محتويات الدورة",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("مكان الدورة",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp)),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: place,
              decoration: InputDecoration(
                  hintText: "مكان الدورة",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("عدد ساعات الدورة",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp)),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: houresCourses,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "5",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("نوع الدورة",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp)),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: typeCourses,
              decoration: InputDecoration(
                  hintText: "اون لاين ",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("موعد الدورة  ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp)),
            SizedBox(
              height: 8.h,
            ),
            InkWell(
              onTap: () {
                print(DateCourses.text);
                _selectDate(context);
                print(DateCourses.text);
              },
              child: TextFormField(
                controller: DateCourses,
                enabled: false,

                decoration: InputDecoration(
                    hintText: "1 إلى 3 يوليو 2020",
                    hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                    border: const OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("اسم المدرب ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp)),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: nameTetsherCourses,
              decoration: InputDecoration(
                  hintText: "",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("نبذه عن المدرب ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp)),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: disTetsherCourses,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("رابط الدورة ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp)),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: urlCoures,
              decoration: InputDecoration(
                  hintText: "www.course.com",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 16.h,
            ),
            loding?const Center(child: CircularProgressIndicator(),):
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor('#257BFB'),
                minimumSize:  Size(double.infinity, 42.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () async {
                setState(() {
                  loding = true;
                });
                await performAddCourses();
                setState(() {
                  loding = false;
                });
              },
              child: Text(
                "اضافة",
                style: GoogleFonts.ibmPlexSansArabic(
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            )
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
    nameCourses.text
        .toString()
        .isNotEmpty &&
        disCourses.text
            .toString()
            .isNotEmpty &&
        contanCourses.text
            .toString()
            .isNotEmpty &&
        houresCourses.text
            .toString()
            .isNotEmpty &&
        typeCourses.text
            .toString()
            .isNotEmpty &&
        DateCourses.text
            .toString()
            .isNotEmpty &&
        nameTetsherCourses.text
            .toString()
            .isNotEmpty &&
        place.text
            .toString()
            .isNotEmpty &&
        disTetsherCourses.text
            .toString()
            .isNotEmpty
    ) {
      if (_pickedFile != null) {
        return true;
      }
      else {
        showSnackBar(
            context: context,
            message: "يرجى التأكد من  اختيار صورة العرض ",
            error: true);
        return false;
      }
    }
    showSnackBar(
        context: context,
        message: "يرجى ملئ جميع الحقول ",
        error: true);
    return false;
  }

  Future<void> saveCourses() async {
    await CoursesFireBaseController().SaveCoursesData(coureseModel: coureseModel(),context:context );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
      ModalRoute.withName('/'),
    );
  }

  CoureseModel coureseModel() {
    CoureseModel coureseModel = CoureseModel(
        nameCourses: nameCourses.text.toString(),
        disCourses: disCourses.text.toString(),
        contanCourses: contanCourses.text.toString(),
        houresCourses: houresCourses.text.toString(),
        typeCourses: typeCourses.text.toString(),
        DateCourses: DateCourses.text.toString(),
        nameTetsherCourses: nameTetsherCourses.text.toString(),
        disTetsherCourses: disTetsherCourses.text.toString(),
        urlCoures: urlCoures.text.toString(),
        id: DateTime.now().toString(),
        image: _pickedFile!.path.toString(),
      place: place.text.toString()
    );
    return coureseModel;
  }
  void clear(){
    nameCourses.clear();
    disCourses.clear();
    contanCourses.clear();
    houresCourses.clear();
    typeCourses.clear();
    nameTetsherCourses.clear();
    disTetsherCourses.clear();
    urlCoures.clear();
    place.clear();
  }
}
