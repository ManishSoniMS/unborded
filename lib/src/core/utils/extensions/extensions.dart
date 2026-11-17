import 'package:intl/intl.dart';

extension NumberExtensions on num {
  String get toAmount {
    final formatter = NumberFormat('###,###,###,###,###,###.##');
    return formatter.format(this);
  }
}
