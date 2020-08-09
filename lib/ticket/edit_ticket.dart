import 'package:flutter/material.dart';
//import './editdata.dart';
import 'package:http/http.dart' as http;
//import './main.dart';
import 'package:nexdesk/ticket/list_ticket.dart';
import 'package:nexdesk/ticket/update_ticket.dart';

class EditTicket extends StatefulWidget {
  List list;
  int index;
  EditTicket({this.index, this.list});
  @override
  _DetailState createState() => new _DetailState();

  Widget build(BuildContext context) {
    return MaterialApp(
      //home: FormTicket(title: appTitle),
      routes: <String, WidgetBuilder>{
        '/list_ticket': (BuildContext context) => new ListTicket(),
        '/update_ticket': (BuildContext context) => new UpdateData(),
      },
    );
  }
}

class _DetailState extends State<EditTicket> {
  void deleteData() {
    var url = "http://192.168.56.1/api_flutter/deleteData.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Are You sure want to delete '${widget.list[widget.index]['item_name']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "OK DELETE!",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            deleteData();
            //Navigator.pop(context);
            Navigator.of(context, rootNavigator: true).pop('dialog');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListTicket()),
            );
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () =>
              Navigator.of(context, rootNavigator: true).pop('dialog'),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['item_name']}")),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['item_name'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Text(
                  "Code : ${widget.list[widget.index]['item_code']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Price : ${widget.list[widget.index]['price']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Stock : ${widget.list[widget.index]['stock']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.green,
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new UpdateData(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                    ),
                    new RaisedButton(
                      child: new Text("DELETE"),
                      color: Colors.red,
                      onPressed: () => confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
