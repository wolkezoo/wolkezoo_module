import 'package:wolkezoo_module/tools/optional/optional.dart';
import 'package:wolkezoo_module/tools/optional/optional_available.dart';

extension OptionalObjectExtension on Object {
  Optional<Object> get nullOpt => Optional<Object>.ofNullable(this);

  Optional<Object> get opt => Optional<Object>.of(this);
}

extension OptionalStringExtension on String {
  Optional<String> get nullOpt => Optional<String>.ofNullable(this);

  Optional<String> get opt => Optional<String>.of(this);
}

extension OptionalListExtension on List {
  Optional<List> get nullOpt => Optional<List>.ofNullable(this);

  Optional<List> get opt => Optional<List>.of(this);
}

extension OptionalSetExtension on Set {
  Optional<Set> get nullOpt => Optional<Set>.ofNullable(this);

  Optional<Set> get opt => Optional<Set>.of(this);
}

extension OptionalNumExtension on num {
  Optional<num> get nullOpt => Optional<num>.ofNullable(this);

  Optional<num> get opt => Optional<num>.of(this);
}

extension OptionalMapExtension on Map {
  Optional<Map> get nullOpt => Optional<Map>.ofNullable(this);

  Optional<Map> get opt => Optional<Map>.of(this);
}

extension OptionalAvailableExtension on OptionalAvailable {
  Optional<OptionalAvailable> get nullOpt => Optional<OptionalAvailable>.ofNullable(this);

  Optional<OptionalAvailable> get opt => Optional<OptionalAvailable>.of(this);
}
