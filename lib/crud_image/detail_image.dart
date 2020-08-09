import 'package:flutter/material.dart';
//import './editdata.dart';
import 'package:http/http.dart' as http;
//import './main.dart';
import 'package:nexdesk/crud_image/list_image.dart';
import 'package:nexdesk/crud_image/update_image.dart';

class DetailImage extends StatefulWidget {
  List list;
  int index;
  DetailImage({this.index, this.list});
  @override
  _DetailState createState() => new _DetailState();

  Widget build(BuildContext context) {
    return MaterialApp(
      //home: FormTicket(title: appTitle),
      routes: <String, WidgetBuilder>{
        '/list_image': (BuildContext context) => new ListImage(),
        '/update_image': (BuildContext context) => new UpdateImage(),
      },
    );
  }
}

class _DetailState extends State<DetailImage> {
  void deleteData() {
    var url = "http://192.168.56.1/api_flutter/upload_delete_image.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Are You sure want to delete '${widget.list[widget.index]['name']}'"),
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ListImage()),
            // );
            Navigator.pushReplacementNamed(context, '/list_image');
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 30.0),
        ),
        Image.network(
          "http://192.168.56.1/api_flutter/uploads/" +
              widget.list[widget.index]['name'],
          height: 100,
          width: 200,
          fit: BoxFit.fitWidth,
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 30.0),
        ),
        new Text(
          widget.list[widget.index]['description'],
          style: new TextStyle(fontSize: 20.0),
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
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new UpdateImage(
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
      ])),
    );
  }
}
