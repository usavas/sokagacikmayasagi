import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sokagacikmayasagi/models/time_left.dart';
import 'package:sokagacikmayasagi/services/curfew_provider.dart';
import 'package:sokagacikmayasagi/shared_widgets/buttons.dart';

class ResultPositiveScreen extends StatefulWidget {
  const ResultPositiveScreen({Key key}) : super(key: key);

  @override
  _ResultPositiveScreenState createState() => _ResultPositiveScreenState();
}

class _ResultPositiveScreenState extends State<ResultPositiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CurfewProvider>(builder: (context, provider, child) {
      return Container(
        color: Color(0xffffcc33),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/cangoout.png',
                width: MediaQuery.of(context).size.width * .8,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Eve dönmen için kalan süre:',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              StreamBuilder<TimeLeft>(
                  stream: provider.getTimeLeft,
                  initialData: provider.timeLeft,
                  builder: (context, timeLeftSnap) {
                    if (!timeLeftSnap.data.isTimeLeft()) {
                      return Text(
                        'Üzgünüm, süren doldu. Eve dönmelisin!',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return Text(
                        timeLeftSnap.data.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      );
                    }
                  }),
            ],
          ),
        ),
      );
    });
  }
}
