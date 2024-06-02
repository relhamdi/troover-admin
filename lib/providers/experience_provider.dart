import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/services/_services.dart';
import 'package:troover_admin/utils/_utils.dart';

class ExperienceProvider extends GenericProvider<Experience> {
  ExperienceProvider({
    required this.resumeProvider,
  }) : super(
          fromJson: Experience.fromJson,
          modelFields: [
            ModelField<String>(label: 'societyName', fieldType: String),
            ModelField<String>(label: 'postName', fieldType: String),
            ModelField<String>(label: 'place', fieldType: String),
            ModelField<DateTime>(label: 'startDate', fieldType: DateTime),
            ModelField<DateTime>(label: 'endDate', fieldType: DateTime),
            ModelField<String>(label: 'description', fieldType: String),
            ModelField<Resume>(
              label: 'resume',
              fieldType: Resume,
              provider: resumeProvider,
            ),
          ],
          fetchItemsFunc: ApiService.experience.getAll,
          addItemFunc: ApiService.experience.insert,
          updateItemFunc: ApiService.experience.update,
          deleteItemFunc: ApiService.experience.delete,
        );

  final ResumeProvider resumeProvider;
}
