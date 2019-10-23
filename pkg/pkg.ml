#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let default = false

let () =
  Pkg.describe "mirage-os-shim" @@ fun c ->
    Ok [ Pkg.lib "src/mirage_main.cmi" ]
