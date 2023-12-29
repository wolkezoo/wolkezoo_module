Type getListGenericType<E>() => E;

extension ListExtension on List {
  T? gainByLength<T>(int index, {T? other}) {
    if (index > length) {
      return other;
    }
    return this[index];
  }
}
