import 'package:clonetiktok/2.DOMAIN/MODEL/videoController.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class commentPage extends StatelessWidget {

  String name  ; 
  String comment ; 

  
   commentPage({required this.comment , required this. name , super.key});


  @override
  Widget build(BuildContext context) {
    return  Container(
          
          child: Center(
            child: Column(
              children: [
                Row(
                  // Akane 1.Circle Avatar 2. Name , Comment , Like and Count
    
                  children: [
                    Container(
                       
                        margin: const EdgeInsets.only( top: 15 , left: 10 , right: 10 ),                      
                        // height: Get.height * .12,
                        alignment: Alignment.topCenter,
                        child:const CircleAvatar(),

                      ),
                    
                      Container( height: 20,  alignment: Alignment.center, child: Text( name )),
                        
                        
    
                      //  const Row(
    
                      //     // Akane Reply and see Tranlation
                      //     children: [Text("Reply"), SizedBox(width: 20) , Text("See translation")],
                      //   ),
                        
                      
                   
    
                      // Akane Like icon er Like Count
                    // const Column(
                    //       children: [Icon(Icons.favorite_border), 
                    //       Text("125")
                    //       ],
                        // )
                  ],
                ),
    
                    Container( margin: EdgeInsets.only( left: Get.width * .17, ) , width: Get.width * .9  , child: ExpandableText(
                              comment,
                              expandText: "",
                              collapseOnTextTap: true,
                              maxLines: 2,
                              expandOnTextTap: true,
                              linkColor: Colors.white,
                             ), 
                          ) ,
                // Divide Border Kora Ache
    
                Divider(
                  color: Colors.white.withOpacity(.2),
                ),
              ],
            ),
          ),
        );
    
  
  }
}
