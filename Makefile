# simple calculator example based on flex/bison
# Copyright (C) 2011  anton0xf <anton0xf@gmail.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

YFLAGS        = -d
PROGRAM       = calc
OBJS          = calc.tab.o lex.yy.o
SRCS          = calc.tab.c lex.yy.c
CC            = gcc 
all:	$(PROGRAM)
.c.o:	$(SRCS)
	$(CC) -c $*.c -o $@ -O
calc.tab.c: calc.y
	bison $(YFLAGS) calc.y
lex.yy.c: calc.lex
	flex calc.lex
calc:	$(OBJS)
	$(CC) $(OBJS)  -o $@ -lfl -lm
clean:
	rm -f $(OBJS) core *~ \#* *.o $(PROGRAM) y.* lex.yy.* calc.tab.*
