import '../models/models.dart';
import 'entities.dart';

class PizzaEntity {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;

  PizzaEntity({
    required this.pizzaId,
    required this.name,
    required this.description,
    required this.picture,
    required this.isVeg,
    required this.spicy,
    required this.price,
    required this.discount,
    required this.macros,
  });

  Map<String, Object?> toDocument() {
    return {
      'pizzaId': pizzaId,
      'name': name,
      'description': description,
      'picture': picture,
      'isVeg': isVeg,
      'spicy': spicy,
      'price': price,
      'discount': discount,
      'macros': macros.toEntity().toDocument(),
    };

  }

  static PizzaEntity fromDocument(Map<String, dynamic> doc) {
    return PizzaEntity(
        pizzaId: doc['pizzaId'],
        name: doc['name'],
        description: doc['description'],
        price: doc['price'],
        picture: doc['picture'],
        isVeg: doc['isVeg'],
        spicy: doc['spicy'],
        discount: doc['discount'],
        macros: Macros.fromEntity(MacrosEntity.fromDocument(doc['macros'])),
    );
  }
  

}