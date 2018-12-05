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

## Did you know that your git repository is actually a tree?

It sure is.

![git is a tree](https://www.drupal.org/files/repositorydiagram.png)

## Branching

### What is a branch?

Remember the commit log. Think of that log like a tree. You start with a trunk. Each commit added to the trunk, builds the tree. A git branch is like a branch on tree. The commits to that branch don't build the trunk, they are separate.

### Why should I branch?

Branching is good for when you want to make a bunch of changes but don't want them affect the `master` branch.

#### Some examples

* You want to experiment with your code but you don't want to mess up what you have already done. If you experiments go well, you might want to apply those changes to the trunk.
* You want to fix a bug but you don't want to mess up what you have already done. If the bug gets fixed, you will want to apply those changes to the trunk.
* You are collaborating with other programmers in your lab. Each of you is working on a new feature or part of the program. You can use branches to isolate those changes and then merge them together into the trunk.

## Get ready

Make sure you are in the `git-worksop` folder we setup in Basic Git.

## git branch

Let's see if we have any branches.

```bash
git branch
```

This will list all of the branches in our local git respoitory.

What did you see?

```text
* master
```

The start indicates the branch you are currently on.

## git checkout -b (create a new branch)

We want to make some enhancements to our script but we don't want to mess up the trunk just yet. Let's create a new branch to make those changes.

```bash
git checkout -b script-updates
```

`checkout -b` means create a new branch and checkout that branch. The new branch name is the last argument in the command. 

What branches do we have now?

```bash
git branch
```

What did you see?

```text
  master
* script-updates
```

Open script.sh and let's make some changes. Add this line to script.sh.

```text
git branch
```

How do we find out if git sees our changes?

```bash
git status
```

```text
On branch script-updates
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   script.sh
```

How do we save the changes to the repository?

(wait for stickies)

How do we check the log?

(wait for stickies)

We now have a new branch with changes that are not present in the trunk of our repoistories. What branch is the trunk?

```bash
git branch
```

`master`

## git checkout

Let's go back to the master branch. We switch branches with 

```bash
git checkout nameofbranch
```

```bash
git checkout master
```

What happened?

* git switched itself to the `master` branch
* script.sh changed. It doesn't have the line we added to it. git changed it to match the state of the file in the `master` branch.

Let's see the contents of script.sh. Do you remember the command line to show the contents of a file?

> Pro tip: tab complete is forever in your favor

```bash
cat script.sh
```

How do we get the changes in `script-updates` into master? 

## git merge

With `git merge` we can appply all of the changes in one branch on another branch. Git will try to zip together all of the commits. Let's try that with script-updates and master.

First let's check what branch we are on using git status.

```bash
git status
```

Now do the merge.

```bash
git merge script-updates
```

git will merge the branch named in the command with the branch you are currently on.

> Pro tip: Be careful when you branch. Make sure you are on the branch you want. Use `git status` to check before doing a merge.

```text
Updating 3e31d59..92ee033
Fast-forward
 script.sh | 1 +
 1 file changed, 1 insertion(+)
```

Something happened! Let's look at the content of script.sh now.

```bash
cat script.sh
```

Do you see the lin you added?

(wait for stickies)

## Review 1

![winter is comming](https://d3suqxyr95ccqd.cloudfront.net/sites/default/files/styles/image_600_width/public/secondary_images/images_and_text/gitflow-no-commit-to-master.jpg?itok=ucTkD0WY)

Git is like a tree and we can create branches and zip them together.

`master` is like the trunk of our tree. And like all trees, the trunk is the most important part so we need to be careful about making changes to it. With branching we can make all the changes we want without harming the trunk.

We used `git branch` to see a list of branches and what branch we are on.

We used `git checkout -b` to create a new branch to do some work. This left our master branch alone.

We used `git merge` to zip together two branches. This applied all of the changes in one branch on another branch (master)
