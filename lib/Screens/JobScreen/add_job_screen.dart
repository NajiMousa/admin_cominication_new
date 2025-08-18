import 'package:admin_cominication/FirebaseController/job_controller.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Screens/home_screen.dart';
import 'package:admin_cominication/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    if (picked != null)
      setState(() {
        selectedDate = picked;
        lastTimeToAdd.text = DateFormat.yMd().format(selectedDate);
      });
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
      appBar: AppBar(title: Text("اظافة وظيفة "), centerTitle: true,),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            Text("اختر صورة للعرض "),
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
                  }, icon: Icon(Icons.camera_alt)),
                ),
              ],
            ),
            Text("المسمى الوظيفي "),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: nameJob,
              decoration: InputDecoration(
                  hintText: "المسمى الوظيفي",
                  border: OutlineInputBorder()),
            ),
            Text("نبذه عن  المهام الوظيفية"),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: disJob,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "نبذه عن  المهام الوظيفية",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("الشروط والمتطلبات"),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              maxLines: 4,
              controller: disRequsirdJob,
              decoration: InputDecoration(
                  hintText: "الشروط والمتطلبات",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("عدد سنوات الخبرة"),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: yeersExperenas,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "5",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("نوع الوظيفة"),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: typeJob,
              decoration: InputDecoration(
                  hintText: "عقد سنوي",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("أخر موعد للتقديم"),
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
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("الدرجة العلمية "),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: degreeLeranJob,
              decoration: InputDecoration(
                  hintText: "البكالوريس",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("المكان "),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: plaseJop,
              decoration: InputDecoration(
                  hintText: "مكة المكرمة",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("رابط الوظيفة "),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: urlJop,
              decoration: InputDecoration(
                  hintText: "www.course.com",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 16.h,
            ),
            loding?Center(child: CircularProgressIndicator(),):   ElevatedButton(onPressed: () async{
              setState(() {
                loding=true;
              });
              await performSaveJop();

              setState(() {
                loding=false;
              });
            }, child: Text("اظافة"))
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
