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
module type S = sig
  val at_enter_iter : (unit -> unit) -> unit
  (** Register the given function to be called at program termination
      time. The functions registered with [at_exit] will be called when
      the program terminates, either normally or because of an uncaught
      exception.

      The functions are called in 'last in, first out' order: the
      function most recently added with [at_exit] is called first. *)

  val at_exit_iter : (unit -> unit) -> unit
  val at_enter : (unit -> unit Lwt.t) -> unit
  val at_exit : (unit -> unit Lwt.t) -> unit
  val run : unit Lwt.t -> unit
end
