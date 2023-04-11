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
        throw Exception('');
      }
    }
    return stack;
  }

  bool isStackManipulator(String word) {
    return stackManip.contains(word.toUpperCase()) ? true : false;
  }

  List<int> manipulate(List<int> stack, String manipulator) {
    if(stack.isEmpty){
      throw Exception('Stack empty');
    }

    List<int> result = [];

    if(manipulator == 'DUP'){
      result.addAll(stack);
      result.add(stack.last);
    }else if(manipulator == 'DROP'){
      result.addAll(stack);
      result.removeLast();
    }else if(manipulator == 'SWAP'){

    }else if(manipulator == 'OVER'){

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
