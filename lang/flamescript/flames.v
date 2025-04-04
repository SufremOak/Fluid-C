module main

import json
import toml
import toml.to
import os { input, user_os }
import cli

struct Command {
pub mut:
	name            string
	usage           string
	description     string
	man_description string
	version         string
	pre_execute     FnCommandCallback = unsafe { nil }
	execute         FnCommandCallback = unsafe { nil }
	post_execute    FnCommandCallback = unsafe { nil }
	disable_help    bool @[deprecated: 'use defaults.help instead'; deprecated_after: '2024-06-31']
	disable_man     bool @[deprecated: 'use defaults.man instead'; deprecated_after: '2024-06-31']
	disable_version bool @[deprecated: 'use defaults.version instead'; deprecated_after: '2024-06-31']
	disable_flags   bool
	sort_flags      bool
	sort_commands   bool
	parent          &Command = unsafe { nil }
	commands        []Command
	flags           []Flag
	required_args   int
	args            []string
	posix_mode      bool
	defaults        struct {
	pub:
		help    Defaults = true
		man     Defaults = true
		version Defaults = true
	mut:
		parsed struct {
		mut:
			help    CommandFlag
			version CommandFlag
			man     CommandFlag
		}
	}
}

struct CommandFlag {
pub mut:
	command bool = true
	flag    bool = true
}

struct Flag {
pub mut:
	flag FlagType
	// Name of flag
	name string
	// Like short option
	abbrev string
	// Description of flag
	description string
	// If the flag is added to this command and to all subcommands
	global bool
	// If flag is required
	required bool
	// Default value if no value provide by command line
	default_value []string = []
mut:
	// Set true if flag found.
	found bool
	// Value of flag
	value []string = []
}

struct C.cJSON {
	valueint    int
	valuedouble f64
	valuestring &char
}

enum FlameType {
	package
	modules
}

struct FlameFile {
	mut:
		name 	string
		version string
		main	string
		deps	string	@[omitempty]
		type 	package @[json: 'Pkg']
}

fn (flag &Flag) get_string() !string
fn decode[T](toml_txt string) !T

fn main() {
	mut app := cli.Command{
		name:			'Flames'
		description:	'The FlameScript runtime'
		execute:		fn (cmd cli.Command) ! {
			println('this is Flames on ')
			os := user_os
			match os {
				'windows' { println('Windows') }
				'darwin' { println('macOS') }
				'linux' { println('Linux') }
				else { println(os) }
			}
			return
		}
		commands:	[
			cli.Command{
				name: 		'run'
				execute: fn (cmd cli.Command) ! {
					// i dunno
					return
				}
			},
		]
	}
	app.setup()
	app.parse(os.args)
}