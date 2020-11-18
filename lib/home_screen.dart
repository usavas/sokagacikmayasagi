import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:sokagacikmayasagi/buttons.dart';
import 'package:sokagacikmayasagi/consts.dart';
import 'package:sokagacikmayasagi/result_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _dob;
  bool _works;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          actions: [],
          centerTitle: true,
          title: Text('Sokağa Çıkma Yasağı'),
          // backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
            child: Container(
          decoration: kPageBgDecoration,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                          _dob = date;
                        });
                      },
                          onChanged: (date) {},
                          currentTime: DateTime.now(),
                          locale: LocaleType.tr);
                    },
                    child: Text(
                      'Tarih Seç',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 0.4),
                    ),
                    child: Text(
                      (_dob != null)
                          ? _dob.toLocal().toString()
                          : 'Tarih secilmedi',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _works ?? false,
                    onChanged: (value) {
                      setState(() {
                        _works = value;
                      });
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
                backgroundColor: kWidgetBgColor,
                onPressedFunction: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultScreen()));
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
