import 'package:flutter/foundation.dart';

import 'type_defs.dart';

@immutable
abstract class IUseCase<ReturnType, Param> {
  FailureOr<ReturnType> call(Param param);
}

class NoParams {
  const NoParams();
}
