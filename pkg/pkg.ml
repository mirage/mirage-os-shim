#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let mirage_solo5 = Conf.with_pkg ~default:false "mirage-solo5"
let ocaml_freestanding = Conf.with_pkg ~default:false "ocaml-freestanding"
let mirage_xen = Conf.with_pkg ~default:false "mirage-xen"

let () =
  Pkg.describe "mirage-os-shim" @@ fun c ->
    let xen   = Conf.value c mirage_xen
    and solo5 = Conf.(value c mirage_solo5 && value c ocaml_freestanding) in
    Ok [ Pkg.mllib "unix/mirage-os-shim.mllib" ~dst_dir:"unix/" ;
         Pkg.mllib ~cond:xen "xen/mirage-os-shim.mllib" ~dst_dir:"xen/" ;
         Pkg.mllib ~cond:solo5 "solo5/mirage-os-shim.mllib" ~dst_dir:"solo5/" ;
         Pkg.lib "unix/mirage_OS.cmi"
       ]
