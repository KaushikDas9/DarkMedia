// import 'dart:ffi';

// import 'package:clonetiktok/2.DOMAIN/StateManage/buttonNavigationState.dart';
// import 'package:clonetiktok/3.APPLICATION/VIEW/videoAddPage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MyButtomNavigation extends StatefulWidget {
//   const MyButtomNavigation({super.key});

//   @override
//   State<MyButtomNavigation> createState() => _MyButtomNavigationState();
// }

// class _MyButtomNavigationState extends State<MyButtomNavigation> {

//   // int current= 2;
// buttonNavigationStatemanage statemanage = Get.put(buttonNavigationStatemanage());
// // buttonNavigationStatemanage statemanage = Get.find();
//   @override
//   Widget build(BuildContext context) {


//     return  Obx(() =>    NavigationBar( destinations:  [
//       NavigationDestination(icon: Icon(Icons.home), label: "home"),
//       NavigationDestination(icon: Icon(Icons.search), label: "Search"),
//       NavigationDestination( icon: Icon(Icons.add), label: "add"),
//       NavigationDestination(icon: Badge(child: Icon(Icons.notifications_sharp)), label: "Massenger"),
//       NavigationDestination(icon: Badge( label: Text( statemanage.currentPage.toString() ), child: Icon(Icons.person)), label: "Profile"),
//     ],
     
//      elevation: 2,
//      height: Get.height*.085 ,
//      indicatorColor: Colors.amber,
//      backgroundColor: Colors.blue,
//      selectedIndex: statemanage.currentPage.value,
     
//      animationDuration: Duration(seconds: 1),
//       onDestinationSelected: (value) {
//         print("sjdbnf");
//          statemanage.pageChange(value);

//           if( value == 2 ) Get.to(const videoAddPage() );
//       },
//      )


//     );
//   }
// }





import 'package:clonetiktok/2.DOMAIN/StateManage/buttonNavigationState.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/videoAddPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButtomNavigation extends StatefulWidget {
  const MyButtomNavigation({super.key});

  @override
  State<MyButtomNavigation> createState() => _MyButtomNavigationState();
}

class _MyButtomNavigationState extends State<MyButtomNavigation> {

  // int current= 2;
buttonNavigationStatemanage statemanage = Get.put(buttonNavigationStatemanage());

  @override
  Widget build(BuildContext context) {


    return  Obx(() =>    BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home) , label: "Home" ),
      BottomNavigationBarItem(icon: Icon(Icons.search) , label: "Search" ),
      BottomNavigationBarItem(icon: Icon(Icons.add) , label: "add" ),
      BottomNavigationBarItem(icon: Badge(child: Icon(Icons.notifications_sharp)) , label: "Notifications" ),
      BottomNavigationBarItem(icon: Badge(child: Icon(Icons.person) , label: Text("2") ) , label: "Profile" ),
    ], 
   elevation: 100,
    //  height: Get.height*.085 ,
    //  indicatorColor: Colors.amber,
     backgroundColor: Colors.black.withOpacity(.00) ,

     currentIndex: statemanage.currentPage.value,
     type:BottomNavigationBarType.fixed ,
     selectedFontSize: 9,
     unselectedFontSize: 6,
     showUnselectedLabels: false,
     showSelectedLabels: true,
     
     selectedItemColor: Colors.amber,
     onTap: (value) {
       statemanage.pageChange(value);
     },

    )


    );
  }
}



