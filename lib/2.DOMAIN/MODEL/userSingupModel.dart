
import 'package:cloud_firestore/cloud_firestore.dart';

class singupModelKey { 
  String name = "Name";
  String uid = "Uid";
  String email = "Email";
  String password = "PassWord";
}



class signupModel {

  late String name;
  late String uid;
  late String email;
  late String password;

    signupModel({ required this.name , required this.uid , required this.email , required this.password});

    Map<String,dynamic> tojson() { 

      return {
        singupModelKey().name : name ,
        singupModelKey().uid : uid ,
        singupModelKey().email : email ,
        singupModelKey().password : password ,
      };
     }

  signupModel fromJson ( DocumentSnapshot snap ) { 

   Map<String,dynamic> snapshot = snap as Map<String,dynamic>;

       return signupModel(name: snapshot[singupModelKey().name], uid:snapshot[singupModelKey().uid], email: snapshot[singupModelKey().email], password: snapshot[singupModelKey().password]);
  }


}