import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:sokagacikmayasagi/UI/advertisement_view.dart';
import 'package:sokagacikmayasagi/UI/previous_queries.dart';
import 'package:sokagacikmayasagi/UI/terms_conditions_screen.dart';
import 'package:sokagacikmayasagi/consts.dart';
import 'package:sokagacikmayasagi/models/person.dart';
import 'package:sokagacikmayasagi/services/curfew_provider.dart';
import 'package:sokagacikmayasagi/services/curfew_service.dart';
import 'package:sokagacikmayasagi/shared_widgets/simple_alert_dialog.dart';
import 'package:sokagacikmayasagi/shared_widgets/buttons.dart';
import 'package:sokagacikmayasagi/UI/result_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 12),
              color: Theme.of(context).primaryColor,
              height: 80,
              alignment: Alignment.centerLeft,
              width: double.infinity,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TermsAndConditionsScreen(isAcceptButton: false)));
              },
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text('Hüküm ve Koşulları Oku'),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.of(context).pop();
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => PreviousQueries()));
            //   },
            //   child: ListTile(
            //     leading: Icon(Icons.archive),
            //     title: Text('Önceki sorgulamalarım'),
            //   ),
            // ),
            Divider(
              height: 6,
              thickness: 1,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [],
        centerTitle: true,
        title: Text('Pandemi Bilgilendirme'),
      ),
      body: SafeArea(
          child: Center(
        child: Container(
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
                InkWell(
                  child: ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text(
                      'Doğum Tarihin',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    trailing: Text(
                      (provider.person.dob != null)
                          ? (provider.person.dobToString())
                          : 'Seçilmedi',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(
                              color: Colors.green[800],
                              fontWeight: FontWeight.bold)
                          .apply(fontSizeDelta: 1.2),
                    ),
                  ),
                  onTap: () {
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
                ),
                InkWell(
                    child: ListTile(
                  leading: Icon(provider.person.works ?? false
                      ? Icons.check_box
                      : Icons.check_box_outline_blank),
                  title: Text(
                    'Sigortalı bir işte çalışıyor musun?',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Text(
                    provider.person.works ?? false ? 'Evet' : 'Hayır',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.green[800], fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    if (!provider.person.works) {
                      if (provider.person?.dob == null) {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleAlertDialog(
                            content: 'Önce doğum tarihi bilgilerini gir',
                            cancelButtonText: 'Tamam',
                          ),
                        );
                        return;
                      } else if (provider.person.getAge() < 14) {
                        showDialog(
                            context: context,
                            builder: (context) => SimpleAlertDialog(
                                  content:
                                      'Sigortalı bir işte çalışabiliyor olmak için en az 14 yaşında olmalısın',
                                  cancelButtonText: 'Pekala',
                                ));
                        return;
                      }
                    }
                    setState(() {
                      provider.person.works = !provider.person.works;
                    });
                  },
                )),
                SizedBox(
                  height: 20,
                ),
                WideButton(
                  buttonText: 'Kontrol et',
                  backgroundColor: Color(0xFF38b01a),
                  textColor: Colors.white,
                  onPressedFunction: () {
                    DateTime date = provider.person.dob;
                    if (date != null) {
                      provider.canGoOut =
                          CurfewService.getInstance.canGoOut(provider.person);
                      provider.timeLeft = CurfewService.getInstance
                          .getTimeLeft(provider.person);
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultScreen()))
                          .then((value) {
                        setState(() {
                          provider.canGoOut = null;
                          provider.person = Person();
                          CurfewService.setInstanceNull();
                        });
                      });
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
