import 'package:onr_app/features/users/data/models/user_model.dart';
import 'package:onr_app/features/users/domain/entities/user.dart';

class UserModelMapper {
  static User toEntity(UserModel model) {
    return User(
      id: model.id,
      email: model.email,
      username: model.username,
      phone: model.phone,
      address: Address(
        city: model.address.city,
        street: model.address.street,
        number: model.address.number.toString(),
        zipcode: model.address.zipcode,
      ),
      name: Name(
        firstname: model.name.firstname,
        lastname: model.name.lastname,
      ),
    );
  }

  static UserModel toModel(User entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      username: entity.username,
      phone: entity.phone,
      password: "-_-",
      address: AddressModel(
        city: entity.address.city,
        street: entity.address.street,
        number: int.parse(entity.address.number),
        zipcode: entity.address.zipcode,
        geolocation: GeolocationModel(lat: "lat", long: "long")
      ),
      name: NameModel(
        firstname: entity.name.firstname,
        lastname: entity.name.lastname,
      ),
    );
  }

  static List<User> toEntityList(List<UserModel> models) {
    return models.map(toEntity).toList();
  }
}
