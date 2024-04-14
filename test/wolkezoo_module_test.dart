import 'dart:io';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:wolkezoo_module/extension/map_extension.dart';
import 'package:wolkezoo_module/tools/file/file_tools.dart';
import 'package:wolkezoo_module/wolkezoo_module.dart';

class Test {
  int? sub;

  Test();
}

void main() {
  int get(String name) {
    print(name + "执行了该方法");
    return 1;
  }

  test('adds one to input values', () async {
    print(InternetAddress.loopbackIPv4.address);
    // List<String> a =  ["a", "", "c"];
    // print('a >> ${StrUtil.lnPermutation(a, defaultValue: "NULL")}');

    // Map<String, String> aa = {"a": "1", "b": "2", "c": "3"};
    //
    // aa.insert<String, String>(3, "d", "4");
    //
    // print('aa >> ${aa}');

    // print('FileTools >> ${FileTools.convertFilesize(1083741829, sizeKindEnum: FileSizeKindEnum.gb)}');

    // List? aa = null;
    // print(Optional.ofNullable(aa).orElse(["ERROR"]));
    // Optional optional = Optional.ofNullable(null);
    // print('optional >> ${optional.isPresent()}');
    // optional.ifPresent((value) {
    //   print("object >> $value");
    // });

    // List<Map<String, dynamic>> param = [
    //   {"name": "aaa", "age": 30},
    //   {"name": "bbb", "age": 48},
    // ];
    //
    // print('${ Optional.ofNullable(param[1]).filter((element) => element["age"] > 30).map((element) => element["name"]).get()}');

    // Optional op = Optional.ofNullable(null);
    // Optional<int> op1 = Optional.of(1234);

    // print('== >> ${op == op1}');

    // print(op[23456]);
    // print('Optional.ofNullable(12345).orElse(get("orElse")) >> ${Optional.ofNullable(null).orElseThrow(() => NullException())}');

    // optional.filter((element) => false);
    // print(toBool("2", defaultValue: false));
    // DioTools().get(url: "url");
    //print(SecurityTools.decodeByAES(encryptionKey: "+hczLwkyDf0pwccrycU0Kn/4d7oiRWtGfMWwNbde5tE=", decodeData: "4WFScscSEOROzM435ntxfEDkN7KXUCixvA0bpWLlogdh82700tiInVjnF5aKSkdPgRsaHmHh+d9bSJbC4FAoNA=="));
    // print(json.decode("{\"code\": 500, \"msg\": \"token已被顶下线\", \"data\": null}"));
    // print(FileTools.getFileXXHash(file: File("/data/user/0/com.wolkezoo.app/cache/file_picker/dbebf805ceb9d7a11ad39d794fcf16ff_682679781549_v_1660986981552659.mp4")));
    // print('${"a.abc".split('.').length}');
    // print("${".".split(".").last}");
    // String aa = "123456";
    // String aa1 = SecurityTools.encodeAes(encryptionKey: "OH6FEa8khri4GVhdVq/PZPDAzTQnbYbG/X/i0FQY9fg=", encryptionData: aa);
    // print('aa1 >> $aa1');
    //
    // String aa2 = SecurityTools.decodeByAES(encryptionKey: "OH6FEa8khri4GVhdVq/PZPDAzTQnbYbG/X/i0FQY9fg=", decodeData: aa1);
    // print("aa2 >> $aa2");

    // String aa = "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";
    // print(SecurityTools.decodeByAES(encryptionKey: "OH6FEa8khri4GVhdVq/PZPDAzTQnbYbG/X/i0FQY9fg=", decodeData: aa));
    // ;
    // print('Date >> ${DateTools.timeAgo(DateTime.now())}');

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
