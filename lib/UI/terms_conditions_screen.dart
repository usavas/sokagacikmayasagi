import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sokagacikmayasagi/consts.dart';
import 'package:sokagacikmayasagi/services/shared_pref_service.dart';
import 'package:sokagacikmayasagi/shared_widgets/buttons.dart';

import 'home_screen.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key key, this.isAcceptButton = true})
      : super(key: key);

  final bool isAcceptButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bilgilendirme',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  FutureBuilder(
                    future: _loadStringFromFile(),
                    builder: (context, snapshot) => Text(snapshot.data ?? ''),
                  ),
                  SizedBox(height: 20),
                  !isAcceptButton
                      ? SizedBox()
                      : WideButton(
                          buttonText: 'Tamam',
                          backgroundColor: Colors.white54,
                          onPressedFunction: () {
                            SharedPrefService.instance
                                .setTermsAndConditionsRead(true);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                          },
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String> _loadStringFromFile() async {
    return await rootBundle.loadString('assets/texts/terms_and_conditions.txt');
  }
}
