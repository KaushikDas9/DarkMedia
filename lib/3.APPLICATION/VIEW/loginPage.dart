
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clonetiktok/3.APPLICATION/COMMON/STRING/UseString.dart';
import 'package:clonetiktok/3.APPLICATION/WIDGET/CustomTextField.dart';
import 'package:clonetiktok/3.APPLICATION/WIDGET/MyCustomButton.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/SingInPage.dart';
import 'package:glitcheffect/glitcheffect.dart';
import 'package:clonetiktok/2.DOMAIN/Firebase/fireAuth.dart';


class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();

  
}

class _loginPageState extends State<loginPage> {
 




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  TextEditingController _UserNameController = TextEditingController();
  TextEditingController _PassWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.black.withOpacity(.94)),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlitchEffect(child: SizedBox(height: height*.1, child: Text( allUsesString().appName , style: TextStyle(fontSize: 40, color: Colors.white ),))),
              myCustomTextField(hintName: allUsesString().enterName, labelText:allUsesString().labelName , myIcon:const Icon(Icons.mail), myController: _UserNameController, hideText: false ),
              SizedBox(height: height*.02,),
              myCustomTextField(hintName: allUsesString().enterPassword, labelText: allUsesString().passWord, myIcon:const Icon(Icons.lock), myController: _PassWordController,hideText: true, ),
              SizedBox(height: height*.03,),
              MyCustomButtom(butoomText: allUsesString().loginButton , myOnPressd:  () { fireAuth().login(userEmail: _UserNameController.text, userPassword: _PassWordController.text);}),
              CupertinoButton(child: Text(allUsesString().createAccount), onPressed: (){ Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => signInPage(),  ) , (route) => false,) ;} )
            ],
          )),
    );
  }
}
