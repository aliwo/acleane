
import 'package:acleane/screen/home_screen/components/check_tile/journal_check_tile.dart';
import 'package:acleane/screen/home_screen/components/check_tile/routine_check_tile.dart';

import 'check_tile.dart';

CheckTile checkTileFactory(event) {
  if (event['type'] == CheckTile.TYPE_ROUTINE) {
    return RoutineCheckTile(routine: event['routine'],
        journal: event['journal'], checked: event['value']);
  } else if (event['type'] == CheckTile.TYPE_JOURNAL) {
    return JournalCheckTile(journal: event['journal'], checked: event['value']);
  }
  print('뭐야?');
}


