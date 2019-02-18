#!/usr/bin/env bash
set -ue -o pipefail
set -x
test_name="test"
test_tmpl_file="${test_name}.js.template";

# test: 
# remove all generated files and then run
ls | grep "${test_name}.*js$" | xargs rm && ./template_replace.sh
# diff the generated against template
ls | grep "${test_name}.*js$" | xargs -n 1 git diff --color --no-index "${test_tmpl_file}" 
