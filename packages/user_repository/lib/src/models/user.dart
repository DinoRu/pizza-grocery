
import '../entities/entity.dart';

class MyUser {
  String userId;
  String email;
  String name;
  bool hasActiveCart;

  MyUser({
    required this.userId,
    required this.name,
    required this.email,
    required this.hasActiveCart,
  });

  static final empty = MyUser(
      userId: '',
      name: '',
      email: '',
      hasActiveCart: false
  );

  MyUserEntity toEntity() {
    return MyUserEntity(
        userId: userId,
        name: name,
        email: email,
        hasActiveCart: false
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        userId: entity.userId,
        name: entity.name,
        email: entity.email,
        hasActiveCart: entity.hasActiveCart
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "MyUser: $userId, $name, $hasActiveCart";
  }
}