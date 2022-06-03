import 'package:flutter/services.dart';

Future<void> hideKeyboard() async => await SystemChannels.textInput.invokeMethod('TextInput.hide');
