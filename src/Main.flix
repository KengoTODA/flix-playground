type alias SemVer2 = {
  major :: Int32,
  minor :: Int32,
  patch :: Int32,
  preRelease :: String,
  build :: String
}

def semVer2Body(body: String): Result[List[Int32], String] =
  let split = String.splitOn({substr = "."}, body);
  match List.length(split) {
    case 3 => split |> List.map(Int32.fromString) |> Result.sequence
    case _ => Err("Invalid format (illegal numbers of dots)")
  }

def map(preRelease: String, build: String, a: Array[Int32]): SemVer2 & Impure =
  {
    major = a[0],
    minor = a[1],
    patch = a[2],
    preRelease = preRelease |> String.drop(1),
    build = build |> String.drop(1)
  }

pub def semVer2(string: String): Result[SemVer2, String] & Impure =
  let (others, build) = String.breakOnLeft({substr = "+"}, string);
  let (body, preRelease) = String.breakOnLeft({substr = "-"}, others);
  semVer2Body(body) |> Result.map(split: List[Int32] -> {
    split |> List.toArray |> map(preRelease, build)
  })
