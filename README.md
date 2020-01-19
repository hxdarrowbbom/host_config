# 密钥
服务器用户的auth\_key存储公钥, 注意阿里云不能有注释

# 新建用户
```shell
groupadd -r hxdarrow
useradd -m -g hxdarrow -s /bin/bash hxdarrow
usermod -a -G admin
# bash的颜色可能不对
```
# 设置sshd
修改`/etc/ssh/ssh_config`,添加`AllowUsers hxdarrow`,再进行`service sshd restart`
打开sftp需要修改`/etc/ssh/sshd_config`,将Subsystem sftp行末改成internal-sftp

# 一些git仓库
https://github.com/vim/vim.git
> 需要提前安装：libncurses5-dev python-dev python3-dev
> ./configure --with-features=huge --enable-multibyte --enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86\_64-linux-gnu/ --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config-x86\_64-linux-gnu/ --enable-cscope --prefix=$HOME/install
> make VIMRUNTIMEDIR=$HOME/install/share/vim/vim82
> make install

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


# git push无密码
1. 设置公钥以后，可以使用ssh协议clone远程仓库，这样就可以免密码了
	git clone ssh://git@github.com/yourusername/yourrepositoryname.git
2. 如果已经用https协议clone到本地，就重新设置远程仓库
	git remote set-url origin git@github.com:yourusername/yourrepositoryname.git, 下次试试前面加ssh可不可以

