# fish

个人自用Fish shell 配置文件，主要使用Arch Linux 和 Umbundu 两个系统。

# 需求
- [ ] 1. fish shell
- [ ] 2. starship

# 主题
使用starship 

# 使用
    # Ubuntu 添加软件源使用最新的fish shell
    sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt update
    sudo apt install fish

    # 配置用户使用
    chsh -S `which fish`

    # 安装 starship 
    curl -sS https://starship.rs/install.sh | sh

# 版本
1. fish shell 3.7.1
