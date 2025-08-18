import 'dart:io';
import 'package:admin_cominication/Model/CoureseModel.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/helpers/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/material.dart';

class CoursesFireBaseController with Helpers {
  final _fireStore = FirebaseFirestore.instance;

  Future<void> SaveCoursesData(
      {required CoureseModel coureseModel , required BuildContext context,}) async {
    print("coursesCollection");
    await _fireStore
        .collection("coursesCollection")
        .doc(coureseModel.id)
        .set(
      {
        "nameCourses":coureseModel.nameCourses,
        "disCourses":coureseModel.disCourses,
        "contanCourses":coureseModel.contanCourses,
        "houresCourses":coureseModel.houresCourses,
        "typeCourses":coureseModel.typeCourses,
        "DateCourses":coureseModel.DateCourses,
        "nameTetsherCourses":coureseModel.nameTetsherCourses,
        "disTetsherCourses":coureseModel.disTetsherCourses,
        "urlCoures":coureseModel.urlCoures,
        "id":coureseModel.id,
        "image":coureseModel.image,
        "place":coureseModel.place
      },
    ).onError((error, stackTrace) => (error, stackTrace) {
      showSnackBar(context: context, message: error.toString(),error: true);
    }).then((value) {
      showSnackBar(context: context, message: "تم الاظافة بنجاح",error: false);
    });
    print(coureseModel.image.toString() + "ahmed");
    await uploadFile(
        filePath: coureseModel.image.toString(),
        name: "uploads/${coureseModel.id.toString()}");
  }

  Future<void> uploadFile(
      {required String filePath, required String name}) async {
    File file = File(filePath);

    try {
      await firebase_storage.FirebaseStorage.instance.ref(name).putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }
  Future<List<CoureseModel>> getCourses() async {
    final messages = await _fireStore.collection("coursesCollection").get();
    List<CoureseModel> a = messages.docs
        .map((e) => CoureseModel.fromJson(e.data()))
        .toList();
    return a;
  }
  Future<void>deletCourses({required String id, required BuildContext context,})async{
    var collection = FirebaseFirestore.instance.collection("coursesCollection").doc(id);
    await collection.delete().onError((error, stackTrace) {
      showSnackBar(context: context, message: error.toString(),error: true);
    }).then((value) {
      showSnackBar(context: context, message: "تم الحذف بنجاح",error: false);
    });
  }
}
