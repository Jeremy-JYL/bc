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
	Transpiler
*/

module frontend

pub fn transpiler(source string, tape_size i64, tape_type string, translate bool) []string {
	mut result := []string{}
	code := source.split('')

	// Init
	result << 'fn main() {'
	result << 'mut tape := [${tape_size}]${tape_type}{}'
	result << 'mut counter := 0'

	for i in code {
		match i {
			'+' {
				result << 'tape[counter]++'
			}
			'-' {
				result << 'tape[counter]--'
			}
			'>' {
				result << 'counter++'
			}
			'<' {
				result << 'counter--'
			}
			'[' {
				result << 'for tape[counter] != 0 {'
			}
			']' {
				result << '}'
			}
			',' {
				result << 'tape[counter] = input_character()'
			}
			'.' {
				if translate {
					result << 'print(rune(tape[counter]))'
				} else {
					result << 'print(tape[counter])'
				}
			}
			else {}
		}
	}

	// EOF
	result << '}'

	return result
}
