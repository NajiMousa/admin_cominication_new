class CoureseModel{
 late String nameCourses;
 late String disCourses;
 late String contanCourses;
 late String houresCourses;
 late String typeCourses;
 late String DateCourses;
 late String nameTetsherCourses;
 late String disTetsherCourses;
 late String urlCoures;
  late String id;
  late String image;
  late String place;
 CoureseModel(
      {required this.nameCourses,
     required this.disCourses,
     required this.contanCourses,
     required this.houresCourses,
     required this.typeCourses,
     required this.DateCourses,
     required this.nameTetsherCourses,
     required this.disTetsherCourses,
     required this.urlCoures,
        required this.id,
        required this.image,
        required this.place
      });


 CoureseModel.fromJson(Map<dynamic, dynamic> json) {

   nameCourses   = json['nameCourses'];
   disCourses   = json['disCourses'];
   contanCourses   = json['contanCourses'];
   houresCourses   = json['houresCourses'];
   typeCourses   = json['typeCourses'];
   DateCourses   = json['DateCourses'];
   nameTetsherCourses   = json['nameTetsherCourses'];
   disTetsherCourses   = json['disTetsherCourses'];
   urlCoures   = json['urlCoures'];
   id   = json['id'];
   image   = json['image'];
   place   = json['place'];


 }
}