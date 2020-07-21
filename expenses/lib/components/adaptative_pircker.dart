import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativePircker extends StatelessWidget {
  final DateTime selectDate;
  final Function(DateTime) onDateChangend;

  AdaptativePircker({
    this.selectDate,
    this.onDateChangend,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickerDate) {
      if (pickerDate == null) {
        return;
      }
      onDateChangend(pickerDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChangend,
            ),
          )
        : Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(selectDate == null
                      ? 'Nenhum data Selecionada!'
                      : 'Data selecionada ${DateFormat('d/M/y').format(selectDate)}'),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    "seleciona a data",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => _showDatePicker(context),
                )
              ],
            ),
          );
  }
}
