#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let default = false
let mirage_unix  = Conf.with_pkg ~default "mirage-unix"
let mirage_solo5 = Conf.with_pkg ~default "mirage-solo5"
let mirage_xen   = Conf.with_pkg ~default "mirage-xen"

let () =
  Pkg.describe "mirage-os-shim" @@ fun c ->
    let unix  = Conf.value c mirage_unix
    and xen   = Conf.value c mirage_xen
    and solo5 = Conf.value c mirage_solo5 in
    Ok [ Pkg.mllib ~cond:unix "unix/mirage-os-shim.mllib" ~dst_dir:"unix/" ;
         Pkg.mllib ~cond:xen "xen/mirage-os-shim.mllib" ~dst_dir:"xen/" ;
         Pkg.mllib ~cond:solo5 "solo5/mirage-os-shim.mllib" ~dst_dir:"solo5/" ;
         Pkg.lib "src/mirage_OS.cmi";
         Pkg.test ~cond:unix "test/test";
       ]
