import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WuiDatePicker extends StatelessWidget {

  final InputDecoration? decoration;
  final Function? onSelect;
  final DateTime? initialDate;

  WuiDatePicker({
    this.decoration,
    this.onSelect,
    this.initialDate
  });

  final TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    DateTime _initialDate = initialDate ?? DateTime.now();
    textController.text = DateFormat('d MMM y').format(_initialDate);

    return TextField(
      decoration: decoration != null ? decoration!.copyWith(
        suffixIcon: Icon(Icons.date_range)
      ) : null,
      readOnly: true,
      controller: textController,
      onTap: () async {
        DateTime? date = await showDatePicker(
          context: context, 
          initialDate: initialDate ?? DateTime.now(), 
          firstDate: DateTime.fromMillisecondsSinceEpoch(0), 
          lastDate: DateTime.now()
        );
        onSelect!(date);
      },
    );
    
  }
}