class JobModel{
 late String nameJob;
 late String disJob;
 late String plaseJop;
 late String yeersExperenas;
 late String typeJob;
 late String lastTimeToAdd;
 late String degreeLeranJob;
 late String disRequsirdJob;
 late String urlJop;
 late String id;
 late String image;
 JobModel(
      {required this.nameJob,
     required this.disJob,
     required this.plaseJop,
     required this.yeersExperenas,
     required this.typeJob,
     required this.lastTimeToAdd,
     required this.degreeLeranJob,
     required this.disRequsirdJob,
     required this.urlJop,  required this.id, required this.image});

 JobModel.fromJson(Map<dynamic, dynamic> json) {


   nameJob  = json['nameJob'];
   disJob  = json['disJob'];
   plaseJop  = json['plaseJop'];
   yeersExperenas  = json['yeersExperenas'];
   typeJob  = json['typeJob'];
   lastTimeToAdd  = json['lastTimeToAdd'];
   degreeLeranJob  = json['degreeLeranJob'];
   disRequsirdJob  = json['disRequsirdJob'];
   urlJop  = json['urlJop'];
   id  = json['id'];
   image   = json['image'];
 }
}