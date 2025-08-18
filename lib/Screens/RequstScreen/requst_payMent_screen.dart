import 'package:admin_cominication/FirebaseController/requst_balance_firebase_controller.dart';
import 'package:admin_cominication/FirebaseController/requst_firebase_controller.dart';
import 'package:admin_cominication/Model/requst_withdraw_model.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/Screens/RequstScreen/balance_withdrow_screen.dart';
import 'package:admin_cominication/Screens/RequstScreen/translator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class RequstPaymentScreen extends StatefulWidget {
  const RequstPaymentScreen({Key? key}) : super(key: key);

  @override
  State<RequstPaymentScreen> createState() => _RequstPaymentScreenState();
}

class _RequstPaymentScreenState extends State<RequstPaymentScreen> {
  List<RequstWithDrowModel> listU = [];
  Future<List<RequstWithDrowModel>> getData() async {
    listU = await RequstBalanceFireBaseController().getRequstBalance();
    return listU;
  }
@override
  void initState() {
  getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("طلبات سحب اموال "),
        centerTitle: true,
      ),
      body: FutureBuilder<List<RequstWithDrowModel>>(
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WithDrowBalanceScreen(requstWithDrowModel: listU[index]),
                          ),
                        );
                      },
                      title: Text(listU[index].name),
                      subtitle: Text(listU[index].balance),
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
