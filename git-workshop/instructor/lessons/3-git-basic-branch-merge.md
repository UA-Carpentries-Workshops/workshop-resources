# Basic branching and merging

## Topics Covered

* The `master` branch
* `git checkout -b` -- creating a new branch
* `git checkout` -- switching to a branch
* `git merge` -- merge the changes of two branches
* `git branch` -- list branches
* When to use branching
* When to merge
* Dealing with merge conflicts (when changes overwrite each other)
* Some common branching and merging patterns
* How git stops you from overwriting your changes

## Guides

[Git Checkout](https://www.atlassian.com/git/tutorials/using-branches/git-checkout)

[Git Merge](https://www.atlassian.com/git/tutorials/using-branches/git-merge)

[Merge Conflicts](https://www.atlassian.com/git/tutorials/using-branches/git-merge)

[When do merge conflicts happen?](https://help.github.com/articles/about-merge-conflicts/)

## Terminology

`master branch` or `trunk` - this is commonly used as the main line of changes in your repository. In programming this is often the production code. If you were writing your thesis, this could end up being your final version.

`branch`- remember the commit log? Think of that log like a tree. You start with a trunk. Each commit added to the trunk, builds the tree. A git branch is like a branch on a tree. The commits to that branch don't build the trunk, they are separate.

`checkout` - switch to a different branch. Can also be used to create a new branch.

`merge` - zip together the commits from one branch with another branch.

`history` or `commit history` - a list of all commits made to a branch.

`conflict` - when two or more commits will change the same line, or lines, of code.

`fast-forward` - what happens when a merge has no conflicts. All commits are zipped together and are now a part of the commit history.

`merge commit` git tries to zip commits together. sometimes the teeth queeze together and this causes a conflict. In this case, once the conflicts are resolved, you will create a merge commit, which includes all of the changes from all commits in the merge.


## Branching

### What is a branch?

Remember the commit log. Think of that log like a tree. You start with a trunk. Each commit added to the trunk, builds the tree. A git branch is like a branch on tree. The commits to that branch don't build the trunk, they are separate.

### Why should I branch?

Branching is good for when you want to make a bunch of changes but don't want them affect the `master` branch.

#### Some examples

* You want to experiment with your code but you don't want to mess up what you have alread done. If you experiments go well, you might want to apply those changes to the main line of code.
* You want to fix a bug but you don't want to mess up what you have already done. If the bug gets fixed, you will want to apply those changes to the trunk.
* You are collaborating with other programmers in your lab. Each of you is working on a new feature or part of the program. You can use branches to isolate those changes and then merge them together into the trunk.

Let's try some branching. Make sure you are in the `git-workshop` folder.

### Scenario


