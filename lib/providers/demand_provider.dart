import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/services/base_service.dart';
import 'package:troover_admin/utils/_utils.dart';

class DemandProvider extends GenericProvider<Demand> {
  DemandProvider({
    required this.userProvider,
    required this.domainProvider,
  }) : super(
          fromJson: Demand.fromJson,
          modelFields: [
            // ModelField<User>(
            //   label: 'user',
            //   fieldType: User,
            //   provider: userProvider,
            // ),
            ModelField<String>(label: 'title', fieldType: String),
            ModelField<int>(label: 'duration', fieldType: int),
            ModelField<DateTime>(label: 'startDate', fieldType: DateTime),
            ModelField<String>(label: 'place', fieldType: String),
            ModelField<bool>(label: 'enable', fieldType: bool),
            ModelField<double>(label: 'salary', fieldType: double),
            ModelField<String>(label: 'schedule', fieldType: String),
            ModelField<int>(label: 'remoteDay', fieldType: int),
            ModelField<String>(label: 'extra', fieldType: String),
            ModelField<Domain>(
              label: 'domains',
              fieldType: Domain,
              provider: domainProvider,
              pickMany: true,
            ),
          ],
          fetchItemsFunc: ApiService.demand.getAll,
          addItemFunc: ApiService.demand.insert,
          updateItemFunc: ApiService.demand.update,
          deleteItemFunc: ApiService.demand.delete,
        );

  final UserProvider userProvider;
  final DomainProvider domainProvider;
}
