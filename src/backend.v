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
	Compiler
*/

module backend

import os

pub fn compiler(source string, vcf string) {
	println(os.execute('v ${vcf} ./${source}'))
}
