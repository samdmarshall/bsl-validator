import sys
import string
import bsl_functions
import bsl_variables
# Globals
PARSED_LINES = [];
GLOBAL_FUNCTIONS = {};
GLOBAL_VARIABLES = {};
# Objects
def LoadGlobals():
    global GLOBAL_FUNCTIONS;
    global GLOBAL_VARIABLES;
    
    for item in dir(bsl_functions):
        if item[0] != '_' and item[1] != '_':
            GLOBAL_FUNCTIONS[str(item)] = getattr(__import__('bsl_functions'), item);
    
    for item in dir(bsl_variables):
        if item[0] != '_' and item[1] != '_':
            GLOBAL_VARIABLES[str(item)] = getattr(__import__('bsl_variables'), item);
    
def main(argv):
    global GLOBAL_FUNCTIONS;
    global GLOBAL_VARIABLES;
    
    LoadGlobals();
    for key in GLOBAL_FUNCTIONS.keys():
        item = GLOBAL_FUNCTIONS[key];
        print '# '+item['desc']+' \ '
        print 'func '+item['rtype']+' '+key+'('+item['args']+') { } \ \n \ '
    
    for key in GLOBAL_VARIABLES.keys():
        item = GLOBAL_VARIABLES[key];
        print '# '+item['desc']+' \ '
        print 'var '+item['type']+' '+key+'; \ \n \ '
    
if __name__ == "__main__":
    main(sys.argv[1:]);