#!/bin/bash

# 读取保留包的列表并处理换行符
keep_list=$(cat ./keep.txt | tr '\n' ' ')

# 遍历app目录下的所有文件夹
for dir in ./app/*; do
    # 确保只处理目录
    if [ -d "$dir" ]; then
        # 获取当前文件夹的名称
        dir_name=$(basename "$dir")
        
        # 检查当前文件夹是否在保留列表中
        if [[ ! " $keep_list " =~ " $dir_name " ]]; then
            # 如果不在保留列表中，删除文件夹
            rm -rf "$dir"
            echo "Deleted: $dir"
        else
            echo "Kept: $dir"
        fi
    fi
done
