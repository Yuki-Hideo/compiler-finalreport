{
open Parser
exception No_such_symbol
exception LexError of string * Lexing.position

type token_info = {
    token_string: string;
    token_pos: Lexing.position;
}
let current_token = ref {
    token_string = "";
    token_pos = Lexing.dummy_pos;
}
let store_token lexbuf =
    current_token := {
        token_string = Lexing.lexeme lexbuf;
        token_pos = Lexing.lexeme_start_p lexbuf;
    }
}

let digit = ['0'-'9']
let id = ['a'-'z' 'A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9']*

rule lexer = parse
| digit+ as num       { store_token lexbuf; NUM (int_of_string num) }
| "if"                { store_token lexbuf; IF }
| "else"              { store_token lexbuf; ELSE }
| "do"                { store_token lexbuf; DO }
| "while"             { store_token lexbuf; WHILE }
| "scan"              { store_token lexbuf; SCAN }
| "sprint"            { store_token lexbuf; SPRINT }
| "iprint"            { store_token lexbuf; IPRINT }
| "int"               { store_token lexbuf; INT }
| "return"            { store_token lexbuf; RETURN }
| "type"              { store_token lexbuf; TYPE }
| "void"              { store_token lexbuf; VOID }
| id as text          { store_token lexbuf; ID text }
| '"'[^'"']*'"' as str { store_token lexbuf; STR str }
| '='                 { store_token lexbuf; ASSIGN }
| "=="                { store_token lexbuf; EQ }
| "!="                { store_token lexbuf; NEQ }
| '>'                 { store_token lexbuf; GT }
| '<'                 { store_token lexbuf; LT }
| ">="                { store_token lexbuf; GE }
| "<="                { store_token lexbuf; LE }
| '+'                 { store_token lexbuf; PLUS }
| '-'                 { store_token lexbuf; MINUS }
| '*'                 { store_token lexbuf; TIMES }
| '/'                 { store_token lexbuf; DIV }
| '%'                 { store_token lexbuf; MOD }
| '^'                 { store_token lexbuf; POW }
| "++"                { store_token lexbuf; INCR }
| "+="                { store_token lexbuf; ADD_ASSIGN }
| ".."                { store_token lexbuf; TO }
| '{'                 { store_token lexbuf; LB  }
| '}'                 { store_token lexbuf; RB  }
| '['                 { store_token lexbuf; LS }
| ']'                 { store_token lexbuf; RS }
| '('                 { store_token lexbuf; LP  }
| ')'                 { store_token lexbuf; RP  }
| ','                 { store_token lexbuf; COMMA }
| ';'                 { store_token lexbuf; SEMI }
| "//" [^'\n']* '\n'  { lexer lexbuf } (* ignore comments *)
| [' ' '\t']          { lexer lexbuf } (* eat up whitespace *) 
| '\n'                { Lexing.new_line lexbuf; lexer lexbuf }
| eof                 { raise End_of_file }
| _ as c {
    let pos = Lexing.lexeme_start_p lexbuf in
    raise (LexError (Printf.sprintf "Unknown token '%c'" c, pos))
}