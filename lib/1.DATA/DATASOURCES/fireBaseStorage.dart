
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'package:uuid/uuid.dart';

class upoloadVideoFirebase extends GetxController{ 

  


   Future<List<String>> uploadVideo( String videoPath) async { 

        String videoId =const Uuid().v1();
        
        String video =  await _uploadFileToStroage( videoPath , videoId );
      String thumbnail = await _uploadThumbToStorage( videoPath , videoId );



      return [ "$video.mp4" , thumbnail ];

   }


   Future<String> _uploadFileToStroage( String videoPath , String videoId ) async { 
   try{

        
        Reference reference =  FirebaseStorage.instance.ref().child("Videos").child(videoId);

        
        UploadTask uploadTask =  reference.putFile( await _compressFile( videoPath ) );

        TaskSnapshot snapshot = await uploadTask;

        String downloadUrl  =await snapshot.ref.getDownloadURL();

        return downloadUrl;

        

   } catch(e) {

     throw Get.snackbar("Error", e.toString());
   }

   }  


    Future<File> _compressFile( String videoPath ) async {
    try{
      final compress =  await VideoCompress.compressVideo( videoPath , quality: VideoQuality.MediumQuality , includeAudio: true );
      return compress!.file!;
    } catch(e) {
       throw Get.snackbar("Erroe", e.toString());
    }
   }


   Future<String> _uploadThumbToStorage ( String videoPath , String videoId  ) async{ 

        Reference reference =  FirebaseStorage.instance.ref().child("Thumbnail").child(videoId);

       UploadTask uploadTask =  reference.putFile(await _getThumb( videoPath ) );

       TaskSnapshot snapshot = await uploadTask;

       return snapshot.ref.getDownloadURL();
      
    }

    Future<File> _getThumb( String videoPath ) async { 

       return await VideoCompress.getFileThumbnail( videoPath ); 
    }
  
}