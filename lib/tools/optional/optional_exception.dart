class NullException implements Exception {

  String get message => "null pointer exception";

}


class NoSuchElementException implements Exception {
  late String message;
  NoSuchElementException(this.message);
}