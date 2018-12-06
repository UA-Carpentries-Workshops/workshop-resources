# Basic `git` lesson

![git er done](https://afchurch.files.wordpress.com/2015/07/get-er-done-300x300.jpg)

## Topics Covered

* `git init` - Start a git repository
* `git config` - Configure git and the git configuration options
* `git status` - Check for changed files
* `git diff` - See the differences
* `git log` - See a log of changes
* `git add` - Stage files whose changes you want to track
* `git commit -m 'message'` - Commit the changes to the git repository

## Guides and resources

[JessiTron: Git Happens (an in-depth look at how Git works)](https://www.youtube.com/watch?v=Dv8I_kfrFWw)

[First Time Git Setup Guide](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)

[So WTF is git?](https://codeburst.io/so-wtf-is-git-fa7daa0e0271)

## Terminology

`repository` -- this is what we call the thing that tracks changes to our files. You might think of it like a database, an invoice, or a receipt of every change you have ever saved.

`repo` -- short for repository.

`commit` --  this can be a verb or a noun. To commit means to save the state of all of your files in the repository.

_I committed the changes to the repository._

_The last commit introduced a bug in the program._

`changeset` -- is a set of changes which should be treated as an indivisible group. 

`index` -- this is a list of all commits.

`staging` -- bundling files together to save their state to the repo.

## Before we start

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

## git add (stage file to get them ready to commit them to the repo)

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

> But we didn't change the file. We just created an empty file. If git stages changes what did it do?

Git now knows two things:

- We are going to store the file script.sh in the repository
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

Let's add a line of code to the file. Let's add the bash command that lists all files and folders.

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

### git diff (to see the difference between the current file and the previous version)

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

Git tells us what we need to do: 

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

> Pro tip: Git tries to help you sometimes with output messages that give you advice. Notice `use "git reset HEAD file..." to unstage)`. You can use `git reset` to undo adding a file to staging.

Now let's commit the file.

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

## Review 1

We went through a lot of steps. It might all seem like a blur, but we will repeat most of this and build on it as we go along. Let's take a moment to review what we just did:

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
* We saved those changes to the repository with `git commit -m 'commit message'`

> Let's take a break. Take a few minutes to stretch. Put your questions or comments in the `etherpad` and we will talk about some of them after the break.

![Things are getting serious](https://thinkr.fr/wp-content/uploads/github-meme.png)

## Why `git add`? Why staging?

Staging lets us do these thing:

* Bundle files and related changes together into one commit
* Commit only those changes we are ready to commit
* Commit changes to more than one file at a time

## Creating a new repository when you already have a bunch of files

I bet some of you already have a project going, with lots of files, and you are wondering if you have to have an empty folder in order to create a new git repository.

> How do we create a new git repository if we already started working on a project?

Don't worry, you can `git init` at any point.

> IMPORTANT: git will only track files in the folder where the `.git` repository is and and files inside of that folder. So if your project is not contained under one folder, you should move all of the files you need to track to go under one folder or you will need to have multiple git repositories.

Let's try creating a git repository in a folder with lots of files already in it.

Use change directory to go up one folder level.

```bash
cd ..
```

Let's create a new folder.

```bash
mkdir git-workshop
```

```bash
cd git-workshop
```

Let's see what git thinks is going in here? Can you guess what `git status` will do?

```bash
git status
```

```text
fatal: Not a git repository (or any of the parent directories): .git
```

Good because we haven't done the command that creates a new git repository. Do you remember what that command was? Put it in the Etherpad.

(check the etherpad)

Let's create three files.

```bash
touch script.sh
touch code.py
touch about.md
```

Let's add some stuff to each file.

Open `script.sh` in your favorite editor.

Put this in the file and save it.

```text
#!/bin/bash

ls -la
```

Run the file.

```bash
sh script.sh
```

Did it work? If it didn't try to get it working or ask a helper for help.

Let's add some stuff to `code.py`.

Open `code.py` and add this text and then save it.

```python
# I might put some python code in here some day. But for now it is just a comment.
```

Open `about.md` and add this bit of `markdown`.

```text
# About Me
```

You should have three files now. Let's try to create a new git repository.

```bash
git init
```

What happened?

```text
Initialized empty Git repository in C:/Users/Marnee/Dropbox/github/ua-carpenties-workshops/git-workshop/.git/
```

We got the same output as when we have an empty folder.

```bash
ls -la
```

Did you see your `.git` folder? That's your new repository.

What does `git` think is happening now?

```bash
git status
```

What do you expect to see? Put your thoughts in the Etherpad.

> Will git see our files?

```text
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        about.md
        code.py
        script.sh

nothing added to commit but untracked files present (use "git add" to track)
```

Git sees the files. Great!

I think our script file is ready to commit, but I don't want to commit code or about just yet. Let's go through the process to commit `script.sh`.

What is the first step? Try it yourselves. Green stickies if it worked the way you think it should.

(wait for the stickies)

What should you do next? Let's see if git has our file in the staging area. What command do I use? Try it yourselves.

(wait for the stickies)

Let's see what git thinks has changed. What command do I use to see the difference between the current state of a file and the previous state? What do you expect to happen? Put your thoughts in the Etherpad.

Try it yourselves.

(wait for stickies)

On to the final step.

We have added our file to staging. How do we finally commit the changes to the git repository?

Try it yourselves.

(wait for the stickies)

How did this go? Are you remembering the commands and the order in which they should happen? Don't worry if you didn't get it. We will be doing this again.

### git diff and git status are not required

I had you do `git diff` and `git status` but these commands are not required to save changes to a git repository. You should use them often though because they help you see what is happening. This will help prevent mistakes.

## Review 2

What are the required steps to get your changes into the git repository?

1. Make changes to a file or files
2. `git add` to add your changed files to the staging
3. `git commit -m 'commit message'` to save your changes to the git repository

Let's take a bit of a break. Let's see what questions we have in the Etherpad.

## Do it yourselves

Let's commit the changes to `code.py`.

When you are done with `code.py` commit the changes to `about.md`.

**Try it yourselves. Try it with the optional commands, too.**

![YOU CAN DO IT](https://sayingimages.com/wp-content/uploads/you-can-do-it-if-you-do-it-meme.jpg)

Green stickies when you are done.

(wait for the stickies. check the etherpad for comments)

How did that go? Any questions or comments? Feel free to ask them out loud.

Are you feeling more confident with `git`? Don't worry if you are not. We are going to do it all ... again!

## git log (see what commits have happened)

Git can give you a list of all of the commits that happened in your repository. Let's look at them.

```bash
git log
```

```text
Author: Marnee Dearman <marnee.dearman@gmail.com>
Date:   Sat Dec 1 16:49:36 2018 -0700

    My concise but precise commit message
```

Notice

* we see who was responsible
* we see the date and time
* we see the commit message

Nice! This is helpful for finding out what happened to our files.

## Commit messages

Let's talk about commit messages. There are good commit messages and bad commit messages.

A good message helps us understand `why` the changes were made.

* descriptive
* concise
* precise

This is easier said than done, but with some experience you will learn how to make good commit messages. This is especially important if you are collaborating with others. Be kind to them, and your future self, and make useful commit messages.

A bad message might look like this:

* commit 1 
* changed the file
* This thing was broken and now it isnt
* **YOLO!!**

![DO IT AGAIN](https://funnypictures.me/wp-content/uploads/2012/10/funny-pictures-felix-baumgartner-space-jump-that-was-fun-meme.jpg)