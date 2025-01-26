{
 open Parser  
 exception No_such_symbol
 exception LexError of string * Lexing.position
}

let digit = ['0'-'9']
let id = ['a'-'z' 'A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9']*

rule lexer = parse
| digit+ as num  { NUM (int_of_string num) }
| "if"                    { IF }
| "else"                  { ELSE }
| "while"                 { WHILE }
| "scan"                  { SCAN }
| "sprint"                { SPRINT }
| "iprint"                { IPRINT }
| "int"                   { INT }
| "return"                { RETURN }
| "type"                  { TYPE }
| "void"                  { VOID }
| id as text              { ID text }
| '\"'[^'\"']*'\"' as str { STR str }
| '='                     { ASSIGN }
| "=="                    { EQ }
| "!="                    { NEQ }
| '>'                     { GT }
| '<'                     { LT }
| ">="                    { GE }
| "<="                    { LE }
| '+'                     { PLUS }
| '-'                     { MINUS }
| '*'                     { TIMES }
| '/'                     { DIV }
| '{'                     { LB  }
| '}'                     { RB  }
| '['                     { LS }
| ']'                     { RS }
| '('                     { LP  }
| ')'                     { RP  }
| ','                     { COMMA }
| ';'                     { SEMI }
| "//" [^'\n']* '\n'      { lexer lexbuf }(* ignore comments *)
| [' ' '\t']         { lexer lexbuf }(* eat up whitespace *) 
| '\n'                    { Lexing.new_line lexbuf; lexer lexbuf }
| eof                     { raise End_of_file }
| _ as c                  {
    let pos = Lexing.lexeme_start_p lexbuf in
    raise (LexError (Printf.sprintf "unexpected character %c" c, pos))
}