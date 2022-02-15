git config user.name "$USER_NAME"
git config user.email "$USER_EMAIL"

git checkout circleci
git pull origin circleci

find . -maxdepth 1 ! -name '_site' ! -name '.git' ! -name '.gitignore' ! -name '.circleci' -exec rm -rf {} \;
mv _site/* .
rm -R _site/

git add -fA
git commit --allow-empty -m "$(git log source -1 --pretty=%B)"
git push -f origin gh-pages

echo "deployed successfully"