use heraclitus::prelude::*;
use std::fmt::{Formatter, Display, Result, Debug};

let cc = Compiler::new("FlameScript", rules);
let tokens = cc.tokenize()?;