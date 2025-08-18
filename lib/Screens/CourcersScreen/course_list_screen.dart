import 'package:admin_cominication/FirebaseController/courses_controller.dart';
import 'package:admin_cominication/Model/CoureseModel.dart';
import 'package:admin_cominication/Screens/CourcersScreen/courses_detalis_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

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
        appBar: AppBar(
          title: Text("قائمة الدورات "),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/add_coures_screen");
          },
          child: Icon(Icons.add),
        ),
        body: FutureBuilder<List<CoureseModel>>(
          future: getData(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              if(listU.isNotEmpty){
                return ListView.builder(
                  itemCount: listU.length,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(bottom: 8.h),
                    child: ListTile(
                      onTap: () async{
                        //
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursesDitalisScreen(coureseModel: listU[index]),
                          ),
                        );
                      },
                      title: Text(listU[index].nameCourses),
                      subtitle: Text(listU[index].nameTetsherCourses),
                      trailing: Icon(Icons.arrow_forward_ios,color: HexColor('#004AAD'),size: 30.w,),
                    ),
                  );
                },);
              }
              else{
                return Center(child: Text("لا يوجد دورات مظافة لحتى الان"),);
              }
            }
            else{
             return Center(child: CircularProgressIndicator(),);
            }
          },
        ));
  }
}
