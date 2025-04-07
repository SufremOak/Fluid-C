// markin-interpreter.mjs
// Node.js-only interpreter for Markin grammar
// Usage: `node markin-interpreter.mjs path/to/file.mml arg1 arg2 ...`

import fs from 'fs';
import path from 'path';
import process from 'process';
import peg from 'pegjs';

// --- Load grammar from external file ---
const grammarPath = path.resolve('./grammar.pegjs');
const grammar = fs.readFileSync(grammarPath, 'utf8');

// --- Parser Generation ---
const parser = peg.generate(grammar);

// --- Interpreter ---
function interpret(node, context = {}) {
  if (!node) return;
  if (Array.isArray(node)) return node.map(n => interpret(n, context));

  switch (node.type) {
    case 'document':
      return interpret(node.elements, context);
    case 'element':
      context[node.name] = node.attributes || {};
      return interpret(node.content, context);
    case 'selfClosingElement':
      context[node.name] = node.attributes || {};
      return;
    case 'binding':
      context[node.name] = node.value;
      return;
    case 'js':
      try {
        const fn = new Function('context', `with(context){ ${node.content} }`);
        fn(context);
      } catch (e) {
        console.error('JavaScript error in {js} block:', e);
      }
      return;
    case 'text':
      return node.value;
    default:
      console.warn('Unknown node type:', node);
  }
}

// --- CLI Execution ---
const args = process.argv.slice(2);
if (args.length < 1) {
  console.error('Usage: node markin-interpreter.mjs <file.mml> [args...]');
  process.exit(1);
}

const filePath = path.resolve(args[0]);
const fileContent = fs.readFileSync(filePath, 'utf8');

try {
  const ast = parser.parse(fileContent);
  const result = interpret(ast, { argv: args.slice(1) });
  if (result !== undefined) console.log(result);
} catch (err) {
  console.error('Parse error:', err.message);
  process.exit(1);
}
