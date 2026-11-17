
import '../utils/enums/enums.dart';

class Failure {
  new({required this.code, required this.message, required this.object});

  final FailureCodes code;
  final String message;
  final Object? object;
}
