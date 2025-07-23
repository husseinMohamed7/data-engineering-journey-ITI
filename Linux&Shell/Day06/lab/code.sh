#!/bin/bash

read -p "Please nter your name: " username
echo hello $username
''''''
#!/bin/bash

# We depend on the type of arguments
# If the last argument is a dir so it copies all previous files to it
# If the second argument is a file it copies the first file to it
# If there is more than two and the last argument is a file it gives error

dest=${@: -1}
sources=("${@:1:$#-1}")

if [ -d "$dest" ]; then
    cp "${sources[@]}" "$dest"
else
    if [ ${#sources[@]} -eq 1 ]; then
        cp "${sources[0]}" "$dest"
    else
        echo "Error: Destination must be a directory when copying multiple files."
    fi
fi
''''''
#!/bin/bash
if [ $# -eq 0 ]; then
    cd /home/h/ || exit
elif [ $# -eq 1 ]; then
    if [ -d "$1" ]; then
        cd "$1" || exit
    else
        echo "Error: '$1' is not a directory"
	#return no exit so it does not exit shell if . or source is used
        return 1
    fi
else
    echo "Error: Too many arguments"
    show_help
    return 1
fi
''''''
#!/bin/bash

if [ $# -eq 0 ]; then
    ls
else
    echo "Error: Too many arguments"
    show_help
    return 1
fi
