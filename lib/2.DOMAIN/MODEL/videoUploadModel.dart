

import 'package:cloud_firestore/cloud_firestore.dart';

class videoModelMapKey { 
 
String name = "name";
String uid = "uid";
String id = "id";
String likes = "likes";
String commentsCount = "commentsCount";
String shareCount = "shareCount";
String songName = "songName";
String captions = "captions";
String videoUrl = "videoUrl";
String thumbNail = "thumbNail";


}

class videoModel  { 


  late String name ;
  late String uid ;
  late String id ;
  late List likes;
  late List commentsCount ;
  late int shareCount ;
  late String songName ;
  late String captions ;
  late String videoUrl ;
  late String thumbNail ;

  videoModel( { required this.name ,required this.uid , required this.id ,
  required this.likes , required this.commentsCount , required this.shareCount ,
  required this.songName , required this.captions , required this.videoUrl ,
  required this.thumbNail 
   } ) ;


   Map<String,dynamic> toJson() {
      return {
        videoModelMapKey().name : name ,
        videoModelMapKey().uid : uid,
        videoModelMapKey().id : id ,
        videoModelMapKey().likes : likes ,
        videoModelMapKey().commentsCount : commentsCount ,
        videoModelMapKey().shareCount : shareCount ,
        videoModelMapKey().songName : songName ,
        videoModelMapKey().captions : captions ,
        videoModelMapKey().videoUrl : videoUrl ,
        videoModelMapKey().thumbNail : thumbNail  ,

      };
   }



    static videoModel fromJson ( DocumentSnapshot snapshot  ) { 
          Map<String,dynamic> map = snapshot.data() as Map<String , dynamic>;

          return videoModel( name: map[videoModelMapKey().name] , uid: map[videoModelMapKey().uid],
          id:map[videoModelMapKey().id] , likes:map[videoModelMapKey().likes] , commentsCount:map[videoModelMapKey().commentsCount] ,
           shareCount : map[videoModelMapKey().shareCount] , songName : map[videoModelMapKey().songName] ,
           captions:map[videoModelMapKey().captions] , videoUrl : map[videoModelMapKey().videoUrl] , 
           thumbNail : map[videoModelMapKey().thumbNail
          ] );
            
    }

}
 