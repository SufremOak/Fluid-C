{
  function extractJs(text) {
    return text.join("");
  }
}

Start
  = _ doc:Document _ { return doc; }

Document
  = elements:DocumentElement* { return { type: "document", elements }; }

DocumentElement
  = Element / JsBlock / Binding / Text

Element
  = "<" name:TagName attributes:Attributes? ">" content:DocumentElement* "</" _ TagName _ ">" {
      return { type: "element", name, attributes, content };
    }
  / "<" name:TagName attributes:Attributes? "/>" {
      return { type: "selfClosingElement", name, attributes };
    }

TagName
  = $([a-zA-Z_][a-zA-Z0-9_.]*)

Attributes
  = _ attrs:(Attribute _)* {
      return Object.fromEntries(attrs.map(a => [a.name, a.value]));
    }

Attribute
  = name:TagName _ "=" _ value:(QuotedString / Number / Identifier) {
      return { name, value };
    }

QuotedString
  = '"' chars:Char* '"' { return chars.join(""); }

Char
  = !['"] . { return text(); }

Number
  = digits:[0-9]+ { return parseInt(digits.join(""), 10); }

Identifier
  = $([a-zA-Z_][a-zA-Z0-9_.]*)

JsBlock
  = "{js" content:JsContent "}" {
      return { type: "js", content: extractJs(content) };
    }

JsContent
  = ( !"}" . )+

Binding
  = "{" _ ":" name:Identifier _ value:(Identifier / FunctionCall) _ "}" {
      return { type: "binding", name, value };
    }

FunctionCall
  = name:Identifier "(" args:ArgumentList? ")" {
      return { type: "functionCall", name, args: args || [] };
    }

ArgumentList
  = head:(Identifier / FunctionCall) tail:(_ "*" _ (Identifier / FunctionCall))* {
      return [head].concat(tail.map(t => t[3]));
    }

Text
  = chars:TextChar+ { return { type: "text", value: chars.join("").trim() }; }

TextChar
  = !("<" / "{" / "}") .

_
  = [ \t\r\n]*
