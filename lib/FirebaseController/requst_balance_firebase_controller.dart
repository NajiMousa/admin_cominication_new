import 'package:admin_cominication/FirebaseController/fire_store_notfication.dart';
import 'package:admin_cominication/Model/BalanceModel.dart';
import 'package:admin_cominication/Model/requst_withdraw_model.dart';
import 'package:admin_cominication/Model/user_info_transelator.dart';
import 'package:admin_cominication/helpers/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class RequstBalanceFireBaseController with Helpers {
  final _fireStore = FirebaseFirestore.instance;

  Future<bool> changeStateBalance({
    required RequstWithDrowModel Balance,
    required String state,
    required BuildContext context,
    required String balance,
  }) async {
    return _fireStore
        .collection("Balance")
        .doc(Balance.phone)
        .update({'state': state, "balance": balance}).then((value) async {
      print("UserScreen Updated");
   await   deletRequstBalance(balance:balance,Balance: Balance );
      return true;
    }).catchError((error) {
      showSnackBar(
          context: context,
          message: "Failed to update user: $error",
          error: true);
      print("Failed to update user: $error");
      return false;
    });
  }

  Future<List<RequstWithDrowModel>> getRequstBalance() async {
    final messages = await _fireStore
        .collection("requestWithdrawMany")
        .where("state", isEqualTo: "معلق")
        .get();
    List<RequstWithDrowModel> a = messages.docs
        .map((e) => RequstWithDrowModel.fromJson(e.data()))
        .toList();
    return a;
  }

  ////////
  Future<List<BalanceModel>> getBalance({required String phone}) async {
    final messages = await _fireStore
        .collection("Balance")
        .where("phoneUser", isEqualTo: phone)
        .get();
    print(messages.size.toString() + "ahmed");
    List<BalanceModel> a =
        messages.docs.map((e) => BalanceModel.fromJson(e.data())).toList();
    return a;
  }

  Future<void> deletRequstBalance({
    required RequstWithDrowModel Balance,
    required String balance,
  }) async {
   // 597777777_requestWithdrawMany
    var collection = FirebaseFirestore.instance.collection("requestWithdrawMany").doc(Balance.phone+"_requestWithdrawMany");
    await collection.delete();
  }
}
