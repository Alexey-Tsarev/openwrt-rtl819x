#!/usr/bin/env bash

if [ -z "${1}" ] || [ -z "${2}" ] || [ -z "${3}" ]; then
    echo USAGE
    exit 1
fi

files_list_file="${1}" # find package/ -type f -name Makefile -print > files_list.txt
commits_list_file="${2}" # git log --pretty=oneline | awk '{print $1}' > commits_list.txt
search_dir="${3}" # ../rtk_openwrtSDK_v2.5_20160905/rtk_openwrt_sdk
report_file=equals_per_commit.txt

if [ -f "${files_list_file}" ]; then
    files_list="$(cat "${files_list_file}")"
else
    echo "No file: ${files_list_file}"
    exit 1
fi

if [ -f "${commits_list_file}" ]; then
    commits_list="$(cat "${commits_list_file}")"
else
    echo "No file: ${commits_list_file}"
    exit 1
fi

if [ ! -d "${search_dir}" ]; then
    echo "Not a directory: ${search_dir}"
    exit 1
fi


for commit in ${commits_list}; do
    echo " => Current commit: $commit"
    git checkout "${commit}"

    if [ $? -ne 0 ]; then
        echo "git checkout failed"
        exit 1
    fi

    equals=0

    for file in ${files_list}; do
        if [ -f "${file}" ]; then
            file2="${search_dir}/${file}"

            if [ -f "${file2}" ]; then
                echo "file1: ${file}"
                echo "file2: ${file2}"

                diff "${file}" "${file2}"

                if [ $? -eq 0 ]; then
                    ((equals++))
                    echo "equal"
                else
                    echo "not equal"
                fi

                echo
            fi
        fi
    done

    echo "${equals} ${commit}" >> "${report_file}"
done
