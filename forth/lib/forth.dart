typedef Operator = int Function(int x, int y);
int Plus(int x, int y) {
  return x + y;
}

int Minus(int x, int y) {
  return x - y;
}

int Multiply(int x, int y) {
  return x * y;
}

int Division(int x, int y) {
  return x ~/ y;
}

typedef Manipulator = List<int> Function(List<int> stack);
List<int> Duplicate(List<int> stack) {
  List<int> result = [];
  result.addAll(stack);
  result.add(stack.last);
  return result;
}

List<int> Drop(List<int> stack) {
  List<int> result = [];
  result.addAll(stack);
  result.removeLast();
  return result;
}

List<int> Swap(List<int> stack) {
  List<int> result = [];
  result.addAll(stack.take(stack.length - 2));
  result.add(stack.last);
  result.add(stack.elementAt(stack.length - 2));
  return result;
}

List<int> Over(List<int> stack) {
  List<int> result = [];
  result.addAll(stack);
  result.add(stack.elementAt(stack.length - 2));
  return result;
}

class Forth {
  List<int> stack = [];
  List<String> intArithmetic = ['+', '-', '*', '/'];
  List<String> stackManip = ['DUP', 'DROP', 'SWAP', 'OVER'];
  Map<String, String> userDef = {};

  void evaluate(String str) {
    if (str == "") {
      return;
    }
    if (str.startsWith(':') && str.endsWith(';')) {
      defineUserWord(str);
    } else {
      List<String> words = str.split(' ');
      for (var word in words) {
        evaluateByWord(word);
      }
    }
  }

  void evaluateByWord(String word) {
    if (isNumeric(word)) {
      stack.add(int.parse(word));
    } else if (isUserDef(word)) {
      evaluate(userDef[word] ??
          userDef[word.toLowerCase()] ??
          userDef[word.toUpperCase()] ??
          "");
    } else if (isOperator(word)) {
      stack = operate(stack, word);
    } else if (isStackManipulator(word)) {
      stack = manipulate(stack, word.toUpperCase());
    } else {
      throw Exception('Unknown command');
    }
  }

  bool isUserDef(String word) {
    return userDef.keys
            .toList()
            .map((key) => key.toUpperCase())
            .contains(word.toUpperCase())
        ? true
        : false;
  }

  void defineUserWord(String str) {
    List<String> words =
        str.replaceAll(": ", "").replaceAll(" ;", "").split(" ");

    if (isNumeric(words[0])) {
      throw Exception('Invalid definition');
    }
    List<String> copy = [...words];
    copy.removeAt(0);

    userDef[words[0]] =
        copy.map((e) => userDef[e] != null ? userDef[e] : e).join(" ");
  }

  bool isStackManipulator(String word) {
    return stackManip.contains(word.toUpperCase()) ? true : false;
  }

  List<int> manipulate(List<int> stack, String manipulator) {
    if (stack.isEmpty) {
      throw Exception('Stack empty');
    }

    Manipulator manip;
    switch (manipulator) {
      case 'DUP':
        manip = Duplicate;
        break;
      case 'DROP':
        manip = Drop;
        break;
      case 'SWAP':
        if (stack.length < 2) {
          throw Exception('Stack empty');
        }
        manip = Swap;
        break;
      case 'OVER':
        if (stack.length < 2) {
          throw Exception('Stack empty');
        }
        manip = Over;
        break;
      default:
        throw Exception('No match manipulator');
    }

    return manip(stack);
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  bool isOperator(String char) {
    return intArithmetic.contains(char) ? true : false;
  }

  List<int> operate(List<int> currentStack, String operator) {
    if (stack.length != 2) {
      throw Exception('Stack empty');
    }

    Operator oper;
    switch (operator) {
      case "+":
        oper = Plus;
        break;
      case "-":
        oper = Minus;
        break;
      case "*":
        oper = Multiply;
        break;
      case "/":
        if (currentStack[1] == 0) {
          throw Exception('Division by zero');
        }
        oper = Division;
        break;
      default:
        throw Exception('No match operator');
    }

    return [oper(currentStack[0], currentStack[1])];
  }
}
