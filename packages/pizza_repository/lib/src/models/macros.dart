import '../entities/entities.dart';

class Macros {
  int calories;
  int proteins;
  int fat;
  int crabs;

  Macros({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.crabs
  });

  MacrosEntity toEntity() {
    return MacrosEntity(
      calories: calories,
      proteins: proteins,
      fat: fat,
      crabs: crabs,
    );
  }

  static Macros fromEntity(MacrosEntity entity) {
    return Macros(
      calories: entity.calories,
      proteins: entity.proteins,
      fat: entity.fat,
      crabs: entity.crabs,
    );
  }
}

