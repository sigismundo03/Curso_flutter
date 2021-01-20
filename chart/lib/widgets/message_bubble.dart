import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Key key;
  final String userName;
  final String message;
  final bool belongsToMe;

  MessageBubble(this.message, this.belongsToMe, this.userName, {this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: belongsToMe ? Colors.grey : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft:
                  belongsToMe ? Radius.circular(12) : Radius.circular(0),
              bottomRight:
                  belongsToMe ? Radius.circular(0) : Radius.circular(12),
            ),
          ),
          width: 140,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: belongsToMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              
                 Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: belongsToMe
                          ? Colors.black
                          : Theme.of(context).accentTextTheme.headline1.color,
                    ),
                  ),
              SizedBox(
                height: 08,
              ),
              Text(
                message,
                style: TextStyle(
                  color: belongsToMe
                      ? Colors.black
                      : Theme.of(context).accentTextTheme.headline1.color,
                ),
                textAlign: belongsToMe ? TextAlign.end :  TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
