# dotfiles-manager
定位
一个轻量、跨平台、无依赖的终端与开发环境一键部署工具。
自动备份 / 恢复 zsh/fish、vim/nvim、git、npm/pip、IDE 配置、常用软件，换电脑 5 分钟恢复完整工作环境。
核心功能（小而精）
一键备份所有配置文件到 Git 仓库
一键恢复到新机器
自动识别 macOS / Linux
支持 zsh/fish/bash 配置同步
自动安装常用工具（git、curl、tree、htop、zsh-syntax-highlighting 等）
自动设置软链接，不破坏原有配置
纯 shell 脚本，无需 Python/Node 环境
安全：自动备份旧配置，可回滚
