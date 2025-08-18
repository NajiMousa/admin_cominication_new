import 'package:admin_cominication/FirebaseController/fire_store_notfication.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/helpers/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class BlookeUserController with Helpers {
  final _fireStore = FirebaseFirestore.instance;

  Future<void> blokeUserOrUnBloke(
      {required UserInfoTranselator userInfoTranselator,
        required BuildContext context,
        required String bloked
      }) {
    return _fireStore
        .collection("userInfoBasedUser")
        .doc(userInfoTranselator.phone + "_userInfoBasedUser")
        .update({
      "bloked": bloked,
    }).then((value) async {
      String token =
      await FireStoreNotfication().getToken(userInfoTranselator.phone);
      await FireStoreNotfication().sendPushMessage(
        token,
       bloked=="Yes" ?"تم حظر حسابك لانتهاكك سياسات التطبيق  ":"تم فك الحظر عن حسابك برجاء عدم مخالفة سياسات التطبيق مرة اخرى  ",
        "حالة الحساب",
      );

      showSnackBar(context: context,

          message:  bloked=="Yes" ?"تم حظر بنجاح  ":"تم فك الحظر بنجاح  ",
      );
      print("UserScreen Updated");
    }).catchError((error) {
      showSnackBar(
          context: context,
          message: "Failed to update user: $error",
          error: true);
      print("Failed to update user: $error");
    });
  }
  Future<void> blokeTranselatorOrUnBloke(
      {required UserInfoTranselator userInfoTranselator,
        required BuildContext context,
        required String bloked
      }) {
    return _fireStore
        .collection("userInfoTranselator")
        .doc(userInfoTranselator.phone + "_userInfoTranselator")
        .update({
      "bloked": bloked,
    }).then((value) async {
      String token =
      await FireStoreNotfication().getToken(userInfoTranselator.phone);
      await FireStoreNotfication().sendPushMessage(
        token,
        bloked=="Yes" ?"تم حظر حسابك لانتهاكك سياسات التطبيق  ":"تم فك الحظر عن حسابك برجاء عدم مخالفة سياسات التطبيق مرة اخرى  ",
        "حالة الحساب",
      );

      showSnackBar(context: context,

        message:  bloked=="Yes" ?"تم حظر بنجاح  ":"تم فك الحظر بنجاح  ",
      );
      print("UserScreen Updated");
    }).catchError((error) {
      showSnackBar(
          context: context,
          message: "Failed to update user: $error",
          error: true);
      print("Failed to update user: $error");
    });
  }
}
