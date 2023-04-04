// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:zmk_keymap_editor/main.dart';
// import 'package:zmk_keymap_editor/models/keymap.dart';
// import 'package:zmk_keymap_editor/models/zmk.dart';
// import 'package:zmk_keymap_editor/models/zmk_data.dart';
// import 'package:zmk_keymap_editor/providers/keymap_provider.dart';
// import 'package:zmk_keymap_editor/providers/zmk_behaviors_data_provider.dart';
// import 'package:zmk_keymap_editor/providers/zmk_keycodes_provider.dart';
// import 'package:zmk_keymap_editor/widgets/key.dart';
// import 'package:collection/collection.dart';
//
// class KeyEditor extends HookConsumerWidget {
//   const KeyEditor(
//     this.behavior, {
//     required this.onKeyModify,
//     this.initialFocus,
//     Key? key,
//   }) : super(key: key);
//
//   final ZMKBehavior behavior;
//   final void Function(ZMKBehavior?) onKeyModify;
//   final int? initialFocus;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final code = useState(behavior.code);
//     final params = useState(behavior.params);
//
//     final editedZmkBehavior = useState<ZMKBehavior>(behavior);
//
//     final zmkBehaviorsData = ref.watch(zmkBehaviorsDataProvider);
//     final behaviorData = useRef<ZMKDataBehavior?>(null);
//     final additionalParameters = useRef<List<ZMKBehaviorParamType>?>(null);
//     // final behaviorData = zmkBehaviorsData.value
//     //     ?.firstWhere((element) => element.code == code.value);
//
//     final controllers = useState<List<TextEditingController>>(
//         List.generate(3, (i) => TextEditingController()));
//
//     useEffect(() {
//       controllers.value[0].text = behavior.code;
//       return null;
//     }, []);
//
//     useEffect(() {
//       editedZmkBehavior.value = ZMKBehavior(code.value, params.value);
//       return null;
//     }, [code.value, params.value]);
//
//     useEffect(() {
//       behaviorData.value = zmkBehaviorsData.value
//           ?.firstWhere((element) => element.code == code.value);
//       return null;
//     }, [code.value, zmkBehaviorsData.value]);
//
//     useEffect(() {
//       controllers.value.skip(1).toList().asMap().entries.forEach((e) {
//         e.value.value = e.value.value.copyWith(
//           text: e.key >= params.value.length ? "" : params.value[e.key].getSaved(),
//         );
//       });
//       return null;
//     }, [params.value]);
//
//     useEffect(() {
//       final key = behaviorData.value?.ext1?.keys.firstWhereOrNull(
//         (e) => e == params.value.first,
//       );
//       if (key != null) {
//         additionalParameters.value =
//             behaviorData.value!.ext1![key]?.params ?? [];
//         int supposedLength = behaviorData.value!.params.length +
//             additionalParameters.value!.length;
//         if (supposedLength > params.value.length) {
//           params.value = [
//             ...params.value,
//             ...List.generate(
//               supposedLength - params.value.length,
//               (i) => "",
//             ),
//           ];
//         } else if (supposedLength < params.value.length) {
//           params.value = params.value.sublist(0, supposedLength);
//         }
//       }
//       return null;
//     }, [behaviorData.value, params.value]);
//     //
//
//     // useEffect(() {
//     //   if (zmkBehaviorsData.value == null) return;
//     //
//     //   final newBehaviorData = zmkBehaviorsData.value
//     //       ?.firstWhere((element) => element.code == code.value);
//     //
//     //   if (newBehaviorData == null)
//     //     throw Exception("Behavior not found for code ${code.value}");
//     //
//     //   params.value = List.generate(
//     //     newBehaviorData.params.length,
//     //     (i) {
//     //       if (i >= params.value.length) return "";
//     //       if (newBehaviorData.params[i] != behaviorData.value!.params[i])
//     //         return "";
//     //
//     //       return i >= params.value.length ? "" : params.value[i];
//     //     },
//     //   );
//     //
//     //   // Can't figure out why setting params.value doesn't trigger a rebuild.
//     //   Future.delayed(Duration(milliseconds: 1)).then((_) {
//     //     params.notifyListeners();
//     //   });
//     //
//     //   behaviorData.value = newBehaviorData;
//     //   return null;
//     // }, [code.value, zmkBehaviorsData.value]);
//
//     return Container(
//       width: 300,
//       height: 500,
//       padding: EdgeInsets.all(12),
//       child: Wrap(
//         runSpacing: 20,
//         children: ([
//           Center(
//             child: KeyWidget(
//               ZMKBehavior(code.value, params.value),
//               size: Size(100, 100),
//             ),
//           ),
//           _AutocompleteField<ZMKDataBehavior>(
//             controller: controllers.value.first,
//             suggestionsCallback: (pattern) async {
//               return zmkBehaviorsData.value?.where((behaviorData) {
//                     return behaviorData.code
//                             .toLowerCase()
//                             .contains(pattern.toLowerCase()) ||
//                         behaviorData.name
//                             .toLowerCase()
//                             .contains(pattern.toLowerCase());
//                   }).toList() ??
//                   [];
//             },
//             autofocus: initialFocus == 0,
//             hintText: "Behavior",
//             itemBuilder: (context, suggestion) {
//               return ListTile(
//                 title: Text(suggestion.name),
//                 subtitle: Text("${suggestion.code} " +
//                     suggestion.params
//                         .map((param) => "<${param.name}>")
//                         .join(", ")),
//               );
//             },
//             onSuggestionSelected: (suggestion) {
//               if (code.value != suggestion.code) {
//                 params.value = List.generate(
//                   suggestion.params.length,
//                   (i) => "",
//                 );
//               }
//               code.value = suggestion.code;
//               controllers.value.first.text = suggestion.code;
//             },
//           ),
//           ...[
//             ...(behaviorData.value?.params ?? []),
//             ...(additionalParameters.value ?? []),
//           ].asMap().entries.map((e) {
//             final index = e.key;
//             final type = e.value;
//
//             return _ParameterField(
//               type: type,
//               autofocus: initialFocus == index + 1,
//               onChanged: (value) {
//                 final newParams = [...params.value];
//                 newParams[index] = value;
//                 params.value = newParams;
//               },
//               controller: controllers.value[index + 1],
//               ext1: behaviorData.value?.ext1?.keys.toList(),
//             );
//           }).toList(),
//           ElevatedButton(
//             onPressed: () {
//               onKeyModify(editedZmkBehavior.value);
//             },
//             child: Text("Save"),
//           ),
//         ]),
//       ),
//     );
//   }
// }
//
// class _AutocompleteSuggestion {
//   const _AutocompleteSuggestion(this.text, {this.description});
//
//   final String text;
//   final String? description;
// }
//
// class _ParameterField extends HookConsumerWidget {
//   const _ParameterField({
//     required this.type,
//     required this.onChanged,
//     this.controller,
//     this.ext1,
//     this.autofocus,
//     Key? key,
//   }) : super(key: key);
//
//   final ZMKBehaviorParamType type;
//   final TextEditingController? controller;
//   final void Function(String) onChanged;
//   final List<String>? ext1;
//   final bool? autofocus;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final keymap = ref.watch(keymapProvider);
//     final keycodes = ref.watch(zmkKeycodesProvider).valueOrNull ?? [];
//
//     final List<_AutocompleteSuggestion> data;
//     final String hintText;
//
//     switch (type) {
//       case ZMKBehaviorParamType.keycode:
//         hintText = "Code";
//         data = keycodes.map((keycode) => _AutocompleteSuggestion(keycode)).toList();
//         break;
//       case ZMKBehaviorParamType.layer:
//         hintText = "Layer";
//         data =
//             keymap.layerNames.map((e) => _AutocompleteSuggestion(e)).toList();
//         break;
//       case ZMKBehaviorParamType.ext1:
//         hintText = "Options";
//         data = ext1!.map((e) => _AutocompleteSuggestion(e)).toList();
//         break;
//       case ZMKBehaviorParamType.int:
//         return TextField(
//           controller: controller,
//           keyboardType: TextInputType.number,
//           onChanged: (value) {
//             onChanged(value);
//           },
//           autofocus: autofocus ?? false,
//           decoration: makeInputDecoration(context, hintText: "Integer"),
//           inputFormatters: [
//             FilteringTextInputFormatter.digitsOnly
//           ], // Only numbers can be entered
//         );
//       case ZMKBehaviorParamType.string:
//         return TextField(
//           controller: controller,
//           onChanged: (value) {
//             controller?.text = value;
//             onChanged(value);
//           },
//           autofocus: autofocus ?? false,
//           decoration: makeInputDecoration(context, hintText: "String"),
//         );
//       case ZMKBehaviorParamType.color:
//         throw UnimplementedError();
//     }
//
//     return _AutocompleteField<_AutocompleteSuggestion>(
//       controller: controller,
//       hintText: hintText,
//       autofocus: autofocus,
//       itemBuilder: (context, suggestion) {
//         return ListTile(
//           title: Text(suggestion.text),
//           subtitle: suggestion.description != null
//               ? Text(suggestion.description!)
//               : null,
//         );
//       },
//       suggestionsCallback: (pattern) async {
//         return data.where((e) {
//           return e.text.toLowerCase().contains(pattern.toLowerCase());
//         }).toList();
//       },
//       onSuggestionSelected: (suggestion) {
//         controller?.text = suggestion.text;
//         onChanged(suggestion.text);
//       },
//     );
//   }
// }
//
// class _AutocompleteField<T> extends StatelessWidget {
//   const _AutocompleteField({
//     this.controller,
//     required this.suggestionsCallback,
//     required this.itemBuilder,
//     required this.onSuggestionSelected,
//     this.hintText,
//     this.autofocus,
//     Key? key,
//   }) : super(key: key);
//
//   final TextEditingController? controller;
//   final FutureOr<Iterable<T>> Function(String) suggestionsCallback;
//   final Widget Function(BuildContext, T) itemBuilder;
//   final void Function(T) onSuggestionSelected;
//   final String? hintText;
//   final bool? autofocus;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return TypeAheadField<T>(
//       textFieldConfiguration: TextFieldConfiguration(
//         controller: controller,
//         autofocus: autofocus ?? false,
//         decoration: makeInputDecoration(context, hintText: hintText),
//       ),
//       hideOnLoading: true,
//       suggestionsCallback: suggestionsCallback,
//       itemBuilder: itemBuilder,
//       onSuggestionSelected: onSuggestionSelected,
//     );
//   }
// }
//
