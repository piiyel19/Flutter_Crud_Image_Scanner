import 'package:flutter/material.dart';
import 'package:nexdesk/main.dart';
import 'package:nexdesk/ticket/form_ticket.dart';
import 'package:nexdesk/ticket/list_ticket.dart';
import 'package:nexdesk/qr_scanner/qr_scanner.dart';
import 'package:nexdesk/crud_image/crud_image.dart';

class AdminPage extends StatelessWidget {
  AdminPage({this.username});
  final String username;

  final appTitle = 'Nex-Desk';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => new MyApp(),
        '/form_ticket': (BuildContext context) => new FormTicket(),
        '/list_ticket': (BuildContext context) => new ListTicket(),
        '/qr_scanner': (BuildContext context) => new QrCodeScannerPage(),
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
              title: Text('QR Scanner'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/qr_scanner');
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
