import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/services/base_service.dart';
import 'package:troover_admin/utils/_utils.dart';

class SubscriptionProvider extends GenericProvider<Subscription> {
  SubscriptionProvider()
      : super(
          fromJson: Subscription.fromJson,
          modelFields: [
            ModelField<double>(label: 'price', fieldType: double),
            ModelField<bool>(label: 'showDemand', fieldType: bool),
            ModelField<bool>(label: 'demandFilter', fieldType: bool),
            ModelField<bool>(label: 'geoLocation', fieldType: bool),
            ModelField<bool>(label: 'advancedDisplay', fieldType: bool),
            ModelField<bool>(label: 'advancedDemandFilter', fieldType: bool),
          ],
          fetchItemsFunc: ApiService.subscription.getAll,
          addItemFunc: ApiService.subscription.insert,
          // updateItemFunc: ApiService.subscription.update,
          deleteItemFunc: ApiService.subscription.delete,
        );
}
