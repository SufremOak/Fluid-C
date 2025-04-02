#!/usr/local/env sh

REPL_PATH = "../src/repl.coffee"
JS_OUT = "../.cache/"


if which coffee > /dev/null 2>&1; then
    continue
else
    echo "CoffeScript Compiler is not installed."
    exit 1
fi

if which node > /dev/null 2>&1; then
    continue
else
    echo "Nodejs not found"
    exit 1
fi

if which gcc > /dev/null 2>&1; then
    continue
else
    echo "GCC is not found"
    exit 1
fi

start_repl() {
    coffee $REPL_PATH $JS_OUT/repl.js
    node $JS_OUT/repl.js
    exit 0
    input = read -p ">>> "
    if input == "void"; then
        read -p "enter function name: "
        if ["main"|"Main"]; then
            echo "[i] main function detected"
            continue
        fi
    elif input == "if"; then
        read -p "Enter condition: "
        # implement
    elif input == "return"; then
        read -p "enter value: "
        if [0]; then
            exit 0
        else
            exit 1
        fi
    fi
}

jit() {
    # ...
}

case "$1" in
    --compile)
        ;;
    --jit)
        ;;
    --help)
        ;;
    --repl)
        ;;
    -V|--version)
        echo "FluidScripten MiniCompiler v0.0.1-alpha.1"
        exit 1
        ;;