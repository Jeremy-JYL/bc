/*
This file is part of bc (Brainfuck Compiler).

bc (Brainfuck Compiler) is free software: you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of the License, or (at your
option) any later version.

bc (Brainfuck Compiler) is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with bc (Brainfuck Compiler). If not, see
<https://www.gnu.org/licenses/>.
*/

/*
	User interface & Configs
*/

module main

// Imports
import os
import flag
import frontend
import backend

fn main() {
	mut fp := flag.new_flag_parser(os.args)
	fp.application('BC')
	fp.version('v0.0.4')
	fp.description('Brainfuck Compiler / Transpiler')
	fp.skip_executable()

	mode := fp.string('backend', `b`, 'v', 'Backend (V, C)')

	tape_size := fp.int('size', 0, 8192, 'Tape Size')

	keep := fp.bool('keep', `k`, false, 'Keep')
	optimize := fp.bool('optimize', `O`, false, 'Enable optimize')

	file := fp.string('input', `i`, '', 'File In')
	output := fp.string('output', `o`, os.file_name(file).split('.')[0], 'File Out')

	fp.finalize() or {
		eprintln(err)
		println(fp.usage())
		exit(1)
	}

	oflags := {
		'v': '-prod' // Use -cflags -Ofast on clang
		'c': '-O'
	}

	optimize_flag := oflags[mode]

	code := os.read_file(file) or {
		println(fp.usage())
		exit(1)
	}

	result := frontend.transpiler(code, tape_size, mode)

	os.write_lines(output + '.${mode}', result) or { exit(1) }

	if optimize {
		backend.compiler(output, optimize_flag, mode)
	} else {
		backend.compiler(output, '', mode)
	}

	if !keep {
		os.rm(output + '.${mode}') or { exit(1) }
	}
}
