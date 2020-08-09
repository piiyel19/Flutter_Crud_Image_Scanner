import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nexdesk/main.dart';
import 'package:nexdesk/ticket/form_ticket.dart';
//import 'package:nexdesk/ticket/list_ticket.dart';
import 'package:nexdesk/ticket/edit_ticket.dart';
import 'package:http/http.dart' as http;

class ListTicket extends StatefulWidget {
  ListTicket({this.username});
  final String username;

  final appTitle = 'Create Ticket';

  @override
  _HomeState createState() => new _HomeState();

  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      //home: FormTicket(title: appTitle),
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => new MyApp(),
        '/form_ticket': (BuildContext context) => new FormTicket(),
        '/list_ticket': (BuildContext context) => new ListTicket(),
      },
    );
  }
}

class _HomeState extends State<ListTicket> {
  Future<List> getData() async {
    final response =
        await http.get("http://192.168.56.1/api_flutter/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MY STORE"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new FormTicket(),
        )),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('asset/image/bg1.jpg'))),
            ),
            ListTile(
              title: Text('Create Ticket'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/form_ticket');
              },
            ),
            ListTile(
              title: Text('List Ticket'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/list_ticket');
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/main');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new EditTicket(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['item_name']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Stock : ${list[i]['stock']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
