import '../entities/entities.dart';
import 'models.dart';


class Pizza {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;

  Pizza({
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


  PizzaEntity toEntity() {
    return PizzaEntity(
        pizzaId: pizzaId,
        name: name,
        description: description,
        isVeg: isVeg,
        spicy: spicy,
        picture: picture,
        price: price,
      discount: discount,
      macros: macros,
    );
  }

  static Pizza fromEntity(PizzaEntity entity) {
    return Pizza(
        pizzaId: entity.pizzaId,
        name: entity.name,
        picture: entity.picture,
        description: entity.description,
        isVeg: entity.isVeg,
        spicy: entity.spicy,
        price: entity.price,
        discount: entity.discount,
        macros: entity.macros,
    );
  }

}