import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/services/base_service.dart';
import 'package:troover_admin/utils/_utils.dart';

class ApplyDemandProvider extends GenericProvider<ApplyDemand> {
  ApplyDemandProvider({
    required this.userProvider,
    required this.demandProvider,
  }) : super(
          fromJson: ApplyDemand.fromJson,
          modelFields: [
            // ModelField<User>(
            //   label: 'user',
            //   fieldType: User,
            //   provider: userProvider,
            // ),
            ModelField<Demand>(
              label: 'demand',
              fieldType: Demand,
              provider: demandProvider,
            ),
            ModelField<String>(label: 'status', fieldType: String),
          ],
          fetchItemsFunc: ApiService.applyDemand.getAll,
          addItemFunc: ApiService.applyDemand.insert,
          updateItemFunc: ApiService.applyDemand.update,
          deleteItemFunc: ApiService.applyDemand.delete,
        );

  final UserProvider userProvider;
  final DemandProvider demandProvider;
}
