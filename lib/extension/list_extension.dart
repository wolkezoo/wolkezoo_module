import 'package:wolkezoo_module/tools/object/object_tools.dart';

Type getListGenericType<E>() => E;

extension ListExtension on List {
  T? gainByLength<T>(int index, {T? other}) {
    if (index >= length) {
      return other;
    }
    return this[index];
  }

  int sum() {
    if (this.isEmpty) {
      return 0;
    }
    num sumCount = 0;
    for (var a0 in this) {
      try {
        sumCount += toInt(a0);
      } catch (e) {
        continue;
      }
    }

    return sumCount.toInt();
  }
}
