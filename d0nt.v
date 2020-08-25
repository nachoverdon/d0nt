module main

import os

const (
	dont_commit = "@d0nt"
)

fn main() {
	check_if_files_contain_keyword() or {
		panic(err)
	}
}

fn check_if_files_contain_keyword() ? {
	root_folder := os.exec("git rev-parse --show-toplevel") or {
		return error(err)
	}
	diff := os.exec("git diff --cached --name-status --diff-filter=d") or {
		return error(err)
	}
	lines := diff.output.split_into_lines()

	for line in lines {
		file_name := root_folder.output + "/"
			+ line.substr(1, line.len).trim_space()

		file_content := os.read_file(file_name) or {
			println("Cannot read file: $file_name")

			continue
		}

		if file_content.contains(dont_commit) {
			panic("Commit failed. File $file_name contains $dont_commit")
		}
	}
}
