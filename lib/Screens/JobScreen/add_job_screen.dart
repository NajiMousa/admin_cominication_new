import 'package:admin_cominication/FirebaseController/job_controller.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Screens/home_screen.dart';
import 'package:admin_cominication/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddJobScreen extends StatefulWidget {
  const AddJobScreen({Key? key}) : super(key: key);

  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> with Helpers {
  late TextEditingController nameJob;
  late TextEditingController disJob;
  late TextEditingController plaseJop;
  late TextEditingController yeersExperenas;
  late TextEditingController typeJob;
  TextEditingController lastTimeToAdd = TextEditingController();
  late TextEditingController degreeLeranJob;
  late TextEditingController disRequsirdJob;
  late TextEditingController urlJop;
  late String dateTime;
  DateTime selectedDate = DateTime.now();
  bool loding=false;
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2022),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        lastTimeToAdd.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    nameJob = TextEditingController();
    disJob = TextEditingController();
    plaseJop = TextEditingController();
    yeersExperenas = TextEditingController();
    typeJob = TextEditingController();
    degreeLeranJob = TextEditingController();
    disRequsirdJob = TextEditingController();
    urlJop = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    nameJob.dispose();
    disJob.dispose();
    plaseJop.dispose();
    yeersExperenas.dispose();
    typeJob.dispose();
    lastTimeToAdd.dispose();
    degreeLeranJob.dispose();
    disRequsirdJob.dispose();
    urlJop.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  ImagePicker _imagePicker = ImagePicker();
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
          "اضافة وظيفة",
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
            Text("اختر صورة للعرض ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
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
            Text("المسمى الوظيفي ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: nameJob,
              decoration: InputDecoration(
                  hintText: "المسمى الوظيفي",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            Text("نبذه عن  المهام الوظيفية",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: disJob,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "نبذه عن  المهام الوظيفية",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("الشروط والمتطلبات",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              maxLines: 4,
              controller: disRequsirdJob,
              decoration: InputDecoration(
                  hintText: "الشروط والمتطلبات",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("عدد سنوات الخبرة",style: GoogleFonts.ibmPlexSansArabic(fontSize: 11.sp),),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: yeersExperenas,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "5",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("نوع الوظيفة",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: typeJob,
              decoration: InputDecoration(
                  hintText: "عقد سنوي",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("أخر موعد للتقديم",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
            SizedBox(
              height: 8.h,
            ),
            InkWell(
              onTap: () {
                print(lastTimeToAdd.text);
                _selectDate(context);
                print(lastTimeToAdd.text);
              },
              child: TextFormField(
                controller: lastTimeToAdd,
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
            Text("الدرجة العلمية ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 2.sp),),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: degreeLeranJob,
              decoration: InputDecoration(
                  hintText: "البكالوريس",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("المكان ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: plaseJop,
              decoration: InputDecoration(
                  hintText: "مكة المكرمة",
                  hintStyle: GoogleFonts.ibmPlexSansArabic(fontSize: 10.sp),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("رابط الوظيفة ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: urlJop,
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
                await performSaveJop();
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

  bool checkData() {
    if (
    nameJob.text
        .toString()
        .isNotEmpty &&
        disJob.text
            .toString()
            .isNotEmpty &&
        plaseJop.text
            .toString()
            .isNotEmpty &&
        yeersExperenas.text
            .toString()
            .isNotEmpty &&
        typeJob.text
            .toString()
            .isNotEmpty &&
        lastTimeToAdd.text
            .toString()
            .isNotEmpty &&
        degreeLeranJob.text
            .toString()
            .isNotEmpty &&
        disRequsirdJob.text
            .toString()
            .isNotEmpty &&
        urlJop.text
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

  Future<void> savejob() async {
    await JopFireBaseController().SaveJobData(
        jobModel: jobModel(), context: context);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
      ModalRoute.withName('/'),
    );
  }

  JobModel jobModel() {
    JobModel jobModel = JobModel(nameJob: nameJob.text.toString(),
        disJob: disJob.text.toString(),
        plaseJop: plaseJop.text.toString(),
        yeersExperenas: yeersExperenas.text.toString(),
        typeJob: typeJob.text.toString(),
        lastTimeToAdd: lastTimeToAdd.text.toString(),
        degreeLeranJob: degreeLeranJob.text.toString(),
        disRequsirdJob: disRequsirdJob.text.toString(),
        urlJop: urlJop.text.toString(),
        id: DateTime.now().toString(),
        image: _pickedFile!.path.toString()
    );
    return jobModel;
  }
  Future<void> performSaveJop() async {
    if (checkData()) {
      await savejob();
    }
  }
}
