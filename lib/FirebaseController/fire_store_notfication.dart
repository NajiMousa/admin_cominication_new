
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
class FireStoreNotfication{
  FirebaseMessaging _firebaseMessaging=FirebaseMessaging.instance;

  final _fireStore = FirebaseFirestore.instance;
  Future<void> sendPushMessage(String token, String body, String title,) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=AAAAqTv_s9I:APA91bHYt5PMukEyMuR6oFVUHgo5B_2za0eNQ4vEmykJhmSri-FUGnDJapLKri85QkE37a2YLPf2ZUH3IQIXVmxiMCFvFnJ1ntSH6h56s_kQOTpmmKnBYodI0cXFXzenk48tOR1heBRE',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );
    } catch (e) {
      print("error push notification");
    }
  }
  Future<void> saveToken(String phone)async
  {
    String tokenId="";
    await _firebaseMessaging.getToken().then((value) {
      tokenId=value!;
    });
    await _fireStore.collection("userToken").doc(phone+"_Token").set(
        {
          "userTokenfiled":tokenId,
        }
    );
  }
  Future<String> getToken(String phone)async{
    var token;
    final messages= await _fireStore.collection("userToken").doc(phone+"_Token").get();
    messages.data()!.map((key, value) {
      if(key=='userTokenfiled')
      {
        token =value;
      }
      return MapEntry(key, value);
    });
    // messages.then((value) =>token= value.get('userTokenfiled'));
    return token.toString();
  }
  Future<void> updateToken(String phone)async {
    String tokenId="";
    await _firebaseMessaging.getToken().then((value) {
      tokenId=value!;
    });
    return _fireStore.collection("userToken")
        .doc(phone+"_Token")
        .update({
      'userTokenfiled': tokenId,
    })
        .then((value) async{
      print("UserScreen Updated");
    })
        .catchError((error) {
      print("Failed to update user: $error");
    });
  }
}