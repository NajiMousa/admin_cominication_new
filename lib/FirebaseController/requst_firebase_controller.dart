import 'package:admin_cominication/FirebaseController/fire_store_notfication.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/helpers/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class RequstFireBaseController with Helpers {
  final _fireStore = FirebaseFirestore.instance;

  Future<List<UserInfoTranselator>> getUserInfoTranselator() async {
    final messages = await _fireStore.collection("userInfoTranselator").get();
    List<UserInfoTranselator> a = messages.docs
        .map((e) => UserInfoTranselator.fromJson(e.data()))
        .toList();
    return a;
  }
  Future<List<UserInfoTranselator>> getUserInfoTranselatorBloked() async {
    final messages = await _fireStore.collection("userInfoTranselator").where(
        "bloked", isEqualTo: "Yes").get();
    List<UserInfoTranselator> a = messages.docs
        .map((e) => UserInfoTranselator.fromJson(e.data()))
        .toList();
    return a;
  }
  Future<List<UserInfoTranselator>> getUserInfoBasedUser() async {
    final messages = await _fireStore.collection("userInfoBasedUser").get();
    List<UserInfoTranselator> a = messages.docs
        .map((e) => UserInfoTranselator.fromJson(e.data()))
        .toList();
    return a;
  }
  Future<List<UserInfoTranselator>> getUserInfoBasedUserBloked() async {
    final messages = await _fireStore.collection("userInfoBasedUser").where(
        "bloked", isEqualTo: "Yes").get();
    List<UserInfoTranselator> a = messages.docs
        .map((e) => UserInfoTranselator.fromJson(e.data()))
        .toList();
    return a;
  }
  Future<String> uploadImageToFirebase({required String name}) async {
    final ref = FirebaseStorage.instance.ref().child('uploads/').child(name);
    var url = await ref.getDownloadURL();
    return url.toString();
  }

  Future<void> updateUserInformationTranslator(
      {required UserInfoTranselator userInfoTranselator,
      required BuildContext context,}) {
    return _fireStore
        .collection("userInfoTranselator")
        .doc(userInfoTranselator.phone + "_userInfoTranselator")
        .update({
      "active": "true",
    }).then((value) async {
      String token =
          await FireStoreNotfication().getToken(userInfoTranselator.phone);
      await FireStoreNotfication().sendPushMessage(
          token,
          "تم قبول طلب انظمامك كمترجم ",
          "حالة الطلب",
      );

      showSnackBar(context: context, message: "تم قبول المترجم بنجاح");
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
