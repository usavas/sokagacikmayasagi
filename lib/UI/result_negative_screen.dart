import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sokagacikmayasagi/UI/advertisement_view.dart';
import 'package:sokagacikmayasagi/services/curfew_provider.dart';
import 'package:sokagacikmayasagi/services/curfew_service.dart';
import 'package:sokagacikmayasagi/shared_widgets/buttons.dart';

class ResultNegativeScreen extends StatelessWidget {
  const ResultNegativeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        // height: MediaQuery.of(context).size.height,
        color: Color(0xff2c345c),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/uzgunum.png',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: Consumer<CurfewProvider>(
                  builder: (context, provider, widget) => WideButton(
                      buttonText: 'Pekala :/',
                      onPressedFunction: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
              SizedBox(height: 20),
              BannerAdvertisementView(),
            ],
          ),
        ),
      ),
    );
  }
}
