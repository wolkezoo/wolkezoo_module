import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:ntp/ntp.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wolkezoo_module/tools/date/date_tools.dart';
import 'package:wolkezoo_module/tools/id/id_tools.dart';
import 'package:wolkezoo_module/tools/security/security_tools.dart';
import 'package:wolkezoo_module/wolkezoo_module.dart';

void main() {
  test('adds one to input values', () async {
    // print("Permission.storage >> ${Permission.storage.toString() == "Permission.storage"}");
    // DateTime startDate = await NTP.now(
    //   lookUpAddress: "ntp.ntsc.ac.cn"
    // );
    // print('NTP DateTime: ${DateTools.format(date: startDate, format: "yyMMdd")}');
    //Map<String, String> a = await SecurityTools.generateRSA();

    // String key = await SecurityTools.generateAES();
    // print('key >> $key');
    // String key = "5dG1ZhyRzpau++1CtUhX2BjSZ14EqI3Za/J5RGhAuR8=";
    // String aa = "123456";
    //
    // String encodeA = "RyjvcwLCfxJs1e2diD1afg==";
    //
    // final a = await SecurityTools.encodeAes(encryptionKey: key, encryptionData: aa);
    // final a1 = await SecurityTools.decodeByAES(encryptionKey: key, decodeData: encodeA);
    // print('key >> $a');
    // print('key >> $a1');
    // final calculator = Calculator();
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
  });
}
