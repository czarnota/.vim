#!/usr/bin/env bash

# Buffer all input so that executed script can access it
export VIM_CONTENTS=$(cat)
export VIM_CONTENTS_RAW="$VIM_CONTENTS"

if [[ "$VIM_CONTENTS" == \#!bash* ]]; then
    VIM_CONTENTS="$(sed -n -E 's/^#!bash//p;s/^# {0,1}//p' <<< "$VIM_CONTENTS")"
    sed -n -E '/^#/p' <<< "$VIM_CONTENTS_RAW"
elif [[ "$VIM_CONTENTS" == \#\ !bash* ]]; then
    VIM_CONTENTS="$(sed -n -E 's/^# !bash//p;s/^# {0,1}//p' <<< "$VIM_CONTENTS")"
    sed -n -E '/^#/p' <<< "$VIM_CONTENTS_RAW"
elif [[ "$VIM_CONTENTS" == //\!bash* ]]; then
    VIM_CONTENTS="$(sed -n -E 's/^\/\/!bash//p;s/^\/\/ {0,1}//p' <<< "$VIM_CONTENTS")"
    sed -n -E '/^\/\//p' <<< "$VIM_CONTENTS_RAW"
elif [[ "$VIM_CONTENTS" == //\ !bash* ]]; then
    VIM_CONTENTS="$(sed -n -E 's/^\/\/ !bash//p;s/^\/\/ {0,1}//p' <<< "$VIM_CONTENTS")"
    sed -n -E '/^\/\//p' <<< "$VIM_CONTENTS_RAW"
elif [[ "$VIM_CONTENTS" == /\*!bash* ]]; then
    VIM_CONTENTS="$(sed -n -E 's/^\/\*!bash//p;s/^(\/\*| \*| \*\/)//p' <<< "$VIM_CONTENTS")"
    sed -n -E '/^(\/\*| \*| \*\/)/p' <<< "$VIM_CONTENTS_RAW"
elif [[ "$VIM_CONTENTS" == /\*\ !bash* ]]; then
    VIM_CONTENTS="$(sed -n -E 's/^\/\* !bash//p;s/^(\/\*| \*| \*\/)//p' <<< "$VIM_CONTENTS")"
    sed -n -E '/^(\/\*| \*| \*\/)/p' <<< "$VIM_CONTENTS_RAW"
fi

bash <<< "$VIM_CONTENTS"
