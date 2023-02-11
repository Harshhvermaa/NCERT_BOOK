import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

late BannerAd? bannerAd;
late BannerAd? bannerAd2;
late BannerAd? bannerAd3;
late BannerAd? bannerAd4;

var bannerunitId4 = "ca-app-pub-5080388854099847/6795734798";
var bannerunitId3 = "ca-app-pub-5080388854099847/5365450665";
var bannerunitId2 = "ca-app-pub-5080388854099847/6905763042";
var bannerunitId = "ca-app-pub-5080388854099847/7860021560";
var interstitialunitId = "ca-app-pub-5080388854099847/8010453003";
var interstitialunitId2 = "ca-app-pub-5080388854099847/1270603072";

InterstitialAd? _interstitialAd, _interstitialAd2;

class adController {
  createBannerAd4() {
    bannerAd4 = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: bannerunitId4,
      listener: bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  createBannerAd3() {
    bannerAd3 = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: bannerunitId3,
      listener: bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  createBannerAd2() {
    bannerAd2 = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: bannerunitId2,
      listener: bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  createBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: bannerunitId,
      listener: bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  static final BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint("AD LOADED"),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      print(error);
      debugPrint("AD Not LOADED");
    },
    onAdOpened: (ad) => debugPrint("AD LOADED"),
    onAdClosed: (ad) => debugPrint("AD Closed"),
  );

  showInterstitialAD2() {
    if (_interstitialAd2 != null) {
      // print(null);
      _interstitialAd2!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          createInterstitial2();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          createInterstitial2();
        },
      );
      _interstitialAd2!.show();
      _interstitialAd2 = null;
    } else {
      print("Null hai");
    }
  }

  createInterstitial2() {
    InterstitialAd.load(
      adUnitId: interstitialunitId2,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd2 = ad,
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialAd2 = null;
          print("$error dsfsdfsdfsdfsdfsdfsdfsdfsdf");
        },
      ),
    );
  }

  showInterstitialAD() {
    if (_interstitialAd != null) {
      print(null);
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          createInterstitial();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          createInterstitial();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    } else {
      print("Null hai");
    }
  }

  createInterstitial() {
    InterstitialAd.load(
      adUnitId: interstitialunitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialAd = null;
          print("$error dsfsdfsdfsdfsdfsdfsdfsdfsdf");
        },
      ),
    );
  }
}
