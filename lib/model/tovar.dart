import 'package:hive/hive.dart';

part 'tovar.g.dart';

@HiveType(typeId: 0)
class Tovar {
  @HiveField(0)
  String nomi;
  @HiveField(1)
  double narxi;
  @HiveField(2)
  double TanNarxi;
  @HiveField(3)
  int soni;
  @HiveField(4)
  String image;

  Tovar(
      {required this.nomi,
      required this.narxi,
      required this.TanNarxi,
      required this.soni,
      required this.image});

  @override
  String toString() {
    return 'Tovar{nomi: $nomi, narxi: $narxi, TanNarxi: $TanNarxi, soni: $soni, image: $image}';
  }
}
