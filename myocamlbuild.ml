open Ocamlbuild_plugin;;

let () = dispatch @@ function
  | After_rules ->
      copy_rule "unix" "src/%" "unix/%";
      copy_rule "xen" "src/%" "xen/%";
      copy_rule "solo5" "src/%" "solo5/%";
  | _ -> ()
