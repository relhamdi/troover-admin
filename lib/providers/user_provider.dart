import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/services/_services.dart';
import 'package:troover_admin/utils/_utils.dart';

class UserProvider extends GenericProvider<User> {
  UserProvider()
      : super(
          fromJson: User.fromJson,
          modelFields: [
            ModelField<String>(label: 'firstname', fieldType: String),
            ModelField<String>(label: 'lastname', fieldType: String),
            ModelField<String>(label: 'email', fieldType: String),
            ModelField<int>(label: 'imageId', fieldType: int),
            ModelField<DateTime>(label: 'emailVerifiedAt', fieldType: DateTime),
            ModelField<String>(label: 'password', fieldType: String),
            ModelField<bool>(label: 'enable', fieldType: bool),
            ModelField<String>(
              label: 'userType',
              fieldType: String,
              items: UserTypes.getValues(),
            ),
            ModelField<String>(label: 'color', fieldType: String),
          ],
          fetchItemsFunc: ApiService.user.getAll,
          addItemFunc: ApiService.user.insert,
          // updateItemFunc: ApiService.user.update,
          deleteItemFunc: ApiService.user.delete,
        );
}
