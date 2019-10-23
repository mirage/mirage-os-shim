open Ocamlbuild_plugin;;

let () = dispatch @@ function
  | After_rules ->
      if Sys.ocaml_version >= "4.06.0" then
        flag ["ocaml"; "compile"] (A "-no-keep-locs") ;
  | _ -> ()
