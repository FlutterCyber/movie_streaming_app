class DownloadTaskStatus {
  final int _value;

  const DownloadTaskStatus(int value) : _value = value;

  int get value => _value;

  static DownloadTaskStatus from(int value) => DownloadTaskStatus(value);

  static const undefined = DownloadTaskStatus(0);
  static const enqueued = DownloadTaskStatus(1);
  static const running = DownloadTaskStatus(2);
  static const complete = DownloadTaskStatus(3);
  static const failed = DownloadTaskStatus(4);
  static const canceled = DownloadTaskStatus(5);
  static const paused = DownloadTaskStatus(6);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return (other is DownloadTaskStatus && other._value == _value);
  }

  @override
  // TODO: implement hashCode
  int get hashCode => _value.hashCode;

  @override
  String toString() => "DownloadTaskStatus($_value)";
}
