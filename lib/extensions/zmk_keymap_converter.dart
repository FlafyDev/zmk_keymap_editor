import 'package:zmk_keymap_editor/models/keymap.dart';
import 'package:zmk_keymap_editor/models/zmk_data.dart';
import 'package:zmk_keymap_editor/providers/zmk_behaviors_data_provider.dart';

extension ZMKKeymapConverter on Keymap {
  String toZmkKeymap(List<ZMKDataBehavior> behaviorsData) {
    final layers = this.layers.map((layer) {
       return layer.copyWith(
         keys: layer.keys.map((key) {
           final data = behaviorsData.firstWhere((data) => data.code == key.code);
           int index = -1;
           final newParams = key.params.map((param) {
             index++;
             if (data.params[index] == ZMKBehaviorParamType.layer) {
               return this.layers.indexWhere((layer) => layer.name == param).toString();
             }
             return param;
           }).toList();
           return key.copyWith(params: newParams);
         }).toList(),
       );
    }).toList();

    final allKeys =
        layers.map((layer) => layer.keys).expand((e) => e).toList();
    final allBehaviorsUsed = allKeys
        .map((e) => behaviorsData.firstWhere((data) => data.code == e.code))
        .toSet()
        .toList();


    print(allBehaviorsUsed);
    final includes = [
          "#include <behaviors.dtsi>",
          "#include <dt-bindings/zmk/keys.h>",
        ] +
        allBehaviorsUsed
            .map((e) => e.includes ?? [])
            .expand((e) => e)
            .toSet()
            .toList();

    final layersString = layers.asMap().entries.map((e) {
      final index = e.key;
      final layer = e.value;

      final keyList = layer.keys
          .map((key) => "&${key.code} ${key.params.join(' ')}".trim())
          .join(" ");

      return "layer_$index \{ bindings = <$keyList>; \};";
    }).toList();

    final keymap =
        "keymap \{ compatible = \"zmk,keymap\"; ${layersString.join(' ')} \};";

    return """
${includes.join("\n")}

/ {
    $keymap
};
    """
        .trim();
  }
}
