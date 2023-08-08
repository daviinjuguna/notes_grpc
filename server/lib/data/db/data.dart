import 'package:protos/protos.dart';

final notes = <Note>[]..sort((a, b) => b.timeInEpoch.compareTo(a.timeInEpoch));
final todos = <Todo>[];
