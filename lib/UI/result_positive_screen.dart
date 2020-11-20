import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sokagacikmayasagi/models/time_left.dart';
import 'package:sokagacikmayasagi/services/curfew_provider.dart';
import 'package:sokagacikmayasagi/shared_widgets/buttons.dart';

class ResultPositiveScreen extends StatelessWidget {
  const ResultPositiveScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CurfewProvider>(builder: (context, value, child) {
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
                'Eve donmen icin kalan sure:',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              (value.timeLeft == null || !value.timeLeft.isTimeLeft())
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Uzgunum, suren doldu. Evde olmalisin',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    )
                  //todo: test this with widget tests maybe
                  : StreamProvider<TimeLeft>(
                      create: (_) => value.getTimeLeft,
                      child: Consumer<TimeLeft>(
                        builder: (context, value, child) => Text(
                          value.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: WideButton(
                  buttonText: 'Yenile',
                  icon: Icon(Icons.refresh),
                  onPressedFunction: () {},
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
