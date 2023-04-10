class Forth {
  List<int> stack = [];
  List<String> intArithmetic = ['+', '-', '*', '/'];
  List<String> stackManip = ['DUP', 'DROP', 'SWAP', 'OVER'];

  List<int> evaluate(String str) {
    List<String> charList = str.split(' ');
    for (var char in charList) {
      if (isNumeric(char)) {
        stack.add(int.parse(char));
      } else if (isOperator(char)) {
        stack = operate(stack, char);
      }
    }
    return stack;
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

    List<int> result = [];
    if (operator == '+') {
      result.add(stack[0] + stack[1]);
    } else if (operator == '-') {
      result.add(stack[0] - stack[1]);
    } else if (operator == '*') {
      result.add(stack[0] * stack[1]);
    } else if (operator == '/') {
      if (stack[1] == 0) {
        throw Exception('Division by zero');
      }
      result.add(stack[0] ~/ stack[1]);
    }

    return result;
  }
}
