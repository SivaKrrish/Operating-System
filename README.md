# Operating-System
Unix System Calls and Library Functions
Problem: Write a program called doenv that behaves in the same way as the env utility when executing another program.
Check the man page for env(1) for a description of the utility.
1. When called with no arguments, doenv calls getenv(3C) and outputs the current environment to stdout.
2. When doenv is called with option -i, the entire environment is replaced by the name=value pairs. Otherwise, the
pairs modify or add to the current environment.
3. If the utility argument is given, use system(3S) to execute utility after the environment has been appropriately
changed. Otherwise, print the changed environment to stdout, one entry per line.
4. One way to change the current environment in a program is to overwrite the value of the environ external variable. If
you are completely replacing the external environment (-i option), count the number of name=value pairs, allocate
enough space for the argument array (don’t forget the extra NULL entry), copy the pointers from argv into the array,
and set environ.
5. If you are modifying the current environment by overwriting environ, allocate enough space to hold the old entries
and any new entries to be added. Copy the pointers from the old environ into the new one. For each name=value
pair, determine whether the name is already in the old environment. If name appears, just replace the pointer. Otherwise,
add the new entry to the array.
6. Note that it is not safe to just append new entries to the old environ, since you cannot expand the old environ
array with realloc(3C). if all name=value pairs correspond to entries already in the environment, just replace the
corresponding pointers in environ.
With the use of perror, I’ll like some meaningful error messages. The format for error messages should be:
doenv: Error: Detailed error message
where doenv is actually the name of the executable (argv[0]) and should be appropriately modified if the name of executable
is changed without a need to recompile the source.
