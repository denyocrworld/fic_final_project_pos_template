import 'package:flutter/material.dart';

class QCheckField extends StatefulWidget {
  final String label;
  final String? hint;
  final List<Map<String, dynamic>> items;
  final String? Function(List<Map<String, dynamic>> item)? validator;
  final Future<List<Map<String, dynamic>>> Function()? onFuture;
  final Function(List<Map<String, dynamic>> values, List ids) onChanged;

  const QCheckField({
    Key? key,
    required this.label,
    required this.items,
    this.validator,
    this.onFuture,
    this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<QCheckField> createState() => _QCheckFieldState();
}

class _QCheckFieldState extends State<QCheckField> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    for (var item in widget.items) {
      items.add(Map.from(item));
    }
    loadItems();
  }

  loadItems() async {
    if (widget.onFuture == null) return;

    List<Map<String, dynamic>> newItems = await widget.onFuture!();
    items = newItems;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: false,
      // validator: widget.validator,
      // validator: (value) => validate(items),
      validator: (value) => widget.validator!(items),
      enabled: true,
      builder: (FormFieldState<bool> field) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: field.errorText,
            border: InputBorder.none,
            helperText: widget.hint,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return CheckboxListTile(
                title: Text("${item["label"]}"),
                value: item["checked"] ?? false,
                onChanged: (val) {
                  items[index]["checked"] = val;
                  field.didChange(true);
                  setState(() {});

                  String? label = items[index]["label"];
                  int foundIndex =
                      items.indexWhere((item) => item["label"] == label);
                  dynamic value = items[foundIndex]["value"];

                  List<Map<String, dynamic>> selectedValues =
                      items.where((i) => i["checked"] == true).toList();

                  List ids = selectedValues.map((e) => e["value"]).toList();
                  widget.onChanged(selectedValues, ids);
                },
              );
            },
          ),
        );
      },
    );
  }
}
