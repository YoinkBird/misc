#!/usr/bin/env bash
set -ue -o pipefail
set -x
test_name="test"
test_tmpl_file="${test_name}.js.template";

test_nums=(1 happypath fancypath);
for i in ${test_nums[@]}; do
    test_out_file="${test_name}_${i}.js";
# create JS test from template by copying to ".js" file and then using sed to find-replace the vars. 
#+ if any of these actions fail, append ".gen_fail" to the test output file for easer debug
#+ NOTE: there is another more advanced method to do this using bash traps, but this technique is simple and should be converted to use Jinja templating anyway
    # steps:
    # create .js file for modification
    # && replace the template vars in the newly created .js file 
    # || if anything goes wrong, rename the generated .js file to indicate failure && then exit 90
    cp -vn "${test_tmpl_file}" "${test_out_file}" \
    && sed -i "" "s|__TMPLVAR_ITERATION_CTR|${i}|g" "${test_out_file}" \
    || ( mv -vn "${test_out_file}" "${test_out_file}.gen_fail" && exit 90 )
done

# test with:
# ls | grep 'test.*js$' | xargs rm && ./template_replace.sh
