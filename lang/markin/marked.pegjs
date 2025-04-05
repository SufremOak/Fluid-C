// MARKIN v0.1 PEG Grammar (PEG.js / PEGJD-Compatible)

start
  = _ mml:markupBlock _ { return mml; }

// Root <mml> block
markupBlock
  = "<mml" _ version:versionAttr ">" _ content:markupContent* "</mml>" {
      return {
        type: "MML",
        version,
        content
      };
  }

// Version attribute
versionAttr
  = _ "version" _ "=" _ "\"" v:[0-9.]+ "\"" { return v.join(""); }

// Any kind of content inside <mml>
markupContent
  = importStatement
  / constantBlock
  / booleanBlock
  / atomicBlock
  / element
  / defineBlock
  / ifBlock
  / directive
  / scriptBlock
  / dynamicBlock
  / markiTag
  / fullJSBlock
  / schemaBlock

// <import> statement
importStatement
  = "<import" _ "from" _ "=" _ "\"" path:[^\"]+ "\"" _ "/>" {
      return {
        type: "Import",
        path: path.join("")
      };
  }

// <constant name="..." value="..." />
constantBlock
  = "<constant" _ "name" _ "=" _ "\"" name:identifier "\"" _ "value" _ "=" _ val:literal "\"" _ "/>" {
      return {
        type: "Constant",
        name,
        value: val
      };
  }

// <boolean name="..." value="true|false" />
booleanBlock
  = "<boolean" _ "name" _ "=" _ "\"" name:identifier "\"" _ "value" _ "=" _ v:booleanLit "\"" _ "/>" {
      return {
        type: "Boolean",
        name,
        value: v
      };
  }

// <atomic name="..." type="..." value="..." />
atomicBlock
  = "<atomic" _ "name" _ "=" _ "\"" name:identifier "\"" _ "type" _ "=" _ "\"" dtype:identifier "\"" _ "value" _ "=" _ val:literal "\"" _ "/>" {
      return {
        type: "Atomic",
        name,
        dataType: dtype,
        value: val
      };
  }

// <element> block
element
  = "<element" _ "name" _ "=" _ "\"" name:identifier "\"" ">" _ inner:markupContent* "</element>" {
      return {
        type: "Element",
        name,
        body: inner
      };
  }

// <define> block for type-like definitions
defineBlock
  = "<define" _ "name" _ "=" _ "\"" name:identifier "\"" ">" _ props:property* "</define>" {
      return {
        type: "Define",
        name,
        properties: props
      };
  }

// <property> block inside <define>
property
  = "<property" _ "name" _ "=" _ "\"" name:identifier "\"" _ "type" _ "=" _ "\"" dtype:identifier "\"" "/>" {
      return {
        type: "Property",
        name,
        dataType: dtype
      };
  }

// <if condition="..."> ... </if>
ifBlock
  = "<if" _ "condition" _ "=" _ "\"" condition:scriptContent "\"" ">" _ content:markupContent* "</if>" {
      return {
        type: "If",
        condition: condition.trim(),
        body: content
      };
  }

// <?marki :key=value> directive
directive
  = "<?marki" _ ":" key:identifier "=" value:literal ">" {
      return {
        type: "Directive",
        key,
        value
      };
  }

// <?js ... ?> script block
scriptBlock
  = "<?js" _ code:scriptContent "?>" {
      return {
        type: "Script",
        code
      };
  }

scriptContent
  = $((!"?>" .)*)

// Full JavaScript block <scriptjs>...</scriptjs>
fullJSBlock
  = "<scriptjs>" code:fullJSContent "</scriptjs>" {
      return {
        type: "FullScript",
        code: code.trim()
      };
  }

fullJSContent
  = $((!"</scriptjs>" .)*)

// Dynamic logic block using interpolated JS inside markup
dynamicBlock
  = openScript:openTag code:scriptContent closeScript:closeTag {
      return {
        type: "Dynamic",
        code: code.trim()
      };
  }

// <marki! ... /> special block with YAML-like body
markiTag
  = "<marki!" _ body:markiBody "/>" {
      return {
        type: "MarkiBlock",
        content: body
      };
  }

markiBody
  = lines:markiLine+ { return lines; }

markiLine
  = _ line:((!"/>" .)+) _ { return line.join("").trim(); }

// <schema>...</schema> block for JSON schema definitions
schemaBlock
  = "<schema>" json:schemaContent "</schema>" {
      return {
        type: "Schema",
        content: json.trim()
      };
  }

schemaContent
  = $((!"</schema>" .)*)

openTag = "<?js" _
closeTag = "?>"

// Identifier: names, keys (now supports Unicode)
identifier
  = $([\p{L}_][\p{L}\p{N}_-]*)

// Literal values: boolean, number, or string
literal
  = boolean / number / string

boolean
  = v:("true" / "false") { return v === "true"; }

booleanLit
  = "true" { return true; }
  / "false" { return false; }

number
  = $([0-9]+) { return parseInt(text(), 10); }

string
  = "\"" chars:([^\"]*) "\"" { return chars.join(""); }

// Whitespace handler
_ = [ \t\r\n]*
