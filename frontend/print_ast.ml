open Ast
open Printf

let semi str = if str = "" then str else str ^ "; "
let rec  ast_stmt ast = match ast with
        CallProc (s, l) -> sprintf "CallProc(\"%s\",[%s])" s  
              (List.fold_left  (fun str x  -> (semi str) ^ (ast_exp x)) "" l)
      | Block (dl, sl) -> sprintf "Block([%s],[%s])"
              (List.fold_left (fun str x -> (semi str) ^ (ast_dec x)) "" dl)
              (List.fold_left (fun str x -> (semi str) ^ (ast_stmt x)) "" sl)
      | Assign (v, e) -> sprintf "Assign(%s,%s)" (ast_var v) (ast_exp e)
      | If (e,s,None) -> sprintf "If(%s,%s,None)" (ast_exp e) (ast_stmt s)
      | If (e,s1,Some s2) -> sprintf "If(%s,%s,Some %s)" (ast_exp e) (ast_stmt s1) (ast_stmt s2)
      | While (e,s) -> sprintf "While(%s,%s)" (ast_exp e) (ast_stmt s)
      | NilStmt -> "NilStmt"
and ast_var ast = match ast with 
        Var s -> sprintf "Var \"%s\"" s
      | IndexedVar (v, e) -> sprintf "IndexedVar (%s,%s)" (ast_var v) (ast_exp e)
and ast_dec ast = match ast with
        FuncDec (s, l, t, b) -> 
            sprintf "FuncDec(\"%s\",[%s],%s,%s)" s
                (List.fold_left (fun str (t,s) -> (semi str) ^ sprintf "(%s,\"%s\")" (ast_typ t) s) "" l)
                (ast_typ t)
                (ast_stmt b)
      | VarDec (t,s) -> sprintf "VarDec(%s,\"%s\")" (ast_typ t) s
      | TypeDec (s, t) -> sprintf "TypeDec (\"%s\",%s)" s (ast_typ t)
and ast_exp ast = match ast with
        VarExp v -> sprintf "VarExp(%s)" (ast_var v)
      | StrExp s -> sprintf "StrExp(%s)" s
      | IntExp i -> sprintf "IntExp(%d)" i
      | CallFunc (s, l) -> sprintf "CallFunc(\"%s\",[%s])" s
                               (List.fold_left (fun str x -> (semi str) ^ (ast_exp x)) "" l)
and ast_typ ast = match ast with
        NameTyp s -> sprintf "NameTyp \"%s\"" s
      | ArrayTyp (size,t) -> sprintf "ArrayTyp (%d,%s)" size (ast_typ t)
      | IntTyp -> "IntTyp"
      | VoidTyp -> "VoidTyp"


let main () =
        let cin = if Array.length Sys.argv > 1 then open_in Sys.argv.(1)
                        else stdin in
        let lexbuf = Lexing.from_channel cin in
        try
                let result = Parser.prog Lexer.lexer lexbuf in
                print_string (ast_stmt result);
                print_string "\n"
        with
        | Parsing.Parse_error ->
                let pos = lexbuf.Lexing.lex_curr_p in
                let tok = Lexing.lexeme lexbuf in
                Printf.fprintf stderr "syntax error: line %d, token '%s'\n" 
                pos.Lexing.pos_lnum tok;
                exit 1
        | Lexer.LexError(msg, pos) ->
                Printf.fprintf stderr "lexical error: %s at line %d\n" 
                msg pos.Lexing.pos_lnum;
                exit 1

let () = main ()