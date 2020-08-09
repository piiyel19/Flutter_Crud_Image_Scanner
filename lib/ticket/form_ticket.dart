import 'package:flutter/material.dart';
import 'package:nexdesk/main.dart';
//import 'package:nexdesk/ticket/form_ticket.dart';
import 'package:nexdesk/ticket/list_ticket.dart';
import 'package:http/http.dart' as http;
import 'package:nexdesk/AdminPage.dart';

class FormTicket extends StatefulWidget {
  FormTicket({this.username});
  final String username;

  final appTitle = 'Create Ticket';

  @override
  _AddDataState createState() => new _AddDataState();

  Widget build(BuildContext context) {
    return MaterialApp(
      //home: FormTicket(title: appTitle),
      routes: <String, WidgetBuilder>{
        '/AdminPage': (BuildContext context) => new AdminPage(),
      },
    );
  }
}

class _AddDataState extends State<FormTicket> {
  TextEditingController controllerCode = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();

  void addData() {
    var url = "http://192.168.56.1/api_flutter/adddata.php";

    http.post(url, body: {
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new AdminPage())),
        ),
        title: Text("Add Data"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                      hintText: "Item Code", labelText: "Item Code"),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                      hintText: "Item Name", labelText: "Item Name"),
                ),
                new TextField(
                  controller: controllerPrice,
                  decoration: new InputDecoration(
                      hintText: "Price", labelText: "Price"),
                ),
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                      hintText: "Stock", labelText: "Stock"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("ADD DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    addData();
                    // Navigator.pop(context, true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormTicket()),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
