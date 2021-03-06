%{
  /*
    This file is part of bison-calc-ex:
    simple calculator example based on flex/bison.
    Copyright (C) 2011  anton0xf <anton0xf@gmail.com>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
#include "calc.tab.h"
#include <math.h>
#include <stdio.h>
#include <string.h>

extern YYSTYPE yylval;

int debug = 0;

%}

D       [0-9]
S       [a-zA-Z_]
%%
[ \t]+  {/* ignore spaces */}
{D}+(\.{D}*)?    { sscanf( yytext, "%lf", &yylval.val ); return NUMBER; }
"+"     return PLUS;
"-"     return MINUS;
"/"     return DIV;
"*"     return MUL;
"("     return OPENBRACKET;
")"     return CLOSEBRACKET;
"ans"   return ANS;
"var"   return VAR;
"="     return SET;
{S}({S}|{D})*    { yylval.string = strdup(yytext); return VARNAME; }
"\n"    return EOLN;
%%
/*
  to verbose lexer use regexp(in emacs syntax):
  return \(.*\); => { printf("\1\\n"); \& }
*/
