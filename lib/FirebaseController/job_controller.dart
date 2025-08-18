import 'dart:io';

import 'package:admin_cominication/FirebaseController/fire_store_notfication.dart';
import 'package:admin_cominication/Model/BalanceModel.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Model/JopModel.dart';
import 'package:admin_cominication/Model/requst_withdraw_model.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/helpers/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
class JopFireBaseController with Helpers {
  final _fireStore = FirebaseFirestore.instance;
  Future<void> SaveJobData(
      {required JobModel jobModel , required BuildContext context,}) async {
    print("JobCollection");
    await _fireStore
        .collection("JobModel")
        .doc(jobModel.id)
        .set(
      {
        "nameJob":jobModel.nameJob,
        "disJob":jobModel.disJob,
        "plaseJop":jobModel.plaseJop,
        "yeersExperenas":jobModel.yeersExperenas,
        "typeJob":jobModel.typeJob,
        "lastTimeToAdd":jobModel.lastTimeToAdd,
        "degreeLeranJob":jobModel.degreeLeranJob,
        "disRequsirdJob":jobModel.disRequsirdJob,
        "urlJop":jobModel.urlJop,
        "id":jobModel.id,
        "image":jobModel.id,
      },
    ).onError((error, stackTrace) => (error, stackTrace) {
      showSnackBar(context: context, message: error.toString(),error: true);
    }).then((value) {
      showSnackBar(context: context, message: "تم الاظافة بنجاح",error: false);
    });
    print(jobModel.image.toString() + "ahmed");
    await uploadFile(
        filePath: jobModel.image.toString(),
        name: "uploads/${jobModel.id.toString()}");
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
  Future<List<JobModel>> getJob() async {
    final messages = await _fireStore.collection("JobModel").get();
    List<JobModel> a = messages.docs
        .map((e) => JobModel.fromJson(e.data()))
        .toList();
    return a;
  }
  Future<void>deletJob({required String id, required BuildContext context,})async{
    var collection = FirebaseFirestore.instance.collection("JobModel").doc(id);
    await collection.delete().onError((error, stackTrace) {
      showSnackBar(context: context, message: error.toString(),error: true);
    }).then((value) {
      showSnackBar(context: context, message: "تم الحذف بنجاح",error: false);
    });
  }
}
