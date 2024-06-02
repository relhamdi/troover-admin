import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/services/_services.dart';
import 'package:troover_admin/utils/_utils.dart';

class DegreeProvider extends GenericProvider<Degree> {
  DegreeProvider({
    required this.resumeProvider,
  }) : super(
          fromJson: Degree.fromJson,
          modelFields: [
            ModelField<String>(label: 'name', fieldType: String),
            ModelField<String>(label: 'school', fieldType: String),
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
          fetchItemsFunc: ApiService.degree.getAll,
          addItemFunc: ApiService.degree.insert,
          updateItemFunc: ApiService.degree.update,
          deleteItemFunc: ApiService.degree.delete,
        );

  final ResumeProvider resumeProvider;
}
