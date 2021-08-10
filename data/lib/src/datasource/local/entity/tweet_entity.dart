import 'package:moor_flutter/moor_flutter.dart';

class Tweets extends Table {
  IntColumn? get id => integer().autoIncrement()();
}
