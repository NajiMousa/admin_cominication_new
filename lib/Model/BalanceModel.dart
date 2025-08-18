class BalanceModel {
  late String id;
  late String phoneUser;

  late String balance;
  late String state;

  BalanceModel({required this.id,required this.phoneUser,required this.balance,required this.state});

  BalanceModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    phoneUser = json['phoneUser'];

    balance = json['balance'];
    state = json['state'];

  }
}
