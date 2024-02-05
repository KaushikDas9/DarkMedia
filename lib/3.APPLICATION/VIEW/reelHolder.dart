import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class reelHolder extends StatelessWidget {
  const reelHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          //AlingMent ta pore remove kore debo , dorkar hole

          width: Get.width, height: Get.height * .45, color: Colors.white,

          //Akan Theke Sob Widget suru

          child: Stack(
            children: [
              Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Container(
                    width: Get.width,
                    height: Get.height * .09,
                    
                    child: Row(
                        //Akane Space Evenly dite hobe
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(left: Get.width * .05),
                              child: Row(
                                children: [
                                  // circle Avater

                                  CircleAvatar(),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: Get.width * .025),
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Kaushik Das" , style: TextStyle(color: Colors.black), ),
                                        Text("Mobile App UX UI Developer" , style: TextStyle(color: Colors.black), )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert))
                        ]),
                  ),




                  //Akan theke Image Hold kora hoye66e



                  Container(  
                    height: Get.height *.2, width: Get.width,
                    margin: EdgeInsets.only( left: 20 , right: 20),
                    
                   child: Image(image: CachedNetworkImageProvider("https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg")),),
                
                
                // LIKE , COMMENT , SHARE 

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container( margin: EdgeInsets.only(left: Get.width * .05) ,width: Get.width * .4  , height: Get.height * .04, alignment: Alignment.topLeft, child: Row( children: [ IconButton(onPressed: (){} , icon: Icon(Icons.heart_broken)) , IconButton(onPressed: (){} , icon: Icon(Icons.comment)) , IconButton(onPressed: (){} , icon: Icon(Icons.share)) , ],)),
                    IconButton(onPressed: (){} , icon: Icon(Icons.bookmark))
                  ],
                ),
                


                // CAPTION 

                Padding(
                  padding:  EdgeInsets.only(left: Get.width * .085 , top : Get.width * .015 ),
                  child:const Row(
                    children: [
                      Text("Be Like Nature ... BEATIFULL" ,style: TextStyle(color: Colors.black),  ),
                      Text("  #Nature" , style: TextStyle(color: Colors.blue),)
                    ],
                  ),
                ),



                ///TIME WHEN UPLOADED 
                

                Padding(
                  padding:  EdgeInsets.only(left: Get.width * .085 , top : Get.width * .01 ),
                  child: Text("3 Hours Ago , made by Kaushik Das" , style: TextStyle(color: Colors.black), ),
                )
              
                
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
