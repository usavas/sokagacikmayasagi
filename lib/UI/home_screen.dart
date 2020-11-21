import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:sokagacikmayasagi/UI/advertisement_view.dart';
import 'package:sokagacikmayasagi/services/curfew_provider.dart';
import 'package:sokagacikmayasagi/services/curfew_service_mock.dart';
import 'package:sokagacikmayasagi/shared_widgets/buttons.dart';
import 'package:sokagacikmayasagi/UI/result_screen.dart';

import '../services/curfew_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECE5DD),
      appBar: AppBar(
        actions: [],
        centerTitle: true,
        title: Text('Sokağa Çıkma Yasağı'),
      ),
      body: SafeArea(
          child: Center(
        child: Container(
          // decoration: kPageBgDecoration,
          // width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Consumer<CurfewProvider>(builder: (context, provider, child) {
            return SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                ),
                Image.asset(
                  'assets/images/stayhome.png',
                  width: 98,
                  height: 84,
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Sokağa çıkabilir miyim?',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3 * 2,
                  child: Text(
                    'Öğrenmek için aşağıdaki bilgileri doldur',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1900),
                            maxTime: DateTime.now(), onConfirm: (date) {
                          setState(() {
                            provider.person.dob = date;
                          });
                        },
                            onChanged: (date) {},
                            currentTime: DateTime.now(),
                            locale: LocaleType.tr);
                      },
                      child: Text(
                        'Dogum Tarihin',
                        style: TextStyle(
                            color: Color(0xFF2258d6),
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 0.8),
                        ),
                        child: Text(
                          (provider.person.dob != null)
                              ? (provider.person.dobToString())
                              : '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: provider.person.works ?? false,
                      onChanged: (value) {
                        // setState(() {
                        provider.person.works = value;
                        // });
                      },
                    ),
                    Text(
                      'Sigortalı bir işte çalışıyor musunuz?',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                WideButton(
                  buttonText: 'Kontrol et',
                  backgroundColor: Color(0xFF38b01a),
                  textColor: Colors.white,
                  onPressedFunction: () {
                    DateTime date = provider.person.dob;
                    if (date != null) {
                      provider.canGoOut = CurfewServiceMock.getInstance
                          .canGoOut(provider.person);
                      provider.timeLeft = CurfewServiceMock.getInstance
                          .getTimeLeft(provider.person);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen()));
                    } else {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Doğum tarihinizi girin')));
                    }
                  },
                ),
                SizedBox(height: 32),
                BannerAdvertisementView(),
              ],
            ));
          }),
        ),
      )),
    );
  }
}
