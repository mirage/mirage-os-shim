(* Copyright (c) 2016 David Kaloper Meršinjak. All rights reserved.
   See LICENSE.md. *)

open Mirage_OS

let pr fmt = Format.printf fmt

let _ =
  OS.Main.at_enter_iter (fun _ -> pr "+ enter iter\n%!");
  OS.Main.at_exit_iter (fun _ -> pr "- exit iter\n%!")

let () =
  pr "> Will sleep.\n%!";
  OS.(Main.run (Time.sleep 1.0));
  pr "> How nice :)\n%!"
