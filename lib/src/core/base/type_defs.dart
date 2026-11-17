import 'package:fpdart/fpdart.dart';

import '../error/failure.dart';

typedef FailureOr<T> = Future <Either<Failure, T>>;