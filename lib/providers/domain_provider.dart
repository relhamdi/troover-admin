import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/services/_services.dart';
import 'package:troover_admin/utils/_utils.dart';

class DomainProvider extends GenericProvider<Domain> {
  DomainProvider()
      : super(
          fromJson: Domain.fromJson,
          modelFields: [
            ModelField<String>(label: 'name', fieldType: String),
          ],
          fetchItemsFunc: ApiService.domain.getAll,
          addItemFunc: ApiService.domain.insert,
          // updateItemFunc: ApiService.domain.update,
          deleteItemFunc: ApiService.domain.delete,
        ) {
    init();
  }

  void init() {
    modelFields.add(ModelField<Domain>(
      label: 'domainParent',
      fieldType: Domain,
      provider: this,
    ));
  }
}
