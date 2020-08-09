import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:nexdesk/AdminPage.dart';

class QrCodeScannerPage extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();

  Widget build(BuildContext context) {
    return MaterialApp(
      //home: FormTicket(title: appTitle),
      routes: <String, WidgetBuilder>{
        '/AdminPage': (BuildContext context) => new AdminPage(),
      },
    );
  }
}

class _MyAppState extends State<QrCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey();
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new AdminPage())),
          ),
          title: Text("Sample"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: QRView(
                key: qrKey,
                onQRViewCreated: (controller) {
                  controller.scannedDataStream.listen((value) {
                    setState(() {
                      barcode = value;
                    });
                  });
                },
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Result: $barcode'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
