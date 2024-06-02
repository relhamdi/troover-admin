import 'package:troover_admin/services/_services.dart';

class ApiService {
  static final ApiAuth auth = ApiAuth();
  static final ApiUser user = ApiUser();
  static final ApiDomain domain = ApiDomain();
  static final ApiDemand demand = ApiDemand(apiDomain: domain);
  static final ApiApplyDemand applyDemand = ApiApplyDemand();
  static final ApiResume resume = ApiResume();
  static final ApiSkill skill = ApiSkill();
  static final ApiInterest interest = ApiInterest();
  static final ApiExperience experience = ApiExperience();
  static final ApiDegree degree = ApiDegree();
  static final ApiSubscription subscription = ApiSubscription();
}
