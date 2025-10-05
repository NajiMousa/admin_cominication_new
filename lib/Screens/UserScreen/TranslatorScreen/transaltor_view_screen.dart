import 'package:admin_cominication/FirebaseController/requst_firebase_controller.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/Screens/UserScreen/TranslatorScreen/translator_detalis_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class TranslatorViewScreen extends StatefulWidget {
  const TranslatorViewScreen({Key? key}) : super(key: key);

  @override
  State<TranslatorViewScreen> createState() => _TranslatorViewScreenState();
}

class _TranslatorViewScreenState extends State<TranslatorViewScreen> {
  List<UserInfoTranselator> listU = [];
  List<UserInfoTranselator> listBased = [];
  Future<List<UserInfoTranselator>> getData() async {

    listBased = await RequstFireBaseController().getUserInfoTranselator();
    for(int i=0;i<listBased.length;i++)
    {
      if(listBased[i].active=="true"&&listBased[i].bloked=="No")
      {
        print(listBased[i].bloked.toString());
        listU.add(listBased[i]);
      }
    }
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
          "قائمة المترجمين ",
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
                            builder: (context) => TranslatorDitalisScreen(userInfoTranselator: listU[index]),
                          ),
                        );
                      },
                      title: Text(listU[index].name,style: GoogleFonts.ibmPlexSansArabic(fontSize: 13.sp),),
                      subtitle: Text(listU[index].address,style: GoogleFonts.ibmPlexSansArabic(fontSize: 11.sp),),
                      leading: SizedBox(
                        width: 60.w,
                        height: 60.h,
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
                      trailing: Icon(Icons.arrow_forward_ios,color: HexColor('#257BFB'),size: 18.w,),
                    ),
                  );
                },);
            }
            else{
              return Center(child: Text("لا يوجد طلبات حتى الان ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 13.sp),),);
            }
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
