abstract class Behavior {
  final String behavior;
  final String? first;
  final String? second;

  Behavior(this.behavior, this.first, this.second);
}

class KeyPressBehavior extends Behavior {
  final int key;
  KeyPressBehavior(this.key) : super("kp", key.toString(), null);
}

class BluetoothBehavior extends Behavior {
  final int key;
  BluetoothBehavior(this.key) : super("kp", key.toString(), null);
}
