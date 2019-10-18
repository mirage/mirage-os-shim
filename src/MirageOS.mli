(* Copyright (c) 2016 David Kaloper Meršinjak. All rights reserved.
   See LICENSE.md. *)

(** Portable shim for MirageOS APIs

    You can open this module in a Mirage unikernel to gain access to the core OS
    services. The implementation is resolved implicitly at link-time.

    {b Note} This is a very special facility, designed to help other {e core}
    Mirage components avoid pervasive functorization. When in doubt, do {e not}
    use it.

    {e %%VERSION%% — {{:%%PKG_HOMEPAGE%% }homepage}} *)

(** {1 Interface} *)

(** A version of [OS] portable across back-ends.

{[
let _ = OS.Main.at_enter_iter ...]} *)
module Main : sig
  val at_enter_iter : (unit -> unit) -> unit
  val run : unit Lwt.t -> unit
end

module Time : sig
  val sleep_ns : int64 -> unit Lwt.t
end
