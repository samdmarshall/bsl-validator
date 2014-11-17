import sys
import string
import bsl_functions
import bsl_variables
# Globals
PARSED_LINES = [];
INDENT_LEVEL = 0;
PARSE_AS_NEW_LINE = False;
PAREN_SCOPE = 0;

GLOBAL_FUNCTIONS = {
    'ai2_allpassive': bsl_functions.ai2_allpassive,
    'ai2_kill': bsl_functions.ai2_kill,
    'ai2_spawnall': bsl_functions.ai2_spawnall,
    'ai2_stopignoring_count': bsl_functions.ai2_stopignoring_count,
    'ai2_stopignoring_time': bsl_functions.ai2_stopignoring_time,
    'ai2_takecontrol': bsl_functions.ai2_takecontrol,
    'ai2_active': bsl_functions.ai2_active,
    'ai2_attack': bsl_functions.ai2_attack,
    'ai2_barabbas_retrievegun': bsl_functions.ai2_barabbas_retrievegun,
    'ai2_chump': bsl_functions.ai2_chump,
    'ai2_comehere': bsl_functions.ai2_comehere,
    'ai2_doalarm': bsl_functions.ai2_doalarm,
    'ai2_dopath': bsl_functions.ai2_dopath,
    'ai2_followme': bsl_functions.ai2_followme,
    'ai2_forget': bsl_functions.ai2_forget,
    'ai2_idle': bsl_functions.ai2_idle,
    'ai2_inactive': bsl_functions.ai2_inactive,
    'ai2_kill': bsl_functions.ai2_kill,
    'ai2_lookatchar': bsl_functions.ai2_lookatchar,
};
GLOBAL_VARIABLES = {
    'ai2_blind': bsl_variables.ai2_blind,
    'ai2_boss_battle': bsl_variables.ai2_boss_battle,
    'ai2_deaf': bsl_variables.ai2_deaf,
    'ai2_ignore_player': bsl_variables.ai2_ignore_player,
    'ai2_barabbas_run': bsl_variables.ai2_barabbas_run,
    'ai2_chump_stop': bsl_variables.ai2_chump_stop,
};
# Objects

# Token Types
bsl_token_delimiter = [' ', '=', '(', ')', ';', ',', '#'];
bsl_types = ['void', 'string', 'bool', 'int', 'float'];
bsl_op = ['+', '-', '=', '!', 'and', 'or', 'eq', 'ne', '<', '>', '<=', '>='];
bsl_comment = ['#'];
bsl_parameter_encapsulate = ['(', ')'];
bsl_scope_encapsulate = ['{', '}'];
bsl_encapsulate = bsl_parameter_encapsulate + bsl_scope_encapsulate + ['"'];
bsl_separator = [';', ','];

numbers_array = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
bsl_valid_floats = numbers_array + [ '.', 'f'];
bsl_valid_ints = numbers_array + ['f'];
bsl_valid_strings = list(string.ascii_lowercase) + list(string.ascii_uppercase) + ['_']
bsl_valid_bools = ['t', 'r', 'u', 'e', 'f', 'a', 'l', 's', '0', '1'];
bsl_valid_names = bsl_valid_strings + ['.'] + numbers_array;
# Helpers
def SumIndexTuple(sum_tuple):
    return sum_tuple[0] + sum_tuple[1];
def ExtractTokenStringFromArray(token_array):
    token_strings = [];
    for token in token_array:
        token_strings.append(token[2]);
    return token_strings;
def MakeTokenReturnTuple(token_array, index, is_valid):
    new_index = index + token_array[-1][0] + token_array[-1][1];
    token_length = token_array[-1][0] - index;
    token_string = ' '.join(ExtractTokenStringFromArray(token_array));
    return (new_index, token_length, token_string, is_valid);
def IndexOfNextCharInList(char_list, char):
    index = 0;
    current_char = char_list[index]
    while current_char != char:
        index += 1;
        if index >= len(char_list):
            break;
        current_char = char_list[index];
    return index;
def IndexOfNextNonSpace(char_list):
    skip_length = 0;
    current_char = char_list[skip_length];
    while current_char == ' ':
        skip_length += 1;
        current_char = char_list[skip_length];
    return skip_length;
# Functions
def IsReservedWord_2(word):
    return word in ['at', 'eq', 'if', 'ne', 'or'];
def IsReservedWord_3(word):
    return word in ['and', 'for', 'int', 'var'];
def IsReservedWord_4(word):
    return word in ['bool', 'else', 'func', 'fork', 'over', 'true', 'void'];
def IsReservedWord_5(word):
    return word in ['every', 'false', 'float', 'using', 'sleep'];
def IsReservedWord_6(word):
    return word in ['repeat', 'return', 'string'];
def IsReservedWord_7(word):
    return word in ['iterate'];
def IsReservedWord_8(word):
    return word in ['schedule'];
def IsReservedWord(word):
    if len(word) != 0:
        word_length_key = str(len(word));
        if word_length_key in bsl_reserved_word:
            return bsl_reserved_word[word_length_key](word);
    return False;
# Validate Func Signature Arguments
def CreateArgumentValidationTuple(arg_type, var_name, index):
    argument_string = arg_type + var_name;
    return (index, len(argument_string), argument_string, True);
def ValidateArg(arg_type, arg_str, index, name_optional):
    param_name = '';
    valid_syntax = False;
    if len(arg_str) == 0:
        return (name_optional, CreateArgumentValidationTuple(arg_type, '', index));
    else:
        name_start = IndexOfNextNonSpace(arg_str[0:]);
        name_end = IndexOfNextCharInList(arg_str[name_start:], ' ')+1
        variable_name = ''.join(arg_str[:name_end]);
    valid_syntax = False;
    if name_optional == True:
        valid_syntax = True;
    else:
        valid_syntax = len(variable_name) != 0;
    argument_tuple = CreateArgumentValidationTuple(arg_type,variable_name,index);
    return (valid_syntax, argument_tuple);
# Validate Variable Values
def ValidateVoidVar(char):
    return False;
def ValidateStringVar(char):
    return char in bsl_valid_strings;
def ValidateIntVar(char):
    return char in bsl_valid_ints;
def ValidateBoolVar(char):
    return char in bsl_valid_bools;
def ValidateFloatVar(char):
    return char in bsl_valid_floats;
def ParseAssign(char_list, index, var_type):
    global PARSE_AS_NEW_LINE;
    skip_length = 0;
    token_length = 0;
    current_char = char_list[skip_length];
    string_encapsulation = False;
    valid_token = True;
    while current_char == ' ':
        skip_length += 1;
        current_char = char_list[skip_length];
    for char in char_list[skip_length:]:
        if string_encapsulation == True:
            token_length += 1;
        if char == '"':
            token_length += 1;
            string_encapsulation = not string_encapsulation;
            continue;
        if char == ';':
            PARSE_AS_NEW_LINE = True;
            break;
        if char not in bsl_valid_names and string_encapsulation == False:
            print 'Invalid name string';
            valid_token = False;
            break;
        elif string_encapsulation == False:
            valid_token = bsl_types_variable_resolve[var_type](char);
            if valid_token == False:
                break;
            else:
                token_length += 1;
    if string_encapsulation == True:
        valid_token = False;
    token_string = ''.join(char_list[skip_length:skip_length+token_length]);
    return (index+skip_length, token_length, token_string, valid_token);
def ParseVar(char_list, index):
    token_array = [];
    var_token = MakeToken(char_list, index, False);
    token_array.append(var_token);
    if var_token[2] != 'var':
        return MakeTokenReturnTuple(token_array, index, False);
    
    type_token = MakeToken(char_list[var_token[0]:], var_token[0], False);
    token_array.append(type_token);
    if type_token[2] not in bsl_types:
        return MakeTokenReturnTuple(token_array, index, False);
        
    name_token = MakeToken(char_list[type_token[0]:], type_token[0], False);
    token_array.append(name_token);
    
    assign_token = MakeToken(char_list[name_token[0]:], name_token[0], False);
    token_array.append(assign_token);
    if assign_token[2] == '=':
        value_token = ParseAssign(char_list[assign_token[0]:], assign_token[0], type_token[2]);
        token_array.append(value_token);
    elif assign_token[2] != ';':
        return MakeTokenReturnTuple(token_array, index, False);
    
    return MakeTokenReturnTuple(token_array, index, True);
def ParseComment(char_list, index):
    token_length = len(char_list)
    new_index = index + token_length;
    token_string = ''.join(char_list);
    return (new_index, token_length, token_string, True);
def ParseParameters(char_list, index):
    parameters = [];
    open_paren = IndexOfNextCharInList(char_list, '(') + 1;
    new_index = index + open_paren;
    close_paren = IndexOfNextCharInList(char_list, ')');
    
    valid_parameters = True;
    if open_paren > close_paren:
        # there are no parameters defined, just add void
        parameters.append((index+4, 4, 'void', True));
    else:
        parameter_string = ''.join(char_list[open_paren:close_paren]);
        parameter_args = parameter_string.split(',');
        for arg in parameter_args:
            arg_list = list(arg);
            type_token = MakeToken(arg_list, 0, False);
            new_index += type_token[0] - type_token[1];
            valid_parameters = type_token[2] in bsl_types
            if valid_parameters == True:
                name_optional = type_token[2] == 'void';
                new_index += len(arg_list);
                verify_result = ValidateArg(type_token[2], arg_list[type_token[0]:], new_index, name_optional);
                valid_parameters = verify_result[0];
                if valid_parameters == True:
                    parameters.append(verify_result[1]);
            if valid_parameters == False:
                print 'Invalid parameter declaration -> '+arg;
    
    return (parameters, valid_parameters);
def ParseFunc(char_list, index):
    token_array = [];
    func_token = MakeToken(char_list, index, False);
    token_array.append(func_token);
    if func_token[2] != 'func':
        return MakeTokenReturnTuple(token_array, index, False);
    
    peek_token = MakeToken(char_list[func_token[0]:], func_token[0], False);
    if peek_token[2] in bsl_types:
        token_array.append(peek_token);
        name_token = MakeToken(char_list[peek_token[0]:], peek_token[0], False);
        token_array.append(name_token);
    else:
        token_array.append((peek_token[0], 4, 'void', True));
        token_array.append(peek_token);
    
    parameter_result = ParseParameters(char_list[peek_token[0]:],peek_token[0]);
    if parameter_result[1] == True:
        for parameter in parameter_result[0]:
            token_array.append(parameter);
    
    return MakeTokenReturnTuple(token_array, index, parameter_result[1]);
def ParseIf(char_list, index):
    token_array = [];
    if_token = MakeToken(char_list, index, False);
    token_array.append(if_token);
    if if_token[2] != 'if':
        return MakeTokenReturnTuple(token_array, index, False);
        
    parameters = [];
    open_paren = IndexOfNextCharInList(char_list[if_token[0]:], '(') + 1;
    new_index = if_token[0] + open_paren;
    close_paren = IndexOfNextCharInList(char_list[new_index:], ')');
    
    if open_paren > close_paren:
        return MakeTokenReturnTuple(token_array, new_index, False);
    else:
        eval_statement = char_list[new_index:new_index+close_paren];
        # validate eval statement
    
    return MakeTokenReturnTuple(token_array, index, True);
def ParseElse(char_list, index):
    token_array = [];
    else_token = MakeToken(char_list, index, False);
    token_array.append(else_token);
    if else_token[2] != 'else':
        return MakeTokenReturnTuple(token_array, index, False);
    
    # check to see if encapsulated and if it is followed by another if statement
    
    return MakeTokenReturnTuple(token_array, index, True);
def ParseSleep(char_list, index):
    token_array = [];
    sleep_token = MakeToken(char_list, index, False);
    token_array.append(sleep_token);
    if sleep_token[2] != 'sleep':
        return MakeTokenReturnTuple(token_array, index, False);
        
    statement_end = IndexOfNextCharInList(char_list[sleep_token[0]:], ';');
    sleep_statement = char_list[sleep_token[0]:sleep_token[0]+statement_end];
    statement_token = MakeToken(sleep_statement, sleep_token[0], False);
    # validate sleep statement
    if statement_token[3] == True:
        token_array.append(statement_token);
    
    return MakeTokenReturnTuple(token_array, index, True);
def ParseFork(char_list, index):
    token_array = [];
    fork_token = MakeToken(char_list, index, False);
    token_array.append(fork_token);
    if fork_token[2] != 'fork':
        return MakeTokenReturnTuple(token_array, index, False);
        
    statement_end = IndexOfNextCharInList(char_list[fork_token[0]:], ';');
    fork_statement = char_list[fork_token[0]:fork_token[0]+statement_end];
    statement_token = MakeToken(fork_statement, fork_token[0], False);
    # validate fork statement
    if statement_token[3] == True:
        token_array.append(statement_token);
    
    return MakeTokenReturnTuple(token_array, index, True);
def IncreaseParenScope(token_string):
    global PAREN_SCOPE;
    if token_string == '(':
        PAREN_SCOPE += 1;
def DecreaseParenScope(token_string):
    global PAREN_SCOPE;
    if token_string == ')':
        PAREN_SCOPE -= 1;
def IncreaseEncapsulateScope(token_string):
    global INDENT_LEVEL;
    if token_string == '{':
        INDENT_LEVEL += 1;
def DecreaseEncapsulateScope(token_string):
    global INDENT_LEVEL;
    if token_string == '}':
        INDENT_LEVEL -= 1;
def MarkNewLine(token_string):
    global PARSE_AS_NEW_LINE;
    if token_string == ';':
        PARSE_AS_NEW_LINE = True;
# Lookup
bsl_reserved_word = {
    '2': IsReservedWord_2,
    '3': IsReservedWord_3,
    '4': IsReservedWord_4,
    '5': IsReservedWord_5,
    '6': IsReservedWord_6,
    '7': IsReservedWord_7,
    '8': IsReservedWord_8
};
bsl_reserved_parse = {
    'var': ParseVar,
    '#': ParseComment,
    'func': ParseFunc,
    'if': ParseIf,
    'else': ParseElse,
    'sleep': ParseSleep,
    'fork': ParseFork
};
bsl_types_variable_resolve = {
    'string': ValidateStringVar,
    'float': ValidateFloatVar,
    'int': ValidateIntVar,
    'bool': ValidateBoolVar,
    'void': ValidateVoidVar
};
bsl_special_case_resolve = {
    '(': IncreaseParenScope,
    ')': DecreaseParenScope,
    '{': IncreaseEncapsulateScope,
    '}': DecreaseEncapsulateScope,
    ';': MarkNewLine,
}
# Tokens
bsl_known_tokens = {
    '!': 'Logical Not',
    '"': 'String Encapsulator',
    '(': 'Left Paren',
    ')': 'Right Paren',
    '[': 'Left Bracket',
    ']': 'Right Bracket',
    '+': 'Plus',
    ',': 'Comma',
    '-': 'Minus',
    ';': 'SemiColon',
    ':': 'Colon',
    '=': 'Assign',
    '{': 'Left Curley',
    '}': 'Right Curley',
    '|': 'Bar',
    '<': 'Less Than',
    '<=': 'Less Than or Equal',
    '>': 'Greater Than',
    '>=': 'Greater Than or Equal',
    '#': 'Comment'
}
# Special Cases
bsl_two_reserved_words = ['var', 'func'];
# Functions
def ParseReservedWord(token_string, char_list, index, initial_token):
    known_word = token_string in bsl_reserved_parse;
    valid_token = False;
    new_index = index + len(token_string);
    if known_word == True:
        if initial_token == False:
            print 'Invalid placement of \"'+token_string+'\"!';
        else:
            #print 'TODO: Parse \"'+token_string+'\"';
            token = bsl_reserved_parse[token_string](char_list, index);
            #valid_token = True;
            return token;
    return (new_index, len(token_string), token_string, valid_token);
def GetTokenLength(char_list): # returns length of a parsed token
    skip_length = IndexOfNextNonSpace(char_list);
    token_length = 0;
    for char in char_list[skip_length:]:
        if char in bsl_token_delimiter:
            break;
        else:
            token_length += 1;
    if token_length == 0:
        if char_list[skip_length] in bsl_encapsulate or bsl_separator:
            token_length += 1;
    return (skip_length, token_length);
def MakeToken(char_list, index, initial_token): # returns (new index, token length, token string, token validity)
    new_index = index + 1;
    token_length = 1;
    token_string = '';
    valid_token = True;
    if char_list[0] == '#': # is this a comment
        return ParseComment(char_list, index);
    else:
        token_length = GetTokenLength(char_list);
        new_index = index + token_length[0] + token_length[1];
        token_string = ''.join(char_list[token_length[0]:token_length[0]+token_length[1]]);
    return (new_index, token_length[1], token_string, valid_token);
def ValidateToken(token, char_list, index, initial_token):
    global PAREN_SCOPE;
    
    token_length = token[1];
    token_string = token[2];
    if str(token_length) in bsl_reserved_word and PAREN_SCOPE == 0:
        is_reserved_word = bsl_reserved_word[str(token_length)](token_string);
        if is_reserved_word == True:
            # this word is reserved, check context
            return ParseReservedWord(token_string, char_list, index, initial_token);
        else:
            # this word is not reserved, validate context
            if token_string in bsl_known_tokens:
                print 'TODO: parse known tokens';
            else:
                print 'TODO: parse identifier -- '+token_string;
    elif token_string in bsl_special_case_resolve:
        bsl_special_case_resolve[token_string](token_string);
    elif token_string in bsl_op:
        print 'TODO: handle operators';
    return token;
def ParseLine(line_text, offset):
    global PARSED_LINES;
    global PARSE_AS_NEW_LINE;
    
    char_list = list(line_text[offset:]);
    
    parse_another_line = False;
    
    if len(char_list) == 0:
        return (True, parse_another_line, offset);
    
    line_tokens = [];
    line_index = 0;
    valid_line = False;
    
    while line_index < len(char_list):
        token = MakeToken(char_list[line_index:], line_index, len(line_tokens) == 0);
        token = ValidateToken(token, char_list[line_index:], line_index, len(line_tokens) == 0);
        line_index = token[0];
        if token[3] == True:
            line_tokens.append(token);
            valid_line = True;
        else:
            print 'Invalid Token parsed after index ' + str(line_index+offset) + '!';
            valid_line = False;
            break;
        if PARSE_AS_NEW_LINE == True:
            if line_index+1 < len(char_list):
                parse_another_line = True;
            offset = line_index+1;
            PARSE_AS_NEW_LINE = False;
            break;
    
    PARSED_LINES.append(line_tokens);
    
    return (valid_line, parse_another_line, offset);
# Main
def RecursiveParse(line, offset, line_index):
    print 'line: '+str(line_index)+' offset: '+str(offset);
    line_result = ParseLine(line, offset);
    offset += line_result[2];
    if line_result[0] == False:
        print 'Error at line ' +  str(line_index) + '!';
        sys.exit();
    if line_result[1] == True:
        return RecursiveParse(line, offset, line_index);
    return offset;
def main(argv):
    if len(argv) != 1:
        print 'Please supply one bsl file to validate.';
        sys.exit();
    else:
        lines = [line.strip() for line in open(argv[0])];
        line_counter = 0;
        offset = 0;
        for line in lines:
            line_counter += 1;
            RecursiveParse(line, offset, line_counter);
        for line in PARSED_LINES:
            print line;
    
if __name__ == "__main__":
    main(sys.argv[1:]);