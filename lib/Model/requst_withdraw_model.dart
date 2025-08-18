class RequstWithDrowModel{
  late String phone;
  late String balance;
  late String name;
  late String email;
  late String IDNumber;
  late String state;
  late var date;


  RequstWithDrowModel(
      {required this.phone,
     required this.balance,
     required this.name,
     required this.email,
     required this.IDNumber,
     required this.state,
     required this.date});

  RequstWithDrowModel.fromJson(Map<dynamic, dynamic> json) {
    phone = json['phone'];
    balance = json['balance'];
    name = json['name'];
    email = json['email'];
    IDNumber = json['IDNumber'];
    state = json['state'];
    date = json['date'];
  }
}