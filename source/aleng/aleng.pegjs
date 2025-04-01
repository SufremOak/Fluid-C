{
  // JavaScript code to provide helper functions or variables
  function randomExpr() {
    return Math.random() > 0.5 ? "True" : "False"; // Simulate random behavior
  }
}

Program
  = Statement+

Statement
  = LetStatement
  / IfStatement
  / RandomStatement
  / ExpressionStatement

LetStatement
  = "let" _ Identifier _ "=" _ Expression {
      return { type: "let", name: text(), value: Expression };
    }

IfStatement
  = "if" _ "(" _ Expression _ ")" _ Block "else" _ Block {
      return { type: "if", condition: Expression, trueBlock: Block, falseBlock: Block };
    }

RandomStatement
  = "random" _ "(" _ Expression _ ")" {
      return { type: "random", value: Expression, result: randomExpr() };
    }

ExpressionStatement
  = Expression {
      return { type: "expression", value: Expression };
    }

Expression
  = Term (Operator Term)*

Term
  = Number
  / Identifier
  / "(" _ Expression _ ")"

Operator
  = "+" / "-" / "*" / "/" / "%" / "==" / "<" / ">"

Number
  = [0-9]+ {
      return parseInt(text(), 10);
    }

Identifier
  = [a-zA-Z_][a-zA-Z0-9_]* {
      return text();
    }

Block
  = "{" _ Statement+ "}"

_ "whitespace"
  = [ \t\n\r]*
