//#GROUP_TEMPLATE form_
import 'package:flutter/material.dart';

class FormExampleNonReuseableView extends StatefulWidget {
  const FormExampleNonReuseableView({Key? key}) : super(key: key);

  @override
  State<FormExampleNonReuseableView> createState() =>
      FormExampleNonReuseableViewState();
}

class FormExampleNonReuseableViewState
    extends State<FormExampleNonReuseableView> {
  static late FormExampleNonReuseableViewState instance;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool lightMode = false;

  ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      primaryColor: Colors.blueGrey,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blueGrey,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey[900],
        ),
      ),
      hintColor: Colors.orange,
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange[900],
        ),
      ),
      hintColor: Colors.blue,
    );
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: lightMode ? lightTheme : darkTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Form Test"),
          actions: [
            IconButton(
              onPressed: () {
                lightMode = !lightMode;
                setState(() {});
              },
              icon: const Icon(
                Icons.light_mode,
                size: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text("Save"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  bool isValid = formKey.currentState!.validate();
                  if (!isValid) return;
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Basic Form",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //#TEMPLATE form_textfield
                  TextFormField(
                    initialValue: 'John Doe',
                    maxLength: 20,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      helperText: "What's your name?",
                    ),
                    onChanged: (value) {},
                  ),
                  //#END
                  //#TEMPLATE form_textfield_email
                  TextFormField(
                    initialValue: 'admin@gmail.com',
                    maxLength: 20,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      suffixIcon: Icon(
                        Icons.email,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      helperText: 'Enter your email address',
                    ),
                    onChanged: (value) {},
                  ),
                  //#END
                  //#TEMPLATE form_textfield_password
                  TextFormField(
                    initialValue: '123456',
                    maxLength: 20,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      suffixIcon: Icon(
                        Icons.password,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      helperText: 'Enter your password',
                    ),
                    onChanged: (value) {},
                  ),
                  //#END
                  //#TEMPLATE form_numberfield
                  TextFormField(
                    initialValue: '24',
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Age',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      suffixIcon: Icon(
                        Icons.email,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      helperText: 'Enter your email address',
                    ),
                    onChanged: (value) {},
                  ),
                  //#END
                  //#TEMPLATE form_datefield
                  InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      print("pickedDate: $pickedDate");
                    },
                    child: TextFormField(
                      initialValue: '2022-08-01',
                      maxLength: 20,
                      enabled: false,
                      decoration: const InputDecoration(
                        labelText: 'Birth date',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        suffixIcon: Icon(Icons.date_range),
                        helperText: "What's your name?",
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  //#END
                  //#TEMPLATE form_timefield
                  InkWell(
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                        builder: (context, child) {
                          return MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(alwaysUse24HourFormat: true),
                            child: child ?? Container(),
                          );
                        },
                      );
                      print("pickedTime: $pickedTime");
                    },
                    child: TextFormField(
                      initialValue: '08:23',
                      maxLength: 20,
                      enabled: false,
                      decoration: const InputDecoration(
                        labelText: 'Working hour',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        suffixIcon: Icon(Icons.timer),
                        helperText: "What's your name?",
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  //#END
                  //#TEMPLATE form_memofield
                  TextFormField(
                    initialValue: 'Jln. Sukangoding No. 45',
                    maxLength: 200,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      helperText: "What's your address",
                    ),
                    onChanged: (value) {},
                  ),
                  //#END
                  //#TEMPLATE form_radiofield
                  LayoutBuilder(builder: (context, constraint) {
                    String groupValue = "gender";
                    List items = [
                      {
                        "label": "Female",
                        "value": "female",
                        "checked": true,
                      },
                      {
                        "label": "Male",
                        "value": "Male",
                      }
                    ];
                    return FormField(
                      initialValue: false,
                      enabled: true,
                      builder: (FormFieldState<bool> field) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Gender',
                            errorText: field.errorText,
                            border: InputBorder.none,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              var item = items[index];

                              return RadioListTile<dynamic>(
                                title: Text("${item["label"]}"),
                                groupValue: true,
                                value: item["checked"] ?? false,
                                onChanged: (val) {
                                  field.didChange(true);
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  }),
                  //#END
                  //#TEMPLATE form_check
                  LayoutBuilder(builder: (context, constraint) {
                    List items = [
                      {
                        "label": "Flutter",
                        "value": "Flutter",
                      },
                      {
                        "label": "Java",
                        "value": "Java",
                        "checked": true,
                      },
                      {
                        "label": "C#",
                        "value": "C#",
                      }
                    ];
                    return FormField(
                      initialValue: false,
                      enabled: true,
                      builder: (FormFieldState<bool> field) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Gender',
                            errorText: field.errorText,
                            border: InputBorder.none,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              var item = items[index];

                              return CheckboxListTile(
                                title: Text("${item["label"]}"),
                                value: item["checked"] ?? false,
                                onChanged: (value) {
                                  field.didChange(true);
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  }),
                  //#END
                  //#TEMPLATE form_dropdown
                  LayoutBuilder(builder: (context, constraint) {
                    List<String> itemStringList = ["Female", "Male"];

                    return FormField(
                      initialValue: false,
                      enabled: true,
                      builder: (FormFieldState<bool> field) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            labelText: "Gender",
                            errorText: field.errorText,
                            helperText: "Your gender",
                          ),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: "Female",
                                icon: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Icon(
                                    Icons.arrow_drop_down_outlined,
                                    size: 24.0,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                ),
                                iconSize: 16,
                                elevation: 16,
                                style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .fontSize,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .fontFamily,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .color,
                                ),
                                underline: Container(
                                  height: 0,
                                  color: Colors.grey[300],
                                ),
                                onChanged: (String? newValue) {},
                                items: itemStringList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
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
                  }),
                  //#END
                  const SizedBox(
                    height: 300.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
