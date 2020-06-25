import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WuiSelectField extends StatelessWidget {

  final List<String> options;
  final InputDecoration decoration;
  final Function onChange;
  final int selected;

  WuiSelectField({
    this.selected,
    this.options,
    this.decoration,
    this.onChange
  });

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = selected >= 0 ? options[selected] : '';
    return Container(
      child: TextField(
        controller: controller,
        decoration: decoration.copyWith(
          suffixIcon: Icon(Icons.keyboard_arrow_down)
        ),
        onTap: () async {
          int index = await showDialog(
            context: context,
            builder: (context) => Dialog(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: (options ?? []).asMap().map(
                    (index, item) => MapEntry(index, RawMaterialButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24, 
                        vertical: 16
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(item)
                          ),
                          (selected != null ? 
                            (selected == index ? 
                              Icon(Icons.check, color : Colors.deepPurple) : 
                            Container()) : 
                            Container())
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(index);
                      },
                    ))
                  ).values.toList(),
                ),
              ),
            )
          );
          if(index != null) {
            controller.text = options[index];
            if(onChange != null) {
              onChange(index);
            }
          }
        },
        readOnly: true,
      )
    );
  }
}