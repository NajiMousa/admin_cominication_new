import 'package:admin_cominication/FirebaseController/job_controller.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Screens/JobScreen/job_detalis_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({Key? key}) : super(key: key);

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  List<JobModel> listU = [];

  Future<List<JobModel>> getData() async {
    listU = await JopFireBaseController().getJob();
    return listU;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("قائمة الوظائف "),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, "/add_job_screen");
      },
      child: Icon(Icons.add),
      ),
        body: FutureBuilder<List<JobModel>>(
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
                              builder: (context) => JobDitalisScreen(jobModel: listU[index]),
                            ),
                          );
                        },
                        title: Text(listU[index].nameJob),
                        subtitle: Text(listU[index].plaseJop),
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
