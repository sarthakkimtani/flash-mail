import "package:flutter/material.dart";

class InputField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextInputAction inputAction;
  final String? Function(String?) validator;
  final void Function(String?) onSaved;
  final TextInputType? inputType;
  final bool? obscureText;

  const InputField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.inputAction,
    required this.validator,
    required this.onSaved,
    this.inputType,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: inputType,
          textInputAction: inputAction,
          obscureText: obscureText ?? false,
          validator: validator,
          onSaved: onSaved,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(22, 39, 56, 1),
            hintText: placeholder,
            hintStyle: const TextStyle(
              color: Color.fromRGBO(127, 133, 141, 1),
            ),
            errorStyle: const TextStyle(
              fontFamily: "Inter",
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
