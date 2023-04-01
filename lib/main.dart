import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaml/yaml.dart';
import 'package:zmk_keymap_editor/extensions/yaml_converter.dart';
import 'package:zmk_keymap_editor/widgets/layout.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'models/keymap.dart';
import 'providers/zmk_behaviors_data_provider.dart';

void main() {
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
  print(Keymap.fromJson(
      (loadYaml(File('/home/flafydev/kyria-keymap.yaml').readAsStringSync())
              as YamlMap)
          .toMap()));
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData.dark(), 
      home: Scaffold(
        body: Center(
          child: Container(
            child: LayoutWidget(),
          ),
        ),
      ),
    );
  }
}
