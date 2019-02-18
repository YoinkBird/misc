# pseudo-templating with bash

```
template_pseudo/
├── template_replace.sh
├── test.js.template
└── t_template_replace.sh
```

| file | description |
| ---- | ----------- |
| t_template_replace.sh | test file, removes all generated files, runs template_replace.sh, and visually diffs the output for manual verification |
| template_replace.sh | main worker | 
| test.js.tempalte | sample pseudo-template file |

