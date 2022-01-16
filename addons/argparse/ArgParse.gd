extends Node

class_name ArgParse

static func get_options():
  var options = {}
  var args = OS.get_cmdline_args()
  for i in len(args):
    if args[i].begins_with("--"):
      var arg = args[i].lstrip("--")
      if arg.find("=") > -1:
        var kvp = arg.split("=")
        options[kvp[0]] = kvp[1] if len(kvp) > 1 else null
      elif i + 1 < len(args) and not args[i + 1].begins_with("--"):
        options[arg] = args[i + 1]
      else:
        options[arg] = null
  return options

static func get_arguments():
  var arguments = []
  var args = OS.get_cmdline_args()
  var ignore_next = false
  for i in len(args):
    if ignore_next:
      ignore_next = false
      continue
    if args[i].begins_with("--"):
      if i + 1 < len(args) and not args[i + 1].begins_with("--"):
        ignore_next = true
    else:
      arguments.append(args[i])
  return arguments
