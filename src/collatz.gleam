import argv
import gleam/int
import gleam/io
import gleam/list
import gleam/string

type ArgTypes {
  Valid(Int)
  Missing
  Invalid
}

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

fn print(nums: List(Int)) -> String {
  nums
  |> list.map(int.to_string)
  |> string.join(", ")
}

pub fn main() {
  let n = case argv.load().arguments {
    [num] ->
      case int.parse(num) {
        Ok(n) -> Valid(n)
        Error(Nil) -> Invalid
      }
    _ -> Missing
  }

  case n {
    Missing -> io.println("No argument provided: gleam run ARG1 (int)")
    Invalid -> io.println("Invalid argument (could not be parsed as int)")
    Valid(n) -> io.println(collatz(n) |> print)
  }
}
