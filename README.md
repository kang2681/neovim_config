# neovim_config

## 安装说明
### telescope 依赖 ripgrep、fd-find
> :checkhealth telescope
```
sudo apt-get install ripgrep
sudo apt install fd-find
```

## 快捷键
> 按键说明
> <X-y> 表示这是一个按键组合 X是功能键   y就是相应按键本身
> C表示Ctrl键, A表示Alt键, S表示Shift键
> <CR> 回车

### 分屏

|模式|按键|替换|功能|
|-|-|-|-|
|normal|`sv`|`:vsp<CR>`|左右分屏|
|normal|`sh`|`:sp<CR>`|上下分屏|
|normal|`sc`|`<C-w>c`|关闭当前|
|normal|`so`|`<C-w>o`|关闭其他|
|normal|`<C-h>`|`<C-w>h`|向左窗口跳转|
|normal|`<C-j>`|`<C-w>j`|向下窗口跳转|
|normal|`<C-k>`|`<C-w>k`|向上窗口跳转|
|normal|`<C-l>`|`<C-w>l`|向右窗口跳转|
|normal|`s=`|`<C-w>=`|窗口相等比例|
|normal|`<C-Left>`|`:vertical resize +2<CR>`|窗口向左+2|
|normal|`<C-Right>`|`:vertical resize -2<CR>`|窗口向右+2|
|normal|`<C-Down>`|`:resize -2<CR>`|向右窗口跳转|
|normal|`<C-Up>`|`:resize +2<CR>`|向右窗口跳转|
|terminal|`<Esc>`|`<C-\\><C-n>`|terminal 模式回到Normal模式|
|terminal|`<C-h>`|`<C-\><C-N><C-w>h`|向左窗口跳转|
|terminal|`<C-j>`|`<C-\><C-N><C-w>j`|向下窗口跳转|
|terminal|`<C-k>`|`<C-\><C-N><C-w>k`|向上窗口跳转|
|terminal|`<C-l>`|`<C-\><C-N><C-w>l`|向右窗口跳转|
|visual|`<`|`<gv`|缩进|
|visual|`>`|`>gv`|反向缩进|
|visual|`J`|`:move '>+1<CR>gv-gv`|选中下移|
|visual|`K`|`:move '<-2<CR>gv-gv`|选中上移|
|normal|`<A-m>`|`:NvimTreeToggle<CR>`|开启或关闭nvim-tree|
|nvimtree|`o`,`<CR>`|`edit`|打开文件或文件夹|
|nvimtree|`v`|`vsplit`|分屏打开文件|
|nvimtree|``|``||
||``|``||
||``|``||
||``|``||
||``|``||
||``|``||
||``|``||
||``|``||
||``|``||
||``|``||

## 问题解决

1. 剪贴板问题
> clipboard: provider is not available 
> 
> yy无法复制到系统的剪贴板上
> 
> wsl ubuntu20.04

```
sudo apt-get install xclip
```

### lsp command

:LspInstallInfo - opens a graphical overview of your language servers
:LspInstall [--sync] [server] ... - installs/reinstalls language servers. Runs in a blocking fashion if the --sync argument is passed (only recommended for scripting purposes).
:LspUninstall [--sync] <server> ... - uninstalls language servers. Runs in a blocking fashion if the --sync argument is passed (only recommended for scripting purposes).
:LspUninstallAll [--no-confirm] - uninstalls all language servers
:LspInstallLog - opens the log file in a new tab window
:LspPrintInstalled - prints all installed language servers


# VIM 操作

- 打开文件
   ```
   vim  test.log
   ```
   如果已经打开了vim使用如下命令加载一个文件
   ```
   :e test.lua 
   ```
   ```
   :w   表示写（write）的意思
   :w xxx.lua 另存为新文件xxx.lua
   :q 表示退出 （quit）的意思
   :wq 保存退出
   :q! 强制退出(可能导致修改没有保存)  感叹号表示强制执行
   :e  表示 :edit
   :w  表示 :write
   :q  表示 :quit
   ```
