import 'package:hive/hive.dart';
import 'package:market/model/tovar.dart';

part 'hisob.g.dart';

@HiveType(typeId: 1)
class Hisob {
  @HiveField(0)
  Tovar tovar;
  @HiveField(1)
  int soni;
  @HiveField(2)
  double foyda;

  Hisob({required this.tovar,required this.soni,required this.foyda});
}
