import 'package:agmo_pre_test/core/constants/enums.dart';

extension EventTypeExtension on EventType {
  String enumToString () {
    switch (this) {
      case EventType.inReachProgramme:
        return 'In-Reach Programme';
      default:
        return 'Unknown Event Type';
    }
  }
}