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

fn collatz(num: String) -> List(Int) {
  case int.parse(num) {
    Ok(n) -> helper(n, [n]) |> list.reverse
    Error(Nil) -> []
  }
}

pub fn main() {
  case argv.load().arguments {
    [num] -> collatz(num)
    _ -> []
  }
  |> io.debug
}
