import 'package:admin_cominication/FirebaseController/requst_balance_firebase_controller.dart';
import 'package:admin_cominication/FirebaseController/requst_firebase_controller.dart';
import 'package:admin_cominication/Model/requst_withdraw_model.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class WithDrowBalanceScreen extends StatefulWidget {
   WithDrowBalanceScreen({Key? key,required this.requstWithDrowModel}) : super(key: key);
   RequstWithDrowModel requstWithDrowModel;
  @override
  State<WithDrowBalanceScreen> createState() => _WithDrowBalanceScreenState();
}

class _WithDrowBalanceScreenState extends State<WithDrowBalanceScreen> {
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
          "بيانات الطلب ",
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
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          children: [
        Row(children: [
          Text("اسم صاحب الطلب ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
          const Spacer(),
          Text(widget.requstWithDrowModel.name,style: GoogleFonts.ibmPlexSansArabic(
              fontWeight: FontWeight.bold, fontSize: 12.sp),)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("الايميل ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
          const Spacer(),
          Text(widget.requstWithDrowModel.email,style: GoogleFonts.ibmPlexSansArabic(
              fontWeight: FontWeight.bold, fontSize: 12.sp),)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("رقم الهاتف ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
          const Spacer(),
          Text(widget.requstWithDrowModel.phone,style: GoogleFonts.ibmPlexSansArabic(
              fontWeight: FontWeight.bold, fontSize: 12.sp),)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("رقم البطاقة او الاقامة ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
          const Spacer(),
          Text(widget.requstWithDrowModel.IDNumber,style: GoogleFonts.ibmPlexSansArabic(
              fontWeight: FontWeight.bold, fontSize: 12.sp),)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("تاريخ الطلب ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
          const Spacer(),
          Text(widget.requstWithDrowModel.date.toString(),style: GoogleFonts.ibmPlexSansArabic(
              fontWeight: FontWeight.bold, fontSize: 12.sp),)
        ],),
        SizedBox(height: 10.h,),
        Row(children: [
          Text("المبلغ المراد سحبه  ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
          const Spacer(),
          Text(widget.requstWithDrowModel.balance,style: GoogleFonts.ibmPlexSansArabic(
              fontWeight: FontWeight.bold, fontSize: 12.sp),)
        ],),
            SizedBox(height: 10.h,),
            Row(children: [
              Text("ايميل الPayPall  ",style: GoogleFonts.ibmPlexSansArabic(fontSize: 12.sp),),
              const Spacer(),
              Text(widget.requstWithDrowModel.email,style: GoogleFonts.ibmPlexSansArabic(
                  fontWeight: FontWeight.bold, fontSize: 12.sp),)
            ],),
        SizedBox(height: 40.h,),
           loding?const Center(child: CircularProgressIndicator(),):
           ElevatedButton(
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.red,
               minimumSize: Size(double.infinity, 42.h),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(50),
               ),
             ),
             onPressed: () async{
               setState(() {
                 loding=true;
               });
               _showMyDialogCanselRequst();
               setState(() {
                 loding=false;
               });

             },
             child: Text(
               " اتمام السحب",
               style: GoogleFonts.ibmPlexSansArabic(
                 fontSize: 16.sp,
                 color: Colors.white,
               ),
             ),
           )

      ]),
    );
  }
  Future<void> _showMyDialogCanselRequst() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.r))),
            content: StatefulBuilder(
              builder: (context, setState) {
                return SizedBox(
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 33.w, vertical: 33.h),
                    child: Wrap(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "images/EndRequst.png",
                              height: 180.h,
                              width: 180.w,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              //"Settings",
                              "عذرا",
                              style: GoogleFonts.tajawal(
                                  textStyle: TextStyle(
                                    color: HexColor("#004AAD"),
                                  ),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28.sp),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              //"Settings",
                              "انت على وشك تأكيد اتمام عملية السحب ",
                              style: GoogleFonts.tajawal(
                                  textStyle: TextStyle(
                                    color: HexColor("#004AAD"),
                                  ),
                                  fontSize: 14.sp),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            loding
                                ? Center(
                              child: CircularProgressIndicator(),
                            )
                                : InkWell(
                              onTap: () async {
                                setState(() {
                                  loding = true;
                                });
                             bool state= await  RequstBalanceFireBaseController().changeStateBalance(Balance: widget.requstWithDrowModel, state: "قابل للسحب", context: context, balance: "0");
                               if(state){
                                 Navigator.pushAndRemoveUntil(context,
                                     MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
                               }
                                setState(() {
                                  loding = false;
                                });
                              },
                              child: Container(
                                height: 45.h,
                                width: 200.w,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(25.r),
                                  color: HexColor("#004AAD"),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "images/Mask Group 29.png",
                                        height: 32.h,
                                        width: 32.w,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                        //"Settings",
                                        "اتمام",
                                        style: GoogleFonts.tajawal(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 45.h,
                                width: 200.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.r),
                                  color: HexColor("#004AAD"),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text(
                                        //"Settings",
                                        "الغاء",
                                        style: GoogleFonts.tajawal(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ));
      },
    );
  }
}
