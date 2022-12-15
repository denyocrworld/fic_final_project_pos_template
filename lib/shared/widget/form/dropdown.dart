import 'package:flutter/material.dart';

class QDropdownField extends StatefulWidget {
  final String label;
  final String? hint;
  final List<Map<String, dynamic>> items;
  final String? Function(String? value)? validator;
  final String? value;
  final bool emptyMode;
  final Function(dynamic value, String? label) onChanged;

  const QDropdownField({
    Key? key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
    this.emptyMode = true,
    this.hint,
  }) : super(key: key);

  @override
  State<QDropdownField> createState() => _QDropdownFieldState();
}

class _QDropdownFieldState extends State<QDropdownField> {
  List<String> items = [];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    if (widget.emptyMode) items.add("-");

    for (var item in widget.items) {
      items.add(item["label"]);
    }
    selectedValue = widget.value;
  }

  setAllItemsToFalse() {
    for (var item in items) {
      // item["checked"] = false;
    }
  }

  String? get currentValue {
    if (widget.emptyMode && selectedValue == null) {
      return '-';
    }
    return selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: false,
      validator: (value) {
        if (widget.validator != null) {
          return widget.validator!(selectedValue);
        }
        return null;
      },
      enabled: true,
      builder: (FormFieldState<bool> field) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: field.errorText,
            helperText: widget.hint,
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                isExpanded: true,
                value: currentValue,
                icon: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 24.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                iconSize: 16,
                elevation: 16,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                  fontFamily: Theme.of(context).textTheme.bodyText2!.fontFamily,
                  color: Theme.of(context).textTheme.bodyText2!.color,
                ),
                underline: Container(
                  height: 0,
                  color: Colors.grey[300],
                ),
                onChanged: (String? newValue) {
                  if (newValue == "-" && widget.emptyMode) {
                    selectedValue = null;
                  } else {
                    selectedValue = newValue!;
                  }
                  setState(() {});

                  String? label = selectedValue;
                  int index = items.indexWhere((item) => item == label);
                  if (index == -1) {
                    widget.onChanged(label, null);
                    return;
                  }

                  if (widget.emptyMode) {
                    index -= 1;
                  }
                  var value = widget.items[index]["value"];
                  widget.onChanged(value, label);
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        value,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
