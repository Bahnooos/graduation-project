import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';

class EditableProfileTextField extends StatefulWidget {
  final String label;
  final String initialValue;
  final Function(String)? onSave;
  final String? Function(String?)? validator;

  const EditableProfileTextField({
    super.key,
    required this.label,
    required this.initialValue,
    this.onSave,
    this.validator,
  });

  @override
  State<EditableProfileTextField> createState() => _EditableProfileFieldState();
}

class _EditableProfileFieldState extends State<EditableProfileTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });

    if (_isEditing) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
      });
    }
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
        Text(widget.label, style: Styles.latoBold16),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                focusNode: _focusNode,
                enabled: _isEditing,
                validator: widget.validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      _isEditing ? Colors.white : AppColor.textFieldColor,
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
        const SizedBox(height: 15),
      ],
    );
  }
}
