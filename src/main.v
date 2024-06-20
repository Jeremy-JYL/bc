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

const optimize_flag = '-prod -ccflag -Ofast' // Use -Ofast on clang

fn main() {
	mut fp := flag.new_flag_parser(os.args)
	fp.application('BC')
	fp.version('v0.0.1')
	fp.description('Brainfuck Compiler / Transpiler')
	fp.skip_executable()

	tape_size := fp.int('size', 0, 8192, 'Tape Size')
	tape_type := fp.string('type', 0, 'int', 'Tape Type')

	translate := fp.bool('translate', `t`, false, 'New Line Translation')
	mut vcf := fp.string('vflags', 0, '', 'V Compiler Flags')
	emit_v := fp.bool('emitv', 0, false, 'Emit V File')
	optimize := fp.bool('optimize', `O`, false, 'Enable optimize')

	file := fp.string('input', `i`, '', 'File In')
	output := fp.string('output', `o`, os.file_name(file).split('.')[0], 'File Out') + '.v'

	fp.finalize() or {
		eprintln(err)
		println(fp.usage())
		exit(1)
	}

	if optimize {
		vcf += ' ' + optimize_flag
	}

	code := os.read_file(file) or {
		println(fp.usage())
		exit(1)
	}

	result := frontend.transpiler(code, tape_size, tape_type, translate)

	os.write_lines(output, result) or { exit(1) }

	backend.compiler(output, vcf)

	if !emit_v {
		os.rm(output) or { exit(1) }
	}
}
