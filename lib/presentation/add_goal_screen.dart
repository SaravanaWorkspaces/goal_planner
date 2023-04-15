import 'package:flutter/material.dart';

class AddGoalScreen extends StatefulWidget {
  const AddGoalScreen({super.key});

  @override
  State<AddGoalScreen> createState() => _AddGoalScreenState();
}

class _AddGoalScreenState extends State<AddGoalScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Set a Goal"),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            tooltip: 'Save goal',
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _goalTitle(),
                _goalDescription(),
                _goalDate(),
                const SizedBox(
                  height: 16,
                ),
                _reviewIntervalText(),
              ],
            )),
      ),
    );
  }
}

TextFormField _goalTitle() => TextFormField(
    maxLength: 48,
    decoration: const InputDecoration(
        border: UnderlineInputBorder(), labelText: 'Enter title*'),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter title';
      }
      return null;
    });

TextFormField _goalDescription() => TextFormField(
    decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Enter description',
        alignLabelWithHint: true),
    keyboardType: TextInputType.multiline,
    minLines: 5,
    maxLines: 7);

TextFormField _goalDate() => TextFormField(
    focusNode: AlwaysDisabledFocusNode(),
    onTap: _onCalendarPressed,
    readOnly: true,
    decoration: const InputDecoration(
        suffixIcon:
            IconButton(onPressed: null, icon: Icon(Icons.calendar_month)),
        border: UnderlineInputBorder(),
        labelText: "Achieve before"));

void _onCalendarPressed() {
  print("_onCalendarPressed");
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

Text _reviewIntervalText() => const Text(
      "Review interval",
      style: TextStyle(fontSize: 17, color: Colors.black54),
    );
