import 'package:flutter/material.dart';

class Checkboxx extends StatefulWidget {
  bool state;
  final id;
  final Function chng;
  Checkboxx(this.state, this.chng, this.id);
  @override
  _CheckboxxState createState() => _CheckboxxState();
}

class _CheckboxxState extends State<Checkboxx> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Checkbox(
        activeColor: Theme.of(context).primaryColor,
        checkColor: Colors.white,
        value: widget.state,
        onChanged: (value) {
          setState(() {
            widget.state = value;
          });
          widget.chng(widget.state, widget.id);
        },
      ),
    );
  }
}
