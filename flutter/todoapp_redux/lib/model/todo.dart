enum TodoStatus { to, doing, done }

class TodoContent {
  final String title;
  final String content;
  late TodoStatus state;

  TodoContent({required this.title, required this.content, TodoStatus? state}) {
    this.state = state ?? TodoStatus.to;
  }

  void setTo() {
    state = TodoStatus.to;
  }

  void setDoint() {
    state = TodoStatus.doing;
  }

  void setDone() {
    state = TodoStatus.done;
  }

  void setNextState() {
    switch (state) {
      case TodoStatus.to:
        setDoint();
        break;
      case TodoStatus.doing:
        setDone();
        break;
      case TodoStatus.done:
        break;
    }
  }

  bool isTo() {
    return state == TodoStatus.to;
  }

  bool isDoing() {
    return state == TodoStatus.doing;
  }

  bool isDone() {
    return state == TodoStatus.done;
  }

  String getStateString() {
    if (isTo()) return "To";
    if (isDoing()) return "Doing";
    return "Done";
  }

  @override
  String toString() {
    return "$title, $content, $state";
  }
}
