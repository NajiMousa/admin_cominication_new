import 'package:admin_cominication/FirebaseController/requst_firebase_controller.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/Screens/UserScreen/TranslatorScreen/translator_detalis_screen.dart';
import 'package:admin_cominication/Screens/UserScreen/UserBasedScreen/user_detalis_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class UserViewScreen extends StatefulWidget {
  const UserViewScreen({Key? key}) : super(key: key);

  @override
  State<UserViewScreen> createState() => _UserViewScreenState();
}

class _UserViewScreenState extends State<UserViewScreen> {
  List<UserInfoTranselator> listBased = [];
  List<UserInfoTranselator> listU = [];
  Future<List<UserInfoTranselator>> getData() async {
    listU.clear();
    listBased.clear();
    listBased = await RequstFireBaseController().getUserInfoBasedUser();
    for(int i=0;i<listBased.length;i++)
    {
      if(listBased[i].bloked=="No")
      {
        print(listBased[i].bloked.toString());
        listU.add(listBased[i]);
      }
    }
    return listU;
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("قائمة المستخدمين "),
        centerTitle: true,
      ),
      body: FutureBuilder<List<UserInfoTranselator>>(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data!.isNotEmpty)
            {
              return  ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                itemCount: listU.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(bottom: 8.h),
                    child: ListTile(
                      onTap: () async{

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDitalisScreen(userInfoTranselator: listU[index]),
                          ),
                        );
                      },
                      title: Text(listU[index].name),
                      subtitle: Text(listU[index].address),
                      leading: SizedBox(
                        width: 66.w,
                        height: 66.h,
                        child: FutureBuilder<String>(
                          future: RequstFireBaseController()
                              .uploadImageToFirebase(
                              name: listU[index].phone),
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
                                      width: 60.w,
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
                                      width: 60.w,
                                    ),
                                  ));
                            }
                          },
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,color: HexColor('#004AAD'),size: 30.w,),
                    ),
                  );
                },);
            }
            else{
              return Center(child: Text("لا يوجد طلبات حتى الان "),);
            }
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
