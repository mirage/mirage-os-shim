open Ocamlbuild_plugin;;

let () = dispatch @@ function
  | After_rules ->
      if Sys.ocaml_version >= "4.06.0" then
        flag ["ocaml"; "compile"] (A "-no-keep-locs");
      copy_rule "unix" "src/%" "unix/%";
      copy_rule "xen" "src/%" "xen/%";
      copy_rule "solo5" "src/%" "solo5/%";
  | _ -> ()
