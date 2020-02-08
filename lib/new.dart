import 'package:flutter/material.dart';

class Blowup extends StatefulWidget {
  final List ab;
  final Function addli;
  Blowup(this.ab, this.addli);

  @override
  _BlowupState createState() => _BlowupState();
}

class _BlowupState extends State<Blowup> {
  TextEditingController cont = new TextEditingController();

  var str;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        height: MediaQuery.of(context).size.height * 0.22,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                hintText: 'Type your Remainder',
              ),
              controller: cont,
              onSubmitted: (_) {
                widget.addli(cont.text);
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'Done',
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                widget.addli(cont.text);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
