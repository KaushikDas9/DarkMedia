import 'package:clonetiktok/2.DOMAIN/MODEL/ProfilePage/LikesCount.dart';
import 'package:clonetiktok/2.DOMAIN/MODEL/videoController.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/videoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {

videoController vController = Get.put(videoController()) ; 
LikesCount profileController = Get.put(LikesCount());



  

  @override
  Widget build(BuildContext context) {

    // final data = vController.videoList.value ;
     print("isEmpty: ${vController.videoList.value.isEmpty}");

    // List<String> reelList = [ "Reels" , ];
    return Obx(() => vController.videoList.value.isEmpty  

    ?  Container( height: Get.height,width: Get.width, child: Center ( child:const CircularProgressIndicator()),)  
  
    : Scaffold(
     
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 25),
          color: Colors.black12,
          //  decoration:const BoxDecoration( image: DecorationImage(image: AssetImage( "assect/image/4k_Wallpaper.jpg") , fit: BoxFit.cover )),
          child: Column(
            children: [

              Container(
                alignment: Alignment.centerRight,
                width: Get.width ,
                height: Get.height * .1,
                color: Colors.black12,
                child: IconButton(onPressed: (){  } , icon:const Icon(Icons.settings )),
              ),
              //AKane Profile , name  , followers agulo dekano ho66e

              Container(
                // color: Colors.amber,
                height: Get.height * .4,
                // color: Colors.amber,
                child: Center(

                    child: Column(
                  
                  children: [
                    const SizedBox( height: 20),
                    const CircleAvatar( maxRadius: 60),
                    const SizedBox(height: 20),
                    Text(  vController.videoList.value[0].name ),
                    const SizedBox(height: 30,),


                    //Akane Follow ,likes, Following kora ache

                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                     const Column( children: [
                        Text("5"),
                       const Text("Followers")
                      ],),

                    const  Column( children: [
                        Text("6"),
                        Text("Following")
                      ],) ,

                      Column( children: [
                        Text( "${profileController.profilePageLikesCount.value}"  ),
                       const Text("Likes")
                      ],)

                    ],),



                  ],
                )),
              ),

              // color: Colors.blue,

              // Container(
              //   width: Get.width,
              //   height: 30,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 51,
              //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //     itemBuilder: (context, index) {
              //       return Text("data");
              //     },
              //   ),
              // ),

              // Akane Sob Reels Gulo Dekano korA Hoye66e

              GridView.builder(
                padding: EdgeInsets.only(
                    left: Get.height * .04,
                    right: Get.height * .04,
                    top: Get.height * .06,
                    bottom: Get.height * .12),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: Get.width * .6,
                  mainAxisExtent: Get.height * .25,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 10,
                ),
                itemCount:  vController.videoList.value.length ,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () { Get.to( videoPlayer(uri: Uri.parse( vController.videoList.value[vController.videoList.value.length - 1 - index].videoUrl ),) );  } ,
                    child: Container(
                      margin:const EdgeInsets.only(left: 15, right: 15),                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: Image.network( vController.videoList.value[ vController.videoList.value.length - 1 - index].thumbNail.toString() , fit: BoxFit.cover, ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
}
