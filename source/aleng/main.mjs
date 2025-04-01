import { parser } from "./aleng";
import { fs } from "fs";

const args = process.argv.slice(2);
if (args.length < 1) {
  console.error("Usage: node run_aleng.js <path-to-aleng-file>");
  process.exit(1); // Exit with an error code
}

const filePath = args[0];

// Read the file content asynchronously
fs.readFile(filePath, 'utf8', (err, data) => {
  if (err) {
    console.error(`Error reading file: ${err.message}`);
    process.exit(1); // Exit with an error code if the file can't be read
  }

  try {
    // Parse the Aleng code from the file content
    const result = parser.parse(data);
    console.log("Parsed result:", result);
  } catch (e) {
    console.error("Parse error:", e.message);
    process.exit(1); // Exit with an error code if parsing fails
  }
});

// Check if the file exists
if (!fs.existsSync(filePath)) {
    console.error(`File not found: ${filePath}`);
    process.exit(1);
  }
  