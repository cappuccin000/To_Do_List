import 'package:flutter/material.dart';
import './checkbox.dart';
import './alertedit.dart';

class Lists extends StatelessWidget {
  final ab;
  final Function chng;
  final Function dellis;
  final Function changelis;
  Lists(this.ab, this.chng, this.dellis, this.changelis);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        showDialog(
            context: context,
            builder: (_) =>
                Alertedit(text: ab['text'], id: ab['id'], chnglis: changelis),
            barrierDismissible: true);
      },
      onLongPress: () {
        dellis(ab['id']);
      },
      child: Card(
        color: Theme.of(context).backgroundColor,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          child: Row(
            children: <Widget>[
              Checkboxx(ab['state'], chng, ab['id']),
              Text(
                ab['text'],
                style: ab['state'] == false
                    ? Theme.of(context).textTheme.body1
                    : Theme.of(context).textTheme.body2,
              ),
            ],
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
