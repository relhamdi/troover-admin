import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/services/base_service.dart';
import 'package:troover_admin/utils/_utils.dart';

class CompanyProvider extends GenericProvider<Company> {
  CompanyProvider({
    required this.userProvider,
    required this.subscriptionProvider,
  }) : super(
          fromJson: Company.fromJson,
          modelFields: [
            // ModelField<User>(
            //   label: 'user',
            //   fieldType: User,
            //   provider: userProvider,
            // ),
            ModelField<String>(label: 'name', fieldType: String),
            ModelField<int>(label: 'siret', fieldType: int),
            ModelField<Subscription>(
              label: 'subscription',
              fieldType: Subscription,
              provider: subscriptionProvider,
            ),
          ],
          fetchItemsFunc: ApiService.company.getAll,
          addItemFunc: ApiService.company.insert,
          updateItemFunc: ApiService.company.update,
          deleteItemFunc: ApiService.company.delete,
        );

  final UserProvider userProvider;
  final SubscriptionProvider subscriptionProvider;
}
