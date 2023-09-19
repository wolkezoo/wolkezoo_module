class NumberTools {
  ///
  /// 数值取消小数点
  /// 返回int类型，传入int的数值取消小数点位
  static int removeIntPoint(int number0){
    return number0.truncate();
  }

  ///
  /// 数值取消小数点
  /// 返回int类型，传入double的数值取消小数点位
  static int removeDoublePoint(double number0){
    return number0.truncate();
  }
}