# Basic branching and merging

## Topics Covered

* The `master` branch
* `git checkout -b` -- creating a new branch
* `git checkout` -- switching to a branch
* `git merge` -- merge the changes of two branches
* `git branch` -- list branches
* When to use branching
* When to merge
* Some common branching and merging patterns
* How Git stops you from overwriting your changes
  * `git stash`

## Guides

[Git Checkout](https://www.atlassian.com/git/tutorials/using-branches/git-checkout)

[Git Merge](https://www.atlassian.com/git/tutorials/using-branches/git-merge)

[Merge Conflicts](https://www.atlassian.com/git/tutorials/using-branches/git-merge)

[When do merge conflicts happen?](https://help.github.com/articles/about-merge-conflicts/)

## Terminology

`HEAD` - the last commit made in a branch

`master branch` or `trunk` - this is commonly used as the main line of state in your repository. In programming this is often the production code. If you were writing your thesis, this could end up being your final version.

`branch`- remember the commit log? Think of that log like a tree. You start with a trunk. Each commit added to the trunk builds the tree. A Git branch is like a branch on a tree. The commits to that branch don't build the trunk, they are separate.

`checkout` - switch to a different branch. Can also be used to create a new branch.

`merge` - Git will try to smash the state of all files in in one commit with the state of the files in another commit.

`history` or `commit history` - a list of all commits made to a branch.

`conflict` - when a merge will change the same lines in files. Git doesn't know how to change the files and so a human has to do it.

`fast-forward` - if the head of the branch you are merging into is a direct ancestor of the branch you are merging.

`merge commit` - a commit that contains the results of a merge when Git could not do a fast-forward merge.

## Did you know that your Git repository is actually a tree?

Look how nice.

![Git is a tree](https://www.drupal.org/files/repositorydiagram.png)

## Branching

### What is a branch?

Remember the commit log. Think of that log like a tree. You start with a trunk. Each commit added to the trunk builds the tree. A Git branch is like a branch on that tree. The commits to that branch don't build the trunk, they are separate - until you merge.

### Why should I branch?

Branching is good for when you want to make a bunch of changes but don't want them affect the `master` branch, or trunk.

#### Some examples

* You want to experiment with your code but you don't want to mess up what you have already done. If you experiments go well, you might want to apply those changes to the trunk.
* You want to fix a bug but you don't want to mess up what you have already done. If the bug gets fixed, you will want to apply those changes to the trunk.
* You are collaborating with other programmers in your lab. Each of you is working on a new feature or part of the program. You can use branches to isolate those changes and then merge them together into the trunk.

## Get ready

Make sure you are in the `git-workshop` folder we setup in Basic Git.

## git branch

Let's see if we have any branches.

```bash
git branch
```

This will list all of the branches in our local Git repository.

What did you see?

```text
* master
```

The star indicates the branch you are currently on.

## git checkout -b (create a new branch)

We want to make some enhancements to our script but we don't want to mess up the trunk just yet.

This is the command to create a new branch.

```bash
git checkout -b new-branch-name
```

Let's create a new branch to make those changes.

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

How do we find out if Git sees our changes?

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

We now have a new branch with changes that are not present in the trunk of our repositories. What branch is the trunk?

```bash
git branch
```

`master`

## git checkout

Let's go back to the `master` branch. We switch branches with 

```bash
git checkout name-of-branch
```

```bash
git checkout master
```

What happened?

* Git switched itself to the `master` branch
* script.sh changed. It doesn't have the line we added to it. Git changed it to match the state of the file in the `master` branch.

Let's see the contents of script.sh. Do you remember the command to show the contents of a file?

> Pro tip: tab complete is forever in your favor

```bash
cat script.sh
```

How do we get the changes in `script-updates` into master?

## git merge

With `git merge`, Git will try to smash the state of all files in one commit with the state of the files in another commit.

In terms of branches it will try to smash the state of the HEAD of one branch with the state of the HEAD in another branch.

Let's try that with script-updates and master.

First let's check what branch we are on using `git status`.

```bash
git status
```

Now do the merge.

```bash
git merge script-updates
```

Git will merge the branch named in the command with the branch you are currently on.

> Pro tip: Be careful when you merge. Make sure you are on the branch you want. Use `git status` to check before doing a merge.

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

Do you see the line you added?

(wait for stickies)

## Review 1

![winter is coming](https://d3suqxyr95ccqd.cloudfront.net/sites/default/files/styles/image_600_width/public/secondary_images/images_and_text/gitflow-no-commit-to-master.jpg?itok=ucTkD0WY)

Git is like a tree and we can create branches and merge them together.

`master` is like the trunk of our tree. And like all trees, the trunk is the most important part so we need to be careful about making changes to it. With branching we can make all the changes we want without harming the trunk.

We used `git branch` to see a list of branches and what branch we are on.

We used `git checkout -b` to create a new branch to do some work. This left our master branch alone.

We used `git checkout` to switch branches.

We used `git merge` to merge together two branches.

## Why don't we _simply commit into master_?

You can! There is nothing wrong with working in master all the time, especially if you are working on your own. Whether or not you use branching and merging is up to you. The more collaborators you have, though, the more you will want to consider a branching and merging strategy.

Most software developers use branching and merging. But there are some large organizations that only work in master. Come to a Research Bazaar meetup and I can tell you all about it ... .

## Git keeps you from overwriting your files

Remember how switching branches changes your files to match the state of the files in the branch?

Did this make you a little nervous? It shouldn't. Git won't let you loose your work.

Let's make changes to about.md. Open it and add some stuff to it.

Now try to switch to the script-updates branch. Just switch, don't create a new branch. Do you remember the command?

(wait for stickies)

```bash
git checkout script-updates
```

What happened?

```text
$ git checkout script-updates                                                      
error: Your local changes to the following files would be overwritten by checkout: 
        about.md                                                                   
Please commit your changes or stash them before you switch branches.               
Aborting                                                                           
```

Git won't let you loose your work! Thanks Git.

OK, so what if you need to switch branches but you have work in progress on the current one? There is a command for that. Notice in the Git message:

```text
Please commit your changes or stash them before you switch branches.
```

We know how to commit, but what about stash?

```bash
git stash
```

This will save your changes to a special part of the repo called the stash. You can then reapply them later with

```bash
git apply
```

![git stash](https://memegenerator.net/img/instances/41106103/git-stash-so-much-win.jpg)