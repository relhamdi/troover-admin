import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:troover_admin/pages/_pages.dart';
import 'package:troover_admin/utils/_utils.dart';

class ErrorNotFoundPage extends StatelessWidget {
  const ErrorNotFoundPage({
    Key? key,
  }) : super(key: key);

  static const String routeName = '${Constants.baseRoute}404/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.errorString),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.errorNotFoundTitle),
            Text(AppLocalizations.of(context)!.errorNotFoundDesc),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Redirect to home if connected, else login page
                Navigator.pushNamed(context, HomePage.routeName);
              },
              child: Text(AppLocalizations.of(context)!.btnGoHome),
            ),
          ],
        ),
      ),
    );
  }
}
