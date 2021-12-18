@test
def testMajor(): Bool & Impure =
  match semVer2("1.2.3-alpha+001") {
      case Ok(v) => {
          v.major == 1
        }
      case Err(_s) => false
  }

@test
def testMinor(): Bool & Impure =
  match semVer2("1.2.3-alpha+001") {
      case Ok(v) => {
          v.minor == 2
        }
      case Err(_s) => false
  }

@test
def testPatch(): Bool & Impure =
  match semVer2("1.2.3-alpha+001") {
    case Ok(v) => {
      v.patch == 3
    }
    case Err(_s) => false
  }

@test
def testPreRelease(): Bool & Impure =
  match semVer2("1.2.3-alpha+001") {
    case Ok(v) => {
      v.preRelease == "alpha"
    }
    case Err(_s) => false
  }

@test
def testBuild(): Bool & Impure =
  match semVer2("1.2.3-alpha+001") {
    case Ok(v) => {
      v.build == "001"
    }
    case Err(_s) => false
  }

@test
def testLessDots(): Bool & Impure =
  match semVer2("1.2-alpha+001") {
    case Ok(_v) => false
    case Err(s) => s == "Invalid format (illegal numbers of dots)"
  }

@test
def testManyDots(): Bool & Impure =
  match semVer2("1.2.3.4-alpha+001") {
    case Ok(_v) => false
    case Err(s) => s == "Invalid format (illegal numbers of dots)"
  }

@test
def testNotNumericMajor(): Bool & Impure =
  match semVer2("foo.2.3-alpha+001") {
    case Ok(_v) => false
    case Err(s) => s == "Int32.fromString"
  }
