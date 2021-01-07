# 绑定远程仓库

## 本地初始化空仓库

```bash
git init
# 新建并切换到main分支
git branch -M main
# 将本地仓库与远程仓库绑定，并将远程仓库命名为origin
git remote add origin git@github.com:chengBlock/note.git
# 推送当前分支更新内容到origin仓库的main分支
#-u为默认绑定当前分支main到远程分支origin/main
git push -u origin main
```

## 绑定已经存在的本地仓库

```bash
git remote add origin git@github.com:chengBlock/note.git
git branch -M main
git push -u origin main
```



remote：
1.查看当前是否有远程仓库
git remote
列出每个远程库的简短名字
git remote -v (-v是--verbose的简写)
显示对应的克隆地址

2.添加远程仓库
git remote add [shortname] [url]
添加一个新的远程仓库，可以指定一个简单的名字，以便来引用

3.git fetch 和git pull的区别
git fetch是将远程主机的最新内容拉到本地，用户检查了以后决定是否合并到工作本机分支中；
git pull是将远程主机的最新内容拉下来后直接合并，即git pull = git fetch + git merge。这样会产生冲突，需要手动解决。
（fetch的中文意思为“取来”）

4.git restore
restore意思为恢复，staged为以暂存

5.分支
git branch 查看本地所有分支

-d 删除本地分支
-r 查看远程所有分支
-d -r 删除远程分支，删除后还需要推送到服务器
-f 强制
-M and -D = -m -f  and -d -f
git push origin:<branchname> 删除后推送到服务器
-a 查看本地和远程的所有分支
git branch <branchname> 新建分支
git branch -m <oldbranch> <newbranch> 重命名本地分支
/**
*重命名远程分支：
*1、删除远程待修改分支
*2、push本地新分支到远程服务器
*/
git push origin <branch> 本地仓库与远程仓库绑定

新建或切换到给定分支
git checkout master 选择or切换到master分支
git merge dev 将dev分支合并当前分支
git push -u origin master//将本地更改全部推送到远程master分支

* The current branch master has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin master
将本地branch与远程branch建立绑定关系