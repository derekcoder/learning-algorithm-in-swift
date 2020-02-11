public func example(of info: String, action: () -> Void) {
  print("----- Example of \(info) -----")
  action()
  print("")
}
