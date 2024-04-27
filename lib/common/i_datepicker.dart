import 'package:flutter/material.dart';

class IDatePicker extends StatefulWidget {
  final String? name;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const IDatePicker({
    super.key,
    required this.name,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,

  });

  @override
  _IDatePickerState createState() => _IDatePickerState();
}

class _IDatePickerState extends State<IDatePicker> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: _selectedDate?.toString(),
            onTap: () => _selectDate(context),
            readOnly: true,
            decoration: InputDecoration(
              labelText: widget.name,
            ),
            validator: widget.validator,
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
          ),
        ),
      ],
    );
  }
}
