# Basic `git` lesson

We will learn and reinforce git commands. We will learn how to:

* Start a git repository
* The importance of a .gitignore file
* Configure git and the git configuration options
* Check for changed files
* See the changes
* See a log of changes
* Stage files whose changes you want to track
* Commit the changes to the git repository
* Push changes to Github for all the world to see

You should be in the `basic-git` folder created during the workshop setup. Use `pwd` to check to make sure you are there.

## First time git setup
[First Time Git Setup Guide](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)

Let's see how git is configured.

```bash
git config
```

This shows us the different options git config has to offer.

Notice we have some config file locations:

```text
Config file location
    --global              use global config file
    --system              use system config file
    --local               use repository config file
```

We are going to work with the `global` configuration.

Let's see what options we have.

```bash
git config --list
```

You should see a bunch of options. We are going to set the user name and email.

```text
user.name=
user.email=
```

Let's set the user name and email. Some of you may have already done this. You can skip this step if you see your desired user name and email in the `git config --list`

```bash
git config --global user.name='My Name Here'
git config --global user.email='myemailhere'
```

Let's check that worked. How do you do that?

```bash
git config --list
```

## git init -- CREATE A NEW GIT REPOSITORY

In this folder we dont see much. We don't have any files or other folders.

Let's initialize (create) a new git repository.

```bash
git init
```

Use `ls -la` to see what this command created.

You should see a `.git` folder. This is the index where all of the file changes will be stored. You can think of it as you git database.

## git status -- What's going on in my git repository

Try it now.

```bash
git status
```

You should see this

```text
On branch master

Initial commit

nothing to commit (create/copy files and use "git add" to track)
```

Notice `On branch master`. `git status` will tell us the name of the branch we are on. We will not cover branching in this lesson, but you can find more [here](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging).

Not much else to see, but that is ok. It's because we have an empty git repository and no files. Let's make some.

```bash
touch script.sh
ls -la
```

```bash
git status
```

```text
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        script.sh

nothing added to commit but untracked files present (use "git add" to track)
```

> Git sees our new file and tries to be helpful. Git suggests that this is a file we might want to track. Thanks git, that is true. I do want to `track changes` to this `new` file.

## git add (stage a file to commit it to the git repository)

To start tracking changes to a file we first need to add it to what git calls `staging`. Don't worry about what this means for now. Let's go through the whole process and later we wil explain what is going on and why we do the staging thing.

> Pro tip: You can use tab complete with git commands.

```bash
git add script.sh
```

```bash
git status
```

```text
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   script.sh
```

git tells us about the new file that is ready to be committed. Let's do that.

## git commit (save changes to the git repository)

`git commit` will save any of the changes in staging to the git repository. 

You might be thinking

> But we didn't change the file, we just created an empty file. If git stages changes what did it do? 

Git now knows two things:

- We are tracking a file named script.sh
- The contents of that file, which in this case is nothing

Try it now.

```bash
git commit -m 'Adding new script file'
```

You should see this.

```text
$ git commit -m 'Adding new script file'
[master (root-commit) 587efe9] Adding new script file
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 script.sh
 ```

Git tries to help us. It tells us

* the number of changed files
* the number of changes
    * the number of new changes added to the files
    * the number of things that were deleted from the file

We don't have much going on, but that's ok. Let's add some stuff to our `script.sh` and see what git does with it.

## Making changes and seeing what is different

Open `script.sh`. You can use nano or any file editor of your choice.

Let's add a line of code to the file. Let's add the bash command that list all files and folders.

```bash
#!/bin/bash

ls -la
```

Save your edits and then run the file.

> Pro tip: tab complete is your best fiend.

```bash
sh script.sh
```

Did you see what you expected to see? Great, that means our script is working.

Let's see what `git` thinks is going on. How do we ask git about the status of our stuff?

```bash
git status
```

```text
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   script.sh

no changes added to commit (use "git add" and/or "git commit -a")
```

Notice that now instead of `new` we see `modified`. Git sees the changes we made to `script.sh`. Thanks `git`!

Let's see what git thinks has changed.

### git diff to see the difference between the current file and the previous version

```bash
git diff script.sh
```

```text
$ git diff script.sh
diff --git a/script.sh b/script.sh
index e69de29..84560e7 100644
--- a/script.sh
+++ b/script.sh
@@ -0,0 +1,2 @@
+#!/bin/bash
+ls -la
```

Notice git tells us there were two new lines added to this file. That's neat!

If you are happy with your changes, you can now stage them for commit. What's the first step? `git status` will remind you. Let's do that again.

```bash
git status
```

```text
no changes added to commit (use "git add" and/or "git commit -a")
```

Git tells us what we need to know: 

```text
use "git add" and/or "git commit -a"
```

Let's do `git add`.

```bash
git add script.sh
```

What does git think is going on? Let's find out.

```bash
git status
```

```text
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   script.sh
```

Notice

* Changes to be committed
* modified: script.sh

Ok that makes sense.

Now let's commit the changes.

```bash
git commit -m 'Added command to list files'
```

Do you see what you expected to see?

```text
[master 958615c] added command to list files
 1 file changed, 2 insertions(+)
 ```

Notice

* 2 insertions

That makes sense because of what we saw with `git diff`. We had two `new` lines in the file.

## Review

We went through a lot of steps. It might all seems like a blur, but we will repeat all of this and build on it as we go along. Let's take a bit to review what we just did:

* We configured the git username and email with `git config`
* We created a new repository with `git init`
* We use `git status` to get some information about our repository
  * Does git see changes to our files?
  * Does git see new files?
  * What files are in staging? 
* We created an empty file and added it to the git repository
  * We used `git add` to add it to the staging area
  * We used `git commit -m 'commit message' to save the changes to the git repository
* We edited our file and used `git diff` to see what changed.
* We added the modified file to staging with `git add`
* We saved those changes to the repository with `git commit -m 'commit message'

> Let's take a break. Take a few minutes to stretch. Put your questions or comments in the etherpad and we will talk about some of them after the break.