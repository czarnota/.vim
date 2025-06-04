#!/usr/bin/env bash

# Buffer all input so that executed script can access it
export VIM_CONTENTS="$(cat)"

extract_comment () {
    local first
    IFS= read -r first || return
    case "$first" in
        \#!*)
            echo "${first:2}"
            sed -E -n 's,# ?,,p'
            ;;
        \#\ !*)
            echo "${first:3}"
            sed -E -n 's,# ?,,p'
            ;;
        //!*)
            echo "${first:3}"
            sed -E -n 's,// ?,,p'
            ;;
        //\ !*)
            echo "${first:4}"
            sed -E -n 's,// ?,,p'
            ;;
        /\*!*)
            echo "${first:3}"
            sed -E -n 's,^(/\*| \*| \*/),,p'
            ;;
        /\*\ !*)
            echo "${first:4}"
            sed -E -n 's,^(/\*| \*| \*/),,p'
            ;;
        *)
            return 1
    esac
}

print_comment () {
    local first
    IFS= read -r first || return
    echo "$first"
    case "$first" in
        \#!*)
            sed -E -n '/^# ?/p'
            ;;
        \#\ !*)
            sed -E -n '/^# ?/p'
            ;;
        //!*)
            sed -E -n '/^\/\/ ?/p'
            ;;
        //\ !*)
            sed -E -n '/^\/\/ ?/p'
            ;;
        /\*!*)
            sed -E -n '/^(\/\*| \*| \*\/)/p'
            ;;
        /\*\ !*)
            sed -E -n '/^(\/\*| \*| \*\/)/p'
            ;;
    esac
}

execute () {
    local first
    IFS= read -r first || return
    cat | bash -c "$first"
}

if comment="$(extract_comment <<< "$VIM_CONTENTS")"; then
    print_comment <<< "$VIM_CONTENTS"
    execute <<< "$comment"
else
    bash <<< "$VIM_CONTENTS"
fi
