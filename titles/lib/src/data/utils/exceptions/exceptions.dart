abstract class AppExceptions implements Exception {
  final mensage;
  final StackTrace? stackTrace;

  AppExceptions(this.mensage, [this.stackTrace]);

  @override
  String toString() {
    if (stackTrace != null) {
      return '$runtimeType: $mensage\n$stackTrace';
    }
    return '$runtimeType: $mensage';
  }
}
