import { parser } from './grammar';
import { fs } from 'fs';

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
