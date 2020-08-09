import 'package:flutter/material.dart';
import 'package:nexdesk/main.dart';
//import 'package:nexdesk/ticket/form_ticket.dart';
import 'package:nexdesk/ticket/list_ticket.dart';
import 'package:nexdesk/crud_image/list_image.dart';
import 'package:nexdesk/crud_image/add_image.dart';

class CrudImage extends StatelessWidget {
  CrudImage({this.username});
  final String username;

  final appTitle = 'Nex-Desk';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => new MyApp(),
        '/add_image': (BuildContext context) => new AddImage(),
        '/list_image': (BuildContext context) => new ListImage(),
        '/list_ticket': (BuildContext context) => new ListTicket(),
        '/crud_image': (BuildContext context) => new CrudImage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page!')),
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
              title: Text('Add Image'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/add_image');
              },
            ),
            ListTile(
              title: Text('List Ticket'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/list_image');
              },
            ),
            ListTile(
              title: Text('List Image'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/list_image');
              },
            ),
            ListTile(
              title: Text('CRUD Image'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/crud_image');
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
