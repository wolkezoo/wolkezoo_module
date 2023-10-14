import 'package:nanoid/nanoid.dart';
import 'package:uuid/uuid.dart';

/// 主键工具类
class IdTools {
  factory IdTools() => _getInstance();
  static IdTools? _instance;

  static IdTools _getInstance() {
    _instance ??= IdTools._init();
    return _instance!;
  }

  // uuid定义
  static const _uuid = Uuid();

  IdTools._init();

  // 生成快速uuid
  static String fastUuid(){
    return _uuid.v4();
  }

  // 生成快速uuid，并清空中间横杆
  static String fastUuidStr(){
    return fastUuid().replaceAll("-", "");
  }

  // 生成nanoId
  static String nanoId([int size = 21]){
    return nanoid(size);
  }

  // 自定义字母或长度
  static String customNanoId({required String alphabet, required int size}){
    return customAlphabet(alphabet, size);
  }
}
