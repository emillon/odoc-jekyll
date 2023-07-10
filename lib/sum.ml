module type S = sig
  type t

  val sum : t list -> t
end

module Int = struct
    type t = int
    let sum = List.fold_left (+) 0
end

module Int32 = struct
    type t = int32
    let sum = List.fold_left Int32.add 0l
end
