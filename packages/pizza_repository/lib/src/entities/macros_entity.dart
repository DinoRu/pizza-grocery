class MacrosEntity {
  int calories;
  int proteins;
  int fat;
  int crabs;

  MacrosEntity({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.crabs
  });

  Map<String, Object?> toDocument() {
    return {
      'calories': calories,
      'proteins': proteins,
      'fat': fat,
      'crabs': crabs,
    };
  }

  static MacrosEntity fromDocument(Map<String, dynamic> doc) {
    return MacrosEntity(
      calories: doc['calories'],
      proteins: doc['proteins'],
      fat: doc['fat'],
      crabs: doc['crabs'],
    );
  }

}