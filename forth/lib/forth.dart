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

class Forth {
  List<int> stack = [];
  List<String> intArithmetic = ['+', '-', '*', '/'];
  List<String> stackManip = ['DUP', 'DROP', 'SWAP', 'OVER'];

  List<int> evaluate(String str) {
    List<String> words = str.split(' ');
    for (var word in words) {
      if (isNumeric(word)) {
        stack.add(int.parse(word));
      } else if (isOperator(word)) {
        stack = operate(stack, word);
      } else if (isStackManipulator(word)) {
        stack = manipulate(stack, word.toUpperCase());
      } else {
        throw Exception('Unknown command');
      }
    }
    return stack;
  }

  bool isStackManipulator(String word) {
    return stackManip.contains(word.toUpperCase()) ? true : false;
  }

  List<int> manipulate(List<int> stack, String manipulator) {
    if (stack.isEmpty) {
      throw Exception('Stack empty');
    }

    List<int> result = [];
    if (manipulator == 'DUP') {
      result.addAll(stack);
      result.add(stack.last);
    } else if (manipulator == 'DROP') {
      result.addAll(stack);
      result.removeLast();
    } else if (manipulator == 'SWAP') {
      if (stack.length < 2) {
        throw Exception('Stack empty');
      }

      result.addAll(stack.take(stack.length - 2));
      result.add(stack.last);
      result.add(stack.elementAt(stack.length - 2));
    } else if (manipulator == 'OVER') {
      if (stack.length < 2) {
        throw Exception('Stack empty');
      }

      result.addAll(stack);
      result.add(stack.elementAt(stack.length - 2));
    }

    return result;
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
