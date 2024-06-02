import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/services/_services.dart';
import 'package:troover_admin/utils/_utils.dart';

class InterestProvider extends GenericProvider<Interest> {
  InterestProvider({
    required this.resumeProvider,
  }) : super(
          fromJson: Interest.fromJson,
          modelFields: [
            ModelField<String>(label: 'label', fieldType: String),
            ModelField<String>(label: 'type', fieldType: String),
            ModelField<Resume>(
              label: 'resume',
              fieldType: Resume,
              provider: resumeProvider,
            ),
          ],
          fetchItemsFunc: ApiService.interest.getAll,
          addItemFunc: ApiService.interest.insert,
          updateItemFunc: ApiService.interest.update,
          deleteItemFunc: ApiService.interest.delete,
        );

  final ResumeProvider resumeProvider;
}
