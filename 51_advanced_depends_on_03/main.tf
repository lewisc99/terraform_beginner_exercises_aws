# 1) A dummy step that “prepares” something
resource "local_file" "prepare" {
  # Imagine this runs a script that generates logs you want to upload - for windows users, you can use a batch file or PowerShell script
  filename = "prepare.log"
  content  = "Echo preparing ... ${timestamp()}" # Adds a log entry with the current timestamp
}


# 2) A local file resource that writes an output, but only after prepare runs
resource "local_file" "output" {
  content  = "All done at ${timestamp()}\n"
  filename = "final_output.txt"

  depends_on = [
    local_file.prepare
  ]
}
