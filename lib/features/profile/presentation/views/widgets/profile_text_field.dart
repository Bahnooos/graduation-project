import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';

class ProfileTextField extends StatefulWidget {
  final String label;
  final String initialValue;
  final Function(String)? onSave;
  final String? Function(String?)? validator;

  const ProfileTextField({
    super.key,
    required this.label,
    required this.initialValue,
    this.onSave,
    this.validator,
  });

  @override
  State<ProfileTextField> createState() => _EditableProfileFieldState();
}

class _EditableProfileFieldState extends State<ProfileTextField> {
  late TextEditingController _controller;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void save() {
    if (widget.validator == null ||
        widget.validator!(_controller.text) == null) {
      widget.onSave?.call(_controller.text);
      setState(() {
        _isEditing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: Styles.latoRegular14),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                enabled: _isEditing,
                validator: widget.validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.textFieldColor,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide:
                        BorderSide(color: AppColor.primaryColor, width: 2.0),
                  ),
                  hintStyle: Styles.latoRegular14
                      .copyWith(color: AppColor.hintTextColor),
                ),
              ),
            ),
            const SizedBox(width: 10),
            if (!_isEditing)
              IconButton(
                icon: const Icon(Icons.edit, color: AppColor.primaryColor),
                onPressed: toggleEdit,
              )
            else
              IconButton(
                icon: const Icon(Icons.save, color: Colors.green),
                onPressed: save,
              ),
          ],
        ),
      ],
    );
  }
}
