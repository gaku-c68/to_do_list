enum TodoCategory {
  study('勉強'),
  sport('運動'),
  sleep('睡眠'),
  other('その他');

  const TodoCategory(this.label);
  final String label;
}
