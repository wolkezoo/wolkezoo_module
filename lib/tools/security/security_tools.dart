import 'dart:convert';
import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:cryptography/cryptography.dart';
import 'package:encrypt/encrypt.dart';

/// security tools
/// contains encryption and decryption
class SecurityTools {
  /// aes encode
  /// back base64 data
  static String encodeAes({
    required String encryptionKey,
    required String encryptionData,
    AESMode mode = AESMode.cbc,
  }) {
    final key = Key.fromBase64(encryptionKey);
    final iv = IV.fromLength(16);
    final encrypted = Encrypter(AES(key, mode: mode));
    return encrypted.encrypt(encryptionData, iv: iv).base64;
  }

  static String encodeAesByte({
    required String encryptionKey,
    required List<int> encryptionDataByte,
    AESMode mode = AESMode.cbc,
  }) {
    final key = Key.fromBase64(encryptionKey);
    final iv = IV.fromLength(16);
    final encrypted = Encrypter(AES(key, mode: mode));
    return encrypted.encryptBytes(encryptionDataByte, iv: iv).base64;
  }

  static void encodeAesFile({
    required String encryptionKey,
    required String encryptedFilePath,
    required String encodeData,
    AESMode mode = AESMode.cbc,
  }) {
    final encryptedFile = File(encryptedFilePath);

    // 构建加密基本数据
    final key = Key.fromBase64(encryptionKey);
    final iv = IV.fromLength(16);
    final encrypted = Encrypter(AES(key, mode: mode));

    // 加密数据
    final encryptedBytes =
        encrypted.encryptBytes(encodeData.codeUnits, iv: iv).bytes;
    encryptedFile.writeAsBytesSync(encryptedBytes);
  }

  static String decryptAesFile({
    required String encryptionKey,
    required String encryptedFilePath,
    AESMode mode = AESMode.cbc,
  }) {
    final encryptedFile = File(encryptedFilePath);

    // 构建加密基本数据
    final key = Key.fromBase64(encryptionKey);
    final iv = IV.fromLength(16);
    final encrypted = Encrypter(AES(key, mode: mode));

    final encryptedBytes = encryptedFile.readAsBytesSync();
    final decryptedBytes = encrypted.decrypt(Encrypted(encryptedBytes), iv: iv);

    return decryptedBytes;
  }

  /// aes decode
  /// encryptionKey：aes encode key
  /// encryptionData：aes encode data
  static String decodeByAES({
    required String encryptionKey,
    required String decodeData,
    AESMode mode = AESMode.cbc,
  }) {
    final key = Key.fromBase64(encryptionKey);
    final iv = IV.fromLength(16);
    final encrypted = Encrypter(AES(key, mode: mode));
    return encrypted.decrypt64(decodeData, iv: iv);
  }

  /// RSA encode
  /// back base64 encode data
  static String rsaEncode(String publicKey, String data) {
    publicKey = """
-----BEGIN PUBLIC KEY-----
$publicKey
-----END PUBLIC KEY-----
""";
    var publicKeyEncode = RSAKeyParser().parse(publicKey) as RSAPublicKey;
    final encryption = Encrypter(RSA(publicKey: publicKeyEncode));
    return encryption.encrypt(data).base64;
  }

  /// RSA decode
  static String rsaDecode(String privateKey, String data) {
    privateKey = """
${CryptoUtils.BEGIN_PRIVATE_KEY}
$privateKey
${CryptoUtils.END_PRIVATE_KEY}
""";
    var privateKeyEncode = RSAKeyParser().parse(privateKey) as RSAPrivateKey;
    final encryption = Encrypter(RSA(privateKey: privateKeyEncode));
    return encryption.decrypt(Encrypted.fromBase64(data));
  }

  /// Generate AES key
  static Future<String> generateAES() async {
    final algorithm = AesGcm.with256bits();
    final secretKey = await algorithm.newSecretKey();
    final secretKeyBytes = await secretKey.extractBytes();
    return base64Encode(secretKeyBytes);
  }

  /// Generate RSA key pair
  static Future<Map<String, String>> generateRSA() async {
    AsymmetricKeyPair pari = CryptoUtils.generateRSAKeyPair(keySize: 2048);
    return {
      "publicKey": removeBaseTop(
          CryptoUtils.encodeRSAPublicKeyToPem(pari.publicKey as RSAPublicKey)),
      "privateKey": removeBaseTop(CryptoUtils.encodeRSAPrivateKeyToPem(
          pari.privateKey as RSAPrivateKey)),
    };
  }

  static String removeBaseTop(String rsaKey) {
    List<String> rsaKeySplit = rsaKey.split(RegExp(r'\r\n?|\n'));
    rsaKeySplit.removeLast();
    rsaKeySplit.removeAt(0);
    return rsaKeySplit.join();
  }
}
