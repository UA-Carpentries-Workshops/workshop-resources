# Resolving Merge Conflicts

This is a continuation of Basic Branching and Merging.

What do you do when your git merge feels like this:

[Git merge on You Tube](https://www.youtube.com/watch?v=AqocDsE_32c)

## Guides and resources

[Resolving merge conflict using the command line](https://help.github.com/articles/resolving-a-merge-conflict-using-the-command-line/)

## Before starting

Make sure you are in the git-workshop folder.

## Merge conflicts

Merge conflicts happen when the changes in one commit will overwrite the changes in another commit. 

Let's try to cause a merge conflict.

## Cause a merge conflict

Open about.md. On the second line put this text and save the file.

```text
HELLO WORKSHOP
```

Now save the changes to the file. Do you remember the process and commands from Basic Git?

(wait for stickies)

Once the changes are committed, switch to the script-updates branch.

Do you remember how to switch branches?

(wait for stickies)

```bash
git checkout script-updates
```

Open about.md. Change the second line to:

```text
HELLO GOODBYE
```

Save the file.

Now save the changes to this file. Do you remember the commands and process?

(wait for stickies)

Once the changes are comitted, switch back to the master branch.

```bash
git checkout master
```

Now try to merge the script-updates branch. Do you remember the command for merge?

(wait for stickeies)

```bash
git merge script-updates
```

What happened?

```text
$ git merge script-updates
Auto-merging about.md
CONFLICT (content): Merge conflict in about.md
Automatic merge failed; fix conflicts and then commit the result.
```

Check the status:

```bash
git status
```

```text
$ git status
On branch master
You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)
```

Git tries to be helpful. Notice the suggestions. 

```text
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)
```

## Aborting the merge

You can abort, or cancel, a merge.

Try it now.

```bash
git merge --abort
```

This wil undo any changes the merge may have caused. This only works when there are merge conflicts.

## Resolving a merge conflict

Let's cause a merge conflict again. Use your up arrow to bring back the merge command and then hit enter again to run it.

```bash
git merge script-updates
```

You should be in a merge conflict. 

How do you check the status? Try it now.

When conflicts happen, git tries its best to find the affected lines and surround them in comments so you can find them in your files and fix them. 

Open about.md.

Do you see the `<<<<<<HEAD`?

```text
<<<<<<< HEAD
HELO WORKSHOP
=======
HELO GOODBYE
>>>>>>> script-updates
```

The section between 

`<<<<<<< HEAD`

and

`=======`

Are the lines from your current branch. In this case `master`.

The lines between

`=======`

and

`>>>>>>> script-updates`

Are the lines from the branch you tried to merge in.

## Command line resolution

Let's say you want to discard the changes from the script-updates branch and keep the master bracnch.

Chekcout the version of the file that is in master like this:

```bash
git checkout --ours about.md
```

Add the file to staging

```bash
git add about.md
```

Commit the changes

```bash
git commit -m 'merge conflict'
```



