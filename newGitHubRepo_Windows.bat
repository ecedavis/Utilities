

set reponame=%1

IF "%reponame%" == "" (
	set /p reponame=Enter Github Repository Name: 
)

set /p username=Enter Github User Name:

mkdir %reponame%
cd %reponame%
curl -u %username% https://api.github.com/user/repos -d "{\"name\":\"%reponame%\"}"
git init
echo "ADD README CONTENT" > README.md
git add README.md
git commit -m "Initial Commit, added readme template"
git remote add origin git@github.com:%username%/%reponame%.git
git push -u origin master