import 'package:wolkezoo_module/tools/object/object_tools.dart';
import 'package:wolkezoo_module/tools/optional/optional_exception.dart';

typedef ElementPredicate<E> = bool Function(E element);
typedef ElementMapperFunction<U, T> = U Function(T element);

final class Optional<T> {
  /// If non-null, the value; if null, indicates no value is present
  T? _value;

  /// Constructs an empty instance.
  ///
  /// @implNote Generally only one empty instance, {@link Optional#EMPTY},
  /// should exist per VM.
  Optional() {
    _value = null;
  }

  /// Returns an empty {@code Optional} instance.  No value is present for this
  /// Optional.
  ///
  /// @apiNote Though it may be tempting to do so, avoid testing if an object
  /// is empty by comparing with {@code ==} against instances returned by
  /// {@code Option.empty()}. There is no guarantee that it is a singleton.
  /// Instead, use {@link #isPresent()}.
  ///
  /// @param <T> Type of the non-existent value
  /// @return an empty {@code Optional}
  static Optional<T> empty<T>() {
    return Optional();
  }

  /// Constructs an instance with the value present.
  ///
  /// @param value the non-null value to be present
  /// @throws NullPointerException if value is null
  Optional<T> optional(T value) {
    if (value == null) {
      throw NullException();
    }
    _value = value;
    return this;
  }

  /// Returns an {@code Optional} with the specified present non-null value.
  ///
  /// @param <T> the class of the value
  /// @param value the value to be present, which must be non-null
  /// @return an {@code Optional} with the value present
  /// @throws NullPointerException if value is null<
  Optional.of(T value) {
    optional(value);
  }

  Optional.ofNullable(T value) {
    if (value != null) {
      _value = value;
    }
  }

  /// If a value is present in this {@code Optional}, returns the value,
  /// otherwise throws {@code NoSuchElementException}.
  ///
  /// @return the non-null value held by this {@code Optional}
  /// @throws NoSuchElementException if there is no value present
  ///
  /// @see Optional#isPresent()
  T get() {
    if (_value == null) {
      throw NoSuchElementException("No value present");
    }
    return _value!;
  }

  /// Return {@code true} if there is a value present, otherwise {@code false}.
  ///
  /// @return {@code true} if there is a value present, otherwise {@code false}
  bool isPresent() {
    return _value != null;
  }

  /// If a value is present, invoke the specified consumer with the value,
  /// otherwise do nothing.
  ///
  /// @param consumer block to be executed if a value is present
  /// @throws NullPointerException if value is present and {@code consumer} is
  /// null
  void ifPresent(Function(T value) consumer) {
    if (_value != null) {
      consumer.call(_value as T);
    }
  }

  Optional<T> filter(ElementPredicate<T> predicate) {
    requireNonNull(predicate);

    if (!isPresent()) {
      return this;
    }

    return predicate.call(_value as T) ? this : empty();
  }

  /// If a value is present, apply the provided mapping function to it,
  /// and if the result is non-null, return an {@code Optional} describing the
  /// result.  Otherwise return an empty {@code Optional}.
  ///
  /// @apiNote This method supports post-processing on optional values, without
  /// the need to explicitly check for a return status.  For example, the
  /// following code traverses a stream of file names, selects one that has
  /// not yet been processed, and then opens that file, returning an
  /// {@code Optional<FileInputStream>}:
  ///
  /// <pre>{@code
  ///     Optional<FileInputStream> fis =
  ///         names.stream().filter(name -> !isProcessedYet(name))
  ///                       .findFirst()
  ///                       .map(name -> new FileInputStream(name));
  /// }</pre>
  ///
  /// Here, {@code findFirst} returns an {@code Optional<String>}, and then
  /// {@code map} returns an {@code Optional<FileInputStream>} for the desired
  /// file if one exists.
  ///
  /// @param <U> The type of the result of the mapping function
  /// @param mapper a mapping function to apply to the value, if present
  /// @return an {@code Optional} describing the result of applying a mapping
  /// function to the value of this {@code Optional}, if a value is present,
  /// otherwise an empty {@code Optional}
  /// @throws NullPointerException if the mapping function is null
  Optional<U> map<U>(ElementMapperFunction<U, T> mapper) {
    requireNonNull(mapper);

    if (!isPresent()) {
      return empty();
    }

    U mapperResult = mapper.call(_value as T);
    return Optional.ofNullable(mapperResult);
  }

  T orElse(T other) {
    return _value != null ? _value as T : other;
  }

  T operator [](T other) {
    return _value != null ? _value as T : other;
  }

  T orElseGet(T Function() other) {
    return _value != null ? _value as T : other.call();
  }

  T orElseThrow(Exception Function() exceptionSupplier) {
    if (_value != null) {
      return _value as T;
    }
    throw exceptionSupplier.call();
  }

  @override
  bool operator ==(Object other) {
    if (other is! Optional) {
      return false;
    }

    Optional<T> other0 = other as Optional<T>;
    return equals(_value as Object, other0._value as Object);
  }

  @override
  int get hashCode => _value.hashCode;

  void requireNonNull(dynamic obj) {
    if (obj == null) {
      throw NullException();
    }
  }
}
