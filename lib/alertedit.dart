import 'package:flutter/material.dart';

class Alertedit extends StatelessWidget {
  final text;
  final id;
  final Function chnglis;
  Alertedit({this.text = 'text', this.id, this.chnglis});
  TextEditingController cont = new TextEditingController();
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        backgroundColor: Theme.of(context).backgroundColor,
        title: const Text('Edit'),
        content: TextFormField(
          controller: cont,
          decoration: InputDecoration(
            hintText: text,
          ),
          onFieldSubmitted: (_) {
            chnglis(cont.text, id);
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          FlatButton(
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          FlatButton(
            child: Text(
              'Done',
              style: Theme.of(context).textTheme.button,
            ),
            onPressed: () {
              chnglis(cont.text, id);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
