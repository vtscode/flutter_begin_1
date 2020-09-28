import 'package:flutter/material.dart';
import "screen2.dart";
import "screen3.dart";

class ListViewExample extends StatelessWidget {
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
      home : MyStatefulWidget(title: 'ToDos'),
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
  String input = '';
  List list = List();

  @override
  void initState(){
    super.initState();
    list.add('number 1');
    list.add('number 2');
    list.add('number 3');
    list.add('number 4');
    list.add('number 5');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add todo'),
                  content: TextField(
                    onChanged: (String value){
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: (){
                        setState(() {
                          list.add(input);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text('Add')
                    )
                  ],
                );
              }
            );
          },
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
              key: Key(list[index]),
              child: ListTile(
                title: Text(list[index]),
              ),
              onDismissed: (direction) {
                setState(() {
                  list.removeAt(index);
                });
              },
            );
          },
        )
    );
  }
}