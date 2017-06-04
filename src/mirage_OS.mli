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

{[open Mirage_OS
let _ = OS.Main.at_enter ...]} *)
module OS : sig

  module Lifecycle : sig
    val await_shutdown_request :
      ?can_poweroff:bool ->
      ?can_reboot:bool ->
      unit -> [`Poweroff | `Reboot] Lwt.t
  end

  module Main : sig
    val run : unit Lwt.t -> unit
    val at_enter : (unit -> unit Lwt.t) -> unit
    val at_exit_iter  : (unit -> unit) -> unit
    val at_enter_iter : (unit -> unit) -> unit
  end

  module Time : sig
    val sleep_ns : int64 -> unit Lwt.t
  end

end
