import argv
import gleam/int
import gleam/io
import gleam/list

pub fn next_value(num: Int) -> Int {
  case int.is_even(num) {
    True -> num / 2
    False -> 3 * num + 1
  }
}

fn helper(num: Int, acc: List(Int)) {
  let next = next_value(num)
  let acc = [next, ..acc]
  case next {
    1 -> acc
    _ -> helper(next, acc)
  }
}

fn collatz(num: Int) -> List(Int) {
  helper(num, [num])
  |> list.reverse
}

pub fn main() {
  let n = case argv.load().arguments {
    [num] ->
      case int.parse(num) {
        Ok(n) -> n
        Error(Nil) -> 0
      }
    _ -> 0
  }

  let out = case n {
    n if n > 0 -> collatz(n)
    _ -> {
      io.println("Invalid arg")
      []
    }
  }

  io.debug(out)
}
