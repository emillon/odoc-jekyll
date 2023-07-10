module type S = sig
  type t

  val sum : t list -> t
end

module Int : S with type t = int
module Int32 : S with type t = int32
