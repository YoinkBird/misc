
# NOTE: don't use shebang for pythonn version, instead specify on CLI.
#+ this allows this script to analyse python2 and python3 programs
#!/usr/bin/env python3
# source: https://docs.python.org/3/library/modulefinder.html
from modulefinder import ModuleFinder
from sys import argv
import re


scriptpath = "server.py"
print('\n'.join(argv))
print(str(len(argv)) + "\n")
print(argv[0])
if len(argv) == 2:
    scriptpath = argv[1]

    finder = ModuleFinder()
    finder.run_script( scriptpath)

    if(1):
        print(finder.report())
    if(0):
        print( '\n'.join(finder.badmodules.keys()) )


    print("# the ones which are imported from __main__ . Not sure how else to make the distinction")
    importthese_arr = []
    importthese_dict = {}
    for foundmod in finder.badmodules.keys() :
      if('__main__' in (finder.badmodules[foundmod].keys())):
         print(foundmod)
         # need to remove duplicates, as the module often is shown with sub-module as well
         module_root = re.sub('\..*$','',foundmod)
         print("parsed parent module %s from string %s" % (module_root, foundmod))
         importthese_arr.append(module_root)
         importthese_dict[module_root] = 1
    importthese_str = ' '.join(importthese_arr)
    importthese_str = ' '.join(importthese_dict.keys())
    print("finished analysis of script %s for missing modules." % (scriptpath))
    print("copy paste this command to install th emissing modules")
    print("<pipversion> install " + importthese_str)
    print("alt approach:")
    print( 
            "echo "
            + importthese_str
            + " | xargs -r -n 1" 
            + " <pipversion> install "
            )
    print("done")

