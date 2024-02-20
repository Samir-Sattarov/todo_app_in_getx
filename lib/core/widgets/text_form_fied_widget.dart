import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String hint;
  final Function(String)? onSubmit;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool readOnly;
  final bool isPassword;
  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.hint,
    this.onSubmit,
    this.onChanged,
    this.enabled = true,
    this.readOnly = false,
    this.isPassword = false,
    this.validator,
  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  String errorText = "";

  bool obscure = false;

  @override
  void initState() {
    if (widget.isPassword) {
      obscure = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxHeight: 60,
            minHeight: 60,
          ),
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color(0xffECECEC),
              blurRadius: 12.7,
              offset: Offset(0, 1),
            )
          ]),
          child: Center(
            child: TextFormField(
              controller: widget.controller,
              obscureText: obscure,
              onTap: null,
              validator: (value) {
                final response = widget.validator?.call(value);

                if (response != null) {
                  errorText = response;
                  setState(() {});
                } else {
                  errorText = "";
                  setState(() {});
                }
                return response;
              },
              enabled: widget.enabled,
              readOnly: widget.readOnly,
              onChanged: (value) => widget.onChanged?.call(value),
              onFieldSubmitted: (value) => widget.onSubmit?.call(value),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: widget.hint,
                fillColor: Colors.white,
                errorStyle: const TextStyle(fontSize: 0, height: 0.01),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 22,
                ),
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF747E83),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (errorText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Text(
              errorText,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontFamily: "Nunito",
              ),
            ),
          ),
      ],
    );
  }
}
