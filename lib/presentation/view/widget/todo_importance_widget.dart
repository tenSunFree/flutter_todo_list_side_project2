import 'package:flutter/material.dart';

enum Selection { none, low, medium, high }

class TodoImportanceWidget extends StatefulWidget {
  final Function(Selection) onSelectionChanged;

  const TodoImportanceWidget({Key? key, required this.onSelectionChanged})
      : super(key: key);

  @override
  TodoImportanceWidgetState createState() => TodoImportanceWidgetState();
}

class TodoImportanceWidgetState extends State<TodoImportanceWidget> {
  Selection _selected = Selection.none;

  void _updateSelection(Selection selection) {
    setState(() {
      _selected = selection;
    });
    widget.onSelectionChanged(selection);
  }

  BoxDecoration _buttonDecoration(Selection selection, int index, int length) {
    bool isFirst = index == 0;
    bool isLast = index == length - 1;
    return BoxDecoration(
      color: _selected == selection ? const Color(0xFFE8DEF8) : Colors.white,
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(isFirst ? 100 : 0),
        right: Radius.circular(isLast ? 100 : 0),
      ),
      border: Border.all(color: const Color(0xFFADA8B3), width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Selection> selections = Selection.values;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Importance',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(selections.length, (index) {
            Selection selection = selections[index];
            return Expanded(
              child: GestureDetector(
                onTap: () => _updateSelection(selection),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration:
                      _buttonDecoration(selection, index, selections.length),
                  child: Center(
                    child: Text(
                      formatEnumString(selection.toString()),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  String formatEnumString(String enumString) {
    String result = enumString.split('.').last;
    return result[0].toUpperCase() + result.substring(1).toLowerCase();
  }
}
