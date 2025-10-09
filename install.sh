#!/bin/bash

VIMRC_FILE="$HOME/.vimrc"
INSTALL_DIR="$HOME/.vimrc-of-jamen"
CUSTOM_VIMRC="~/.vimrc-of-jamen/vimrc"
SOURCE_LINE="source $CUSTOM_VIMRC"

# 安装或更新脚本
echo "开始安装或更新 jamen 的 vim 配置..."
if [ ! -d "$INSTALL_DIR" ]; then
    # 第一次安装
    echo "检测到 $INSTALL_DIR 不存在，正在克隆配置仓库..."
    git clone https://gitee.com/cpiz/vimrc-of-jamen.git "$INSTALL_DIR"
else
    # 目录已存在，进行更新
    echo "$INSTALL_DIR 已存在，正在更新配置仓库..."
    git -C "$INSTALL_DIR" pull
fi

# 3. 检查 $HOME/.vimrc 中是否已包含引用
# 使用 grep -q 进行静默查找，找到则 $? 为 0，未找到则为 1
# 使用 grep -F 按固定字符串查找，避免特殊字符被解析为正则
echo "正在检查 $VIMRC_FILE 中是否已包含对 $CUSTOM_VIMRC 的引用..."
if grep -qF "$SOURCE_LINE" "$VIMRC_FILE"; then
    echo "检测到 $VIMRC_FILE 中已引用 $CUSTOM_VIMRC ，无需任何操作。"
else
    echo "在 $VIMRC_FILE 中未找到引用，正在添加..."
    # 使用 >> 将引用语句追加到文件末尾
    echo "$SOURCE_LINE" >> "$VIMRC_FILE"
    echo "成功添加引用到 $VIMRC_FILE ，安装完毕！"
fi
