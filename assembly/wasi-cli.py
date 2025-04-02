from wasmer import engine, Store, Module, Instance
from pathlib import path

store = Store()

module = Module(store, path("./main.wat"))
# Now the module is compiled, we can instantiate it.
instance = Instance(module)
