vim autoload & auto rebuild cscope database
================================
1, 自动搜索cscope.out文件, 并且载入到vim中;
2, 重定义w命令, 写入文件后重建cscope database;

暂时只完成这两个功能, 但基本已经够用了. 

Install:
make && make install

zhangxiwen@qiyi.com
