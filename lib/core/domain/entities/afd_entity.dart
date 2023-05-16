class AFDEntity {
  AFDEntity({
    required this.isFinal,
    required this.state,
    this.when0,
    this.when1,
  });

  bool isFinal;
  AFDEntity? when0;
  AFDEntity? when1;
  int state;
}
