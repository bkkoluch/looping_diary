import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> hideKeyboard() async => await SystemChannels.textInput.invokeMethod('TextInput.hide');

void showKeyboardAndFocusNode(BuildContext context, FocusNode node) => FocusScope.of(context).requestFocus(node);
