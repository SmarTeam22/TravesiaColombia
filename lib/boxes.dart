import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/local_lugares_model.dart';

class Boxes{

    static Box<LocalLugares> getFavoriteBox() => Hive.box<LocalLugares>('favorites');
}