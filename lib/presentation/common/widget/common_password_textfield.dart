import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonjoo/utils/value_extension.dart';

import '../../../app_translation.dart';
import '../../../domain/models/enums/common_form_validate_type.dart';
import '../../../utils/type_defs.dart';
import '../common_color.dart';

class CommonPasswordTextField extends StatelessWidget {
  const CommonPasswordTextField({
    Key? key,
    required this.textEditingController,
    required this.label,
    required this.hint,
    required this.isPasswordShown,
    required this.toggleListener,
    this.actionInput = TextInputAction.done,
    this.errorText = '',
    this.isRequired = false,
    this.addAsterisk = false,
    this.validators = const <CommonFormValidateType>[],
    this.icon
  }) : super(key: key);

  final TextEditingController textEditingController;
  final TextInputAction actionInput;
  final String label;
  final String hint;
  final bool isPasswordShown;
  final PasswordToggleListener toggleListener;
  final String errorText;
  final bool isRequired;
  final bool addAsterisk;
  final List<CommonFormValidateType> validators;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    var newHint = addAsterisk ? '$hint*' : hint;
    var newLabel = addAsterisk ? '$label*' : label;

    return TextFormField(
      decoration: InputDecoration(
        hintText: newHint,
        labelText: newLabel,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        errorText: errorText.nullIfEmpty(),
        errorMaxLines: 2,
        floatingLabelStyle: _floatingLabelStyle(),
        icon: icon,
        iconColor: CommonColor.darkGrey,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        suffixIcon: isPasswordShown
            ? IconButton(
                onPressed: () => toggleListener(false),
                icon: const Icon(Icons.visibility_off, color: CommonColor.aqua),
              )
            : IconButton(
                onPressed: () => toggleListener(true),
                icon: const Icon(Icons.visibility, color: CommonColor.aqua),
              ),
      ),
      validator: _handleValidator,
      controller: textEditingController,
      obscureText: !isPasswordShown,
      enableSuggestions: false,
      autocorrect: false,
      textInputAction: actionInput,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  _floatingLabelStyle() {
    return MaterialStateTextStyle.resolveWith((states) {
      if (states.contains(MaterialState.error)) {
        return const TextStyle(
          color: Colors.transparent
        );
      } else if (states.contains(MaterialState.focused)) {
        return const TextStyle(
          color: Colors.transparent
        );
      } else {
        return const TextStyle(
          color: Colors.transparent
        );
      }
    });
  }

  String? _handleValidator(String? value) {
    var isRequired = validators.contains(
      CommonFormValidateType.noEmpty,
    );

    if (isRequired && (value == null || value.isEmpty)) {
      return AppTranslation.textErrorEmpty.trParams({
        'fieldName': label,
      });
    }

    return null;
  }
}
