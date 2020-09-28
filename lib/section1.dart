import 'package:flutter/material.dart';
import "screen2.dart";
import "screen3.dart";

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter beginner',
      theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.lime,
          brightness: Brightness.dark
      ),
      home : MyStatefulWidget(title: 'Belajar flutter awal'),
      routes: <String,WidgetBuilder>{
        '/screen2': (BuildContext context) => Screen2(),
        '/screen3': (BuildContext context) => Screen3(),
      },
    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key, this.title}) :super(key:key);

  final String title;
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var myPaint = Colors.red;
  bool checkInput = false;
  int gender = 1;
  void changeColor(){
    setState(() {
      myPaint = Colors.lightBlue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.beenhere),
                onPressed: (){
                  Navigator.pushNamed(context, '/screen2');
                }
            ),IconButton(
                icon: Icon(Icons.map),
                onPressed: (){
                  print('icon2');
                }
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image(
                      image:AssetImage('images/sip.gif')
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:30.0,left:16.0),
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage(
                          'images/sip.gif'),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top:120.0,left:16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Riventus AHA',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color:Colors.white70
                        )),
                        Text('Flutter tutorial from Riventus',
                            style: TextStyle(
                                color: Colors.white70
                            ))
                      ],
                    ),
                  )
                ],
              ),
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Halo there'),
                    onTap: (){
                      print('icon from drawer nav');
                    },
                  ),ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Halo there'),
                    onTap: (){
                      print('icon from drawer nav');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            print('float button');
          },
        ),
        body: Padding(
          padding: EdgeInsets.only(top : 40.0, left : 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Username"
                  ),
                  onChanged: (input){
                    print(input);
                  },
                ),
              ),

              Checkbox(
                value: checkInput,
                onChanged: (bool value){
                  print(value);
                  setState(() {
                    checkInput = value;
                  });
                },
              ),

              ButtonBar(
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: gender,
                    onChanged: (int value){
                      print(value);
                      setState(() {
                        gender = value;
                      });
                    },
                  ),Radio(
                    value: 2,
                    groupValue: gender,
                    onChanged: (int value){
                      print(value);
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                ],
              ),

              Card(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.person,textDirection: TextDirection.ltr,),
                        onPressed: (){
                          print('icon button person');
                        },
                      ),
                      Text('Child 2', textDirection: TextDirection.ltr,),
                      Text('Child 3', textDirection: TextDirection.ltr,),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top : 8.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.person),
                          onPressed: (){
                            print('icon button person');
                          },
                        ),
                        Expanded(
                          child: Text('Child 2', textDirection: TextDirection.ltr,),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: (){
                            print('icon button person');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Image(
                image: AssetImage("images/sip.gif"),
              )

            ],
          ),
        )
    );
  }
}