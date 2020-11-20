import 'package:admob_flutter/admob_flutter.dart';
import 'package:sokagacikmayasagi/services/admob_helper.dart';
import 'package:flutter/material.dart';

class BannerAdvertisementView extends StatelessWidget {
  const BannerAdvertisementView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getAdWidget(context, true);
  }

  Widget _getAdWidget(BuildContext context, bool isDebug) {
    if (isDebug) {
      return Center(
        child: Text('ad here'),
      );
    }
    Admob.initialize(AdmobHelper.admobAppId);
    return Container(
        child: AdmobBanner(
      adUnitId: AdmobHelper.admobBannerAdId,
      adSize: AdmobBannerSize.FULL_BANNER,
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        handleEvent(event, args, 'Banner');
      },
    ));
  }

  void handleEvent(AdmobAdEvent event, args, String s) {
    switch (event) {
      case AdmobAdEvent.loaded:
        print('Admob banner loaded!');
        break;
      case AdmobAdEvent.opened:
        print('Admob banner opened!');
        break;
      case AdmobAdEvent.failedToLoad:
        print('Admob banner failed to load. Error code: ${args['errorCode']}');
        break;
      case AdmobAdEvent.clicked:
        print('clicked');
        break;
      case AdmobAdEvent.impression:
        print('impression');
        break;
      default:
        print('default event run');
        break;
    }
  }
}
