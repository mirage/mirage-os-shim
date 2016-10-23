(* Copyright (c) 2016 David Kaloper Meršinjak. All rights reserved.
   See LICENSE.md. *)

(** Portable shim for MirageOS APIs

    {e %%VERSION%% — {{:%%PKG_HOMEPAGE%% }homepage}} *)

(** {1 Interface} *)

module OS : sig

  module Env : sig
    val argv: unit -> (string array) Lwt.t
  end

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
    val sleep : float -> unit Lwt.t
  end

end
