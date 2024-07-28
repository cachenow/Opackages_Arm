#!/bin/bash

# 读取保留包的列表
keep_list=$(cat keep.txt)

# 遍历app目录下的所有文件夹
for dir in ./app/*/; do
    # 获取当前文件夹的名称
    dir_name=$(basename "$dir")
    
    # 检查当前文件夹是否在保留列表中
    if ! grep -q "^$dir_name$" <<< "$keep_list"; then
        # 如果不在保留列表中，删除文件夹
        rm -rf "$dir"
        echo "Deleted: $dir"
    else
        echo "Kept: $dir"
    fi
done
