#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_opml() {
  git checkout -b ${TRAVIS_PULL_REQUEST_BRANCH}
  git add . *.opml
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

git_push() {
  git remote add origin https://${GH_TOKEN}@github.com/ksashikumar/engineering-blogs.git > /dev/null 2>&1
  git push --quiet --set-upstream origin ${TRAVIS_PULL_REQUEST_BRANCH}
}

setup_git
commit_opml
git_push