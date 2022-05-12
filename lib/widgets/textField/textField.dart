// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:heligate/themes/app_themes.dart';
import 'package:heligate/widgets/text/textNormal.dart';

class TextFields extends StatelessWidget {
  final dynamic keyboardType;
  final dynamic hintText;
  final dynamic labelText;
  final dynamic prefixText;
  final dynamic borderSide;
  final dynamic maxLength;
  final dynamic width;
  final dynamic errorText;
  bool obscureText;
  final dynamic clearText;
  final dynamic initialValue;
  final dynamic onSaved;
  final dynamic enabled;
  final dynamic validator;
  final dynamic paddingBottom;
  final dynamic password;
  final dynamic description;
  final dynamic Function(String) onChanged;
  final dynamic Function()? onTap;
  final dynamic Function()? onChangedObCureText;
  final dynamic Function(bool)? onFocusChange;
  final TextEditingController _controller = new TextEditingController();

  final _isField = GlobalKey<FormState>();

  TextFields(
      {Key? key,
      this.keyboardType = TextInputType.text,
      required this.onChanged,
      this.onChangedObCureText,
      this.enabled,
      this.prefixText,
      this.clearText,
      this.onSaved,
      this.maxLength,
      this.paddingBottom,
      this.labelText,
      this.description,
      this.errorText,
      this.borderSide = true,
      this.onTap,
      this.initialValue,
      this.width,
      this.obscureText = false,
      this.password = false,
      this.onFocusChange,
      this.validator = false,
      this.hintText})
      : super(key: key);

  @override
  SuffixIconRender(clearText, obscureText) {
    if (clearText != null) {
      return IconButton(
        onPressed: () => _controller.clear(),
        icon: const Icon(
          Icons.clear,
          color: AppTheme.colorBorder,
        ),
      );
    }
    if (password == true) {
      return IconButton(
        onPressed: onChangedObCureText,
        icon: Icon(
          obscureText
              ? Icons.remove_red_eye_rounded
              : Icons.remove_red_eye_outlined,
          color: AppTheme.colorBorder,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          width: width,
          decoration: description == null
              ? const BoxDecoration()
              : const BoxDecoration(
                  border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                )),
          child: Row(
            children: [
              description != null
                  ? Row(
                      children: [
                        HG_TextNormal(
                          title: description,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  : Container(),
              Flexible(
                  child: TextFormField(
                initialValue: initialValue,
                onTap: onTap,
                enabled: enabled,
                key: _isField,
                onChanged: onChanged,
                keyboardType: keyboardType,
                maxLength: maxLength,
                onSaved: onSaved,
                obscureText: obscureText,
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 0, vertical: password == false ? 0 : 5),
                  fillColor: Colors.red,
                  border: new UnderlineInputBorder(
                    borderSide: borderSide == true
                        ? const BorderSide(color: AppTheme.colorText)
                        : BorderSide.none,
                  ),
                  labelText:
                      (hintText ?? labelText) + (validator == true ? ' *' : ''),
                  labelStyle:
                      const TextStyle(color: AppTheme.hintText, fontSize: 15),
                  hintStyle:
                      const TextStyle(color: AppTheme.hintText, fontSize: 15),
                  prefixText: prefixText,
                  errorText: errorText,
                  errorMaxLines: 5,
                  errorStyle: const TextStyle(
                    fontSize: 13.0,
                  ),
                  suffixIcon: SuffixIconRender(clearText, obscureText),
                ),
              )),
            ],
          )),
      SizedBox(
        height: paddingBottom,
      )
    ]);
  }
}
