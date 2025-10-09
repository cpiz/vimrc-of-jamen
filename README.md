# jamen的vim配置文件

为方便在多台服务器同步个人vim习惯而提炼此项目，将配置托管在云端，在终端上可通过命令快速部署。

因非重度使用vim，本配置不依赖任何vim插件，只做基本习惯配置。

## 部署方法

```bash
VIMRC_FILE="~/.vimrc"
INSTALL_DIR="~/.vimrc-of-jamen"
CUSTOM_VIMRC="$INSTALL_DIR/vimrc"
SOURCE_LINE="source $CUSTOM_VIMRC"

# 安装或更新脚本
if [ ! -d "$INSTALL_DIR" ]; then
    # 第一次安装
    git clone https://gitee.com/cpiz/vimrc-of-jamen.git "$INSTALL_DIR"
else
    # 目录已存在，进行更新
    git -C "$INSTALL_DIR" pull
fi

# 3. 检查 ~/.vimrc 中是否已包含引用
# 使用 grep -q 进行静默查找，找到则 $? 为 0，未找到则为 1
# 使用 grep -F 按固定字符串查找，避免特殊字符被解析为正则
if grep -qF "$SOURCE_LINE" "$VIMRC_FILE"; then
    echo "检测到 $VIMRC_FILE 中已引用 $CUSTOM_VIMRC，无需任何操作。"
else
    echo "在 $VIMRC_FILE 中未找到引用，正在添加..."
    # 使用 >> 将引用语句追加到文件末尾
    echo "$SOURCE_LINE" >> "$VIMRC_FILE"
    echo "成功添加引用到 $VIMRC_FILE。"
    echo "请重启 Vim 或执行 ':source $VIMRC_FILE' 使配置生效。"
fi
```
