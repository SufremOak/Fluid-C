import { parser } from "./grammar";
import { fs } from "fs";

const args = process.argv.slice(2);
if (args.length < 1) {
  console.error("Usage: node markin.mjs <path-to-aleng-file>");
  process.exit(1);
}

const filePath = args[0];

fs.readFile(filePath, 'utf8', (err, data) => {
  if (err) {
    console.error(`Error reading file: ${err.message}`);
    process.exit(1);
  }

  try {
    const result = parser.parse(data);
    console.log("Parsed result:", result);
  } catch (e) {
    console.error("Parse error:", e.message);
    process.exit(1);
  }
});

if (!fs.existsSync(filePath)) {
    console.error(`File not found: ${filePath}`);
    process.exit(1);
}
  