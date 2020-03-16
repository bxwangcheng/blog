@echo off
E:
cd E:/OneDrive/workspace/blog/
git add source/.
git add themes/.
git add scaffolds/.
git add _config.yml
git commit -m "add new post"
git push
