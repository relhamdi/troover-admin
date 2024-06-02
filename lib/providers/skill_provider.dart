import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/services/_services.dart';
import 'package:troover_admin/utils/_utils.dart';

class SkillProvider extends GenericProvider<Skill> {
  SkillProvider({
    required this.resumeProvider,
  }) : super(
          fromJson: Skill.fromJson,
          modelFields: [
            ModelField<String>(label: 'name', fieldType: String),
            ModelField<String>(label: 'description', fieldType: String),
            ModelField<String>(label: 'type', fieldType: String),
            ModelField<Resume>(
              label: 'resume',
              fieldType: Resume,
              provider: resumeProvider,
            ),
          ],
          fetchItemsFunc: ApiService.skill.getAll,
          addItemFunc: ApiService.skill.insert,
          updateItemFunc: ApiService.skill.update,
          deleteItemFunc: ApiService.skill.delete,
        );

  final ResumeProvider resumeProvider;
}
