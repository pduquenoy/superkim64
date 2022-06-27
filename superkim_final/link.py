program = ''

with open('supermon64+KIM-1.dcb') as f:
    program = f.read()

program = program.replace('$85, $C6, $4C, $7A, $95', '$85, $C6, $4C, $08, $A0') # jump to autocomplete
program += 'dcb '

with open('autocmp') as f:
    source = f.read().split('\n')[1:-3]
    for i in range(len(source)):
        line = source[i]
        if i == 0: line = line[13:]
        line = line.strip()
        if i: line = 'dcb ' + line
        line = line.replace('0x', '$')
        if line[-1] == ',': line = line[:-1]
        program += line + '\n'

with open('supermon64+KIM-1_autocmp.dcb', 'w') as f: f.write(program)


