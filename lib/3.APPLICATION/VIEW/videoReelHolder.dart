
import 'package:clonetiktok/2.DOMAIN/MODEL/shareModel.dart';
import 'package:clonetiktok/2.DOMAIN/MODEL/videoController.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/Comment/commentPage.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/videoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable_text/expandable_text.dart';


class videoReelHolder extends StatefulWidget {
  const videoReelHolder({super.key});

  @override
  State<videoReelHolder> createState() => _videoReelHolderState();
}

class _videoReelHolderState extends State<videoReelHolder> {

  

  videoController vcontroller = Get.put(videoController());
  videoPlayer player = Get.put(videoPlayer());
  RxBool likeTap = false.obs;
  TextEditingController commentController = TextEditingController();
  


  @override
  Widget build(BuildContext context) {

    
    return Scaffold(body: Obx(
      () {
        // print("list length : ${vcontroller.videoList.length}");
        
        return  PageView.builder(
          controller: PageController(initialPage: 0, viewportFraction: 1),
          itemCount: vcontroller.videoList.value.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {

            final data = vcontroller.videoList.value [vcontroller.videoList.value.length-1- index];

            
            return  Stack(
              children: [
                // ALL video realed Stff

                // Akane Position er help e Coloum use kore Name , caption , Song Name kora hoyeche

                GestureDetector(
                    onTap: () {},
                    child:
                        videoPlayer(uri: Uri.parse(data.videoUrl.toString()))),
                Positioned(
                    bottom: 25,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 25, left: 10),
                              child: Container(
                                  margin:
                                      EdgeInsets.only(top: Get.height * 0.03),
                                  child: Text(
                                    data.name.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: Get.height * .015, left: Get.height * 0.01),
                          width: Get.width * .6,
                          alignment: Alignment.topLeft,
                          child: ExpandableText(
                            data.captions.toString(),
                            expandText: "",
                            collapseOnTextTap: true,
                            maxLines: 1,
                            expandOnTextTap: true,
                            linkColor: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 8),
                          child: Text(data.songName.toString()),
                        )
                      ],
                    )),

                //Akane again position , er Column er help e like , Command Icon Gulo create kora hoyeche

                Positioned(
                    bottom: 100,
                    right: 15,
                    child: Container(
                        color: Colors.black.withOpacity(.03),
                        height: Get.height * .28,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  vcontroller.addlikes(data.id);
                                },
                                icon: data.likes.contains(data.uid)
                                    ? const Icon(
                                        Icons.favorite_sharp,
                                        color: Colors.pink,
                                      )
                                    : const Icon(Icons.favorite_border)),
                            IconButton(
                                onPressed: () {
                                  ShareModel().onShare(
                                      context, data.videoUrl.toString());
                                },
                                icon: Icon(Icons.share)),
                            IconButton(
                                onPressed: () {
                                  Get.bottomSheet(
                                      elevation: 10,
                                      // barrierColor: Colors.amber,
                                      backgroundColor:
                                          Colors.black.withOpacity(.3),
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            // ignore: sized_box_for_whitespace
                                            Container(
                                              height:data.commentsCount.isEmpty ? Get.height * .1 : Get.height * .45,
                                              child:data.commentsCount.isEmpty ? const Text("No Comment yet , Make First Comment!") :  ListView.builder(
                                                itemCount: data.commentsCount.length ,
                                                itemBuilder: (context, index1) {
                                                  return  commentPage(name: data.name , comment: data.commentsCount[data.commentsCount.length - index1-1]);
                                                },
                                              ),
                                            ),

                                            //Akane Command er Text Field kora Aache
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
                                              child: TextField(
                                                controller: commentController,
                                                maxLines: 1,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  hintText: "Add a Command " ,
                                                  suffixIcon: IconButton(
                                                      onPressed: () {

                                                          vcontroller.addComment( commentController.text.trim().toString() , data.id );
                                                        commentController.text ="";
                                                        Get.back(); 

                                                      },
                                                      icon: const Icon(
                                                          Icons.send)),
                                                  prefixIcon: const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: CircleAvatar(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ));
                                },
                                icon:const Icon(Icons.comment))
                          ],
                        )))
              ],
            );
          },
        );
      },
    ));
  }
}
