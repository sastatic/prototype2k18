import 'dart:async';
import 'package:flutter/material.dart';
import 'package:katchecode_camera/katchecode_camera.dart';
import 'Screens/Camera.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'Screens/CardDisplay.dart';
List<CameraDescription> cameras;



void main() {
  runApp(new MaterialApp(home:new HomePage()));
}
class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Null> next() async {
  cameras = await availableCameras();
  Navigator.push(context, 
          MaterialPageRoute(builder: (context) => CameraApp()));
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.transparent,
        body:Center(
                  child: new Stack(
            fit : StackFit.expand,
            children: <Widget>[
              new Image(
                image : new AssetImage("assets/background_grey.jpg"),
                fit:BoxFit.cover,
                color: Colors.black54,
                colorBlendMode: BlendMode.darken,

              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0,right:20.0,bottom:50.0),
                        child: SizedBox(
                            width: 300.0,
                            height: 50.0,
                            child: new OutlineButton(
                            color: Colors.white30,
                            
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
                            borderSide: BorderSide(color:Colors.white30,width: 2.0),
                            child: const Text('SCAN',style: TextStyle(fontSize: 22.0,color: Colors.white54,fontFamily: "Raleway"),),
                            onPressed: () {
                              next();
                            },
                    ),
                        )),
                    new Container(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0,right:20.0),
                        child: SizedBox(
                            width: 300.0,
                            height:50.0,
                            child: new OutlineButton(
                            color: Colors.white30,
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
                            borderSide: BorderSide(color:Colors.white30,width: 2.0),
                            child: const Text('STORED',style: TextStyle(fontSize: 20.0,color: Colors.white54,fontFamily: "Raleway"),),
                            onPressed: () {
                            
                            Navigator.push(context, 
          MaterialPageRoute(builder: (context) => CardDisplay("Raghav Tayal","","9992186348","","Raghav2234","raghavtayal2@gmail.com")));  
                            },
                    ),
                        )),

                ],
              )
            ],
          ),
        ) 
        ,
    );
  }
}
  /*Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body:new Container(
       child: new Column(
         children: <Widget>[
           new Container(
             padding: EdgeInsets.all(10.0),
             child: new FlatButton(
               child:new Card(
                 child: new Text("Camera"),
               ),
               onPressed: (){
                 next();
               },
             ),
           ),
           new Container(
             padding: EdgeInsets.all(10.0),
             child: new FlatButton(
               child:new Card(
                 child: new Text("Saved Contacts"),
               )
             ),
           )
         ],
       ),
    )
    );
  }
}*/
/*List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(new CameraApp());
}

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => new _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = new CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return new Container();
    }
    return new AspectRatio(
        aspectRatio:
        controller.value.aspectRatio,
        child: new CameraPreview(controller));
  }
}*/