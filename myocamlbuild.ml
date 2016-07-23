open Ocamlbuild_plugin;;

let () = dispatch @@ function
  | After_rules ->
      copy_rule "xen" "unix/%" "xen/%";
      copy_rule "solo5" "unix/%" "solo5/%"
  | _ -> ()
