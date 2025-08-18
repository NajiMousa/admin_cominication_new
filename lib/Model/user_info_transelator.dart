
class UserInfoTranselator {
  late String name;
  late String dis;
  late String birthday;
  late String gender;
  late String email;
  late String lat;
  late String long;
  late String image;
  late String IDNumber;
  late String pricrPerHoure;
  late var active;
  late var bloked;
  late var address;
  late var phone;
  late String SubscriptionType;
  late String SubscriptionDateEnd;


  UserInfoTranselator(
      {required this.name,
        required this.dis,
        required this.birthday,
        required this.gender,
        required this.email,
        required this.lat,
        required this.long,
        required this.phone,
        required this.address,
        required this.image,
        required this.IDNumber,
        required  this.active,
        this.SubscriptionType="",
        this.SubscriptionDateEnd="",
        this.pricrPerHoure="",
        this.bloked="No",


      });
  UserInfoTranselator.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    dis = json['dis'];
    birthday = json['birthday'];
    gender = json['gender'];
    email = json['email'];
    lat = json['lat'];
    long = json['long'];
    phone = json['phone'];
    image = json['image'];
    address = json['address'];
    IDNumber = json['IDNumber'];
    SubscriptionType = json['SubscriptionType'];
    SubscriptionDateEnd = json['SubscriptionDateEnd'];
    pricrPerHoure = json['pricrPerHoure'];
    active = json['active'];
    bloked = json['bloked'];



  }
}
