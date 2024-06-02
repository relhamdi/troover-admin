import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/services/_services.dart';
import 'package:troover_admin/utils/_utils.dart';

class ResumeProvider extends GenericProvider<Resume> {
  ResumeProvider({
    required this.userProvider,
  }) : super(
          fromJson: Resume.fromJson,
          modelFields: [
            ModelField<String>(label: 'motorize', fieldType: String),
            ModelField<String>(label: 'frequency', fieldType: String),
            // ModelField<User>(
            //   label: 'user',
            //   fieldType: User,
            //   provider: userProvider,
            // ),
          ],
          fetchItemsFunc: ApiService.resume.getAll,
          addItemFunc: ApiService.resume.insert,
          updateItemFunc: ApiService.resume.update,
          deleteItemFunc: ApiService.resume.delete,
        );

  final UserProvider userProvider;
}
