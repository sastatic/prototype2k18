import 'package:flutter/material.dart';

class CardDisplay extends StatefulWidget {
  String name ;
  String address;
  String phone ;
  String linkedin ;
  String git ;
  String email ;
  List list1  = new List();
  List list2 = new List();
  int cnt = 0;

  CardDisplay(String name, String address, String phone, String linkedin, String git, String email){
    this.name = name;
    this.address = address;
    this.phone = phone;
    this.git = git;
    this.email = email;
    this.linkedin = linkedin;
      /*if(name != "") {
        list1.insert(cnt, "Name");
        list2.insert(cnt, name);
        print(list1[cnt]);
        cnt++;
      }*/
      if (address != ""){
        list1.insert(cnt, "Address");
        list2.insert(cnt, address);
        cnt++;
      }
      if (phone != ""){
        list1.insert(cnt, "Phone");
        list2.insert(cnt, phone);
        cnt++;
      }
      if (git != ""){
        list1.insert(cnt, "Github Id");
        list2.insert(cnt, git);
        cnt++;
      }
      if (email != ""){
        list1.insert(cnt, "Email Id");
        list2.insert(cnt, email);
        cnt++;
      }
  }
  _CardDisplayState createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body : Center(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            
            padding: EdgeInsets.only(left:5.0,top: 30.0,bottom: 50.0),
            child: new Text("Card Details", style: new TextStyle(fontSize: 28.0,  color: Colors.white)),
          ),
          Container(
            padding: EdgeInsets.only(left : 20.0, bottom: 25.0),
            child: new Text(widget.name, style: TextStyle(fontSize: 32.0, color : Colors.white,fontFamily: "Raleway",decoration: TextDecoration.underline)),
          ),
          new SizedBox(
            height: 400.0,
            child: _buildList(context)),
          new Row(
          children :<Widget> [
               Container(
                 padding: EdgeInsets.only(left : 20.0, right: 90.0),
                  child: new OutlineButton(
                  color: Colors.white30,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
                  borderSide: BorderSide(color:Colors.white30,width: 2.0),
                  child: const Text('SAVE',style: TextStyle(fontSize: 20.0,color: Colors.white54,fontFamily: "Raleway"),),
                  onPressed: () {
                        
                  },
                  ),
               ),
                new OutlineButton(
                color: Colors.white30,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
                borderSide: BorderSide(color:Colors.white30,width: 2.0),
                child: const Text('DISCARD',style: TextStyle(fontSize: 20.0,color: Colors.white54,fontFamily: "Raleway"),),
                onPressed: () {
                      
                },
                ),
            ]
          ),
        ],
      )
      ]
      )
    )
    );
  }
  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: widget.cnt,
      itemBuilder: (context,index) {
        return new Container(
          
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left : 20.0, bottom: 8.0),
                    child: new Text(widget.list1[index], style: TextStyle(fontSize: 14.0, color : Colors.white30)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0,bottom: 10.0),
                  child : new Text(widget.list2[index], style: TextStyle(fontSize: 18.0, color : Colors.white))
                )
              ],
            ),
          
        );
        
      },
    );
  }
}