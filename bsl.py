import sys
import string
# Globals
PARSED_LINES = [];
INDENT_LEVEL = 0;
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
# Objects
class BSLToken():
    token_string = '';
    token_length = 0;
    token_is_reserved = False;
    
    def __init__(self, string='', length=0):
        self.token_string = string;
        self.token_length = length;
        self.token_is_reserved = IsReservedWord(self.token_string);
class BSLFunction():
    func_return_type = '';
    func_name = '';
    func_parameters = [];
class BSLVariable():
    variable_type = '';
    variable_name = '';
    variable_value = BSLToken();
    
    def __init__(self, token_type, token_name, token_value):
        self.variable_type = token_type;
        self.variable_name = token_name;
        self.variable_value = token_value;
# Tokens
bsl_token_delimiter = [' ', '=', '(', ')', ';', ','];
bsl_types = ['void', 'string', 'bool', 'int', 'float'];
bsl_op = ['+', '-', '=', '!', 'and', 'or', 'eq', 'ne', '<', '>', '<=', '>='];
bsl_comment = ['#'];
bsl_encapsulate = ['{', '}', '(', ')', '"'];
bsl_separator = [';', ','];
# Special Cases
bsl_two_reserved_words = ['var', 'func'];
# Functions
def TokenLength(char_list):
    token_length = 0;
    for char in char_list:
        if char in bsl_token_delimiter:
            break;
        else:
            token_length += 1;
    if token_length == 0:
        if char_list[0] in bsl_encapsulate or bsl_separator:
            token_length += 1;
    return token_length;
def ParseToken(char_list, index):
    token_length = TokenLength(char_list);
    token = ''.join(char_list[:token_length]);
    token_offset = index + token_length;
    return (token_offset, token_length, token);
def ParseLine(line):
    global INDENT_LEVEL
    global PARSED_LINES
    line_list = list(line);
    if len(line_list) == 0:
        return True;
    if line_list[0] in bsl_comment:
        # this line is a comment, ignore
        return True;
    else:
        line_tokens = [];
        token_offset = 0;
        line_start = True;
        while (token_offset < len(line_list)):
            bsl_token_tuple = ParseToken(line_list[token_offset:], token_offset);
            token_offset = bsl_token_tuple[0];
            bsl_token = BSLToken(bsl_token_tuple[2], bsl_token_tuple[1]);
            if bsl_token.token_is_reserved == True:
                if bsl_token.token_string == 'var':
                    if line_start == False:
                        print 'Invalid Placement of \"var\"!';
                        return False;
                if bsl_token.token_string == 'func':
                    if line_start == False:
                        print 'Invalid Placement of \"func\"!';
                        return False;
            if token_offset != 0:
                line_start = False;
            if bsl_token.token_string == ';':
                line_start = True;
            if bsl_token.token_string == '{':
                INDENT_LEVEL += 1;
            elif bsl_token.token_string == '}':
                INDENT_LEVEL -= 1;
            line_tokens.append(bsl_token);
        PARSED_LINES.append(line_tokens);
# Main
def main(argv):
    if len(argv) != 1:
        print 'Please supply one bsl file to validate.';
        sys.exit();
    else:
        lines = [line.strip() for line in open(argv[0])];
        line_counter = 0;
        for line in lines:
            line_counter += 1;
            if ParseLine(line) == False:
                print 'Error at line ' +  str(line_counter) + '!';
                sys.exit();
        for line in PARSED_LINES:
            for token in line:
                print token.token_string;
    
if __name__ == "__main__":
    main(sys.argv[1:]);