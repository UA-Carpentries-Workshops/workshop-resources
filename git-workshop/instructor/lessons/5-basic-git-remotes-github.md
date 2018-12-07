# Basic git collaboration, remotes, and GitHub

How to share and collaborate on projects using git and Github.

## Topics covered

* Setting up a Github repository
* Remotes and `origin`
* `git remote` - List remote repositories, link to a remote repository
* `git fetch` - Get references to all the stuff in the remote repository including commits and branches.
* `git push` - Pushing to a remote repository
* Forking repositories
* `git clone` - Cloning an existing Github repository
* `git pull` - Pulling from a remote repository
* Github pull requests
* The importance of a good README file
* Licenses
* Setting up a Github organization

## Guides and resources

## Git vs Github

> GitHub is not required to use git. GitHub is a service that provides hosting remote git repositories.

[Git vs. Github](https://stackoverflow.com/questions/13321556/difference-between-git-and-github)

## Remote repositories (Github)

Github provides a service for something we call a `remote repository`. A `remote repository` is a git repository that lives somewhere else in the world ... like in the cloud. Often this will be a git service provider like Github, Bitbucket, Git Lab, or Kiln, but could be a git remote repository that you setup yourself.

![Remote repository diagram](https://qph.fs.quoracdn.net/main-qimg-8451a3ecbca8820d36328d27bb19eed4)

Github is very popular and has extra features that make collaboration easier. It is also home to pretty much every open source project ever.

### Terminology

> `remote` is usually a repository that is not on your computer

> `local` is the repository on your computer that you are also working in

> `working copy` is all the files on your computer that are a part of your local repository

## Setting up a Github repository

Let's create a new Github repository.

1. Go to [Github](https://github.com) and make sure you are logged in. 
2. On the landing page click `New Repository`.
3. Repository name: git-workshop
4. Description: UA Carpentries git workshop
5. Add a license: select MIT (it's the most open)
6. Click `Create Repository`

You should see a new page with helpful tips on how to setup your remote. Notice

```bash
…or push an existing repository from the command line

git remote add origin git@github.com:<YourUserNameHere>/git-workshop.git
git push -u origin master
```

> I'm using ssh. You will probably see an `https` link.

We can use these git commands to link the git-workshop repository we have been working on in `Basic Git` and `Branching and Merging`. Make sure you are in your git-workshop directory for the next sections.

## Make sure you are on the master branch before continuing

Do you remember how to do that?

Try it yourself.

```bash
git checkout master
```

## git remote (link your local repository to your remote repository)

```bash
git remote add origin git@github.com:<YourUserNameHere>/git-workshop.git
```

This links your Github repo with your local repo. Let's check to see what remotes we have now.

```bash
git remote -v
```

`-v` means `verbose`. This will list all remotes and their URLs. 

You should see something like this:

> I'm using ssh. You will probably see an `https` link.

```text
$ git remote -v
origin  git@github.com:MarneeDear/git-workshop.git (fetch)
origin  git@github.com:MarneeDear/git-workshop.git (push)
```

What happened?

* We used `git remote add` to add a link to your new Github repository
* We named the remote `origin`
* We see a `fetch` URL and a `push` URL
  * Fetch is from where `git pull` and `git fetch` will come when you use `origin`
  * Push is to where `git push` will go when you use `origin`

## git push

Let's push all of our code to our new Github repository. Push means to send all of the latest changes to a remote repository.

```bash
git push -u origin master
```

What's going on in this command?

* `-u` aka `-set-upstream`
  * Upstream is the name of the remote repository to which you want to push. `-u` is going to link the local `master` branch to the origin `master` branch.

You should see output that looks something like this:

```bash
$ git push -u origin master
Counting objects: 3, done.
Writing objects: 100% (3/3), 238 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
remote:
remote: Create a pull request for 'master' on GitHub by visiting:
remote:      https://github.com/MarneeDear/git-workshop/pull/new/master
remote:
To github.com:MarneeDear/git-workshop.git
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
```

Notice

```text
Branch master set up to track remote branch master from origin.
```

That is the message saying that your local `master` branch is now tracking with your remote origin `master` branch.

Let's check to see what git thinks is happening now.

```bash
git status
```

```text
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
```

Did you notice something new?

> Your branch is up-to-date with 'origin/master'.

git is now also checking the status of your repository against the remote.

What does git check?

Git checks to see what commits are in the remote repository that are not in your local repository.

Let's see what happened on Github.

Go to your repository on Github and refresh the page. You should see all of your files.

## Review 1

What have we done so far?

* We setup a repository called `git-workshop`
* We added a remote called origin that points to the `git-workshop` remote branch on Github.
* We learned how to list our remotes with `git remote -v`
* We learned how to push such that we link a local branch with a remote branch with `git push -u <remotename> <branchname>`

![I didnt forget to push](http://m.memegen.com/bsky67.jpg)

> Take a few minutes break.

Do you have any questions? Put them in the Etherpad and we will try to get to them after the break.

## The Github repository

Let's take a tour of our Github repo.

We can see

* Our files and the last commit message that affected them
* A link to `branches`
* A link to `commits`

### Github branches

Just like on the command line, we can see branches on Github.

To see all the remote branches we can do this command:

```bash
git branch -r
```

### Github commits

Here we can see a commit history. This is a list of all of the changes that have been made to our files. If you click on a commit you can see a visual representation of what has changed.

* Green lines were lines that were added. 
* Red lines were lines that were removed or changed.

That's pretty nice. Thanks Github!


## Forking and cloning

Go to

https://github.com/UA-Carpentries-Workshops/2018-12-07-git-workshop

Click the Fork button.

Wait for GitHub to do its thing.

This made a copy of the repository in your account.

Now we can use `git clone` to make a copy of the repository on our computers.

First change directories to go to the root, or home, folder.

```bash
cd ~
```

On the repository page, drop down the green button and click the clipboard to copy the url to the repostory.

Use `git clone` to download the repository onto your computer. 

```bash
git clone git@github.com:MarneeDear/2018-12-07-git-workshop.git
```

Let's git do its thing.

Once it is done you can change directories to go to the new repository.

> Pro tip: tab complete!

```
cd 2018-12-07-git-workshop
```

Now list the content of the directory.

```bash
ls -la
```

Did you see the repository?

What remotes do you have now? Do you remember the command?

```bash
git remote -v
```

Note that git automatically made the clone source the `origin`.

(wait for stickies)

Now you can work in this repository, make and commit changes, and even push them, like we did earlier, to your remote repository.


> Common question: will changes made in the original repository get into my forked repository?

Changes will not automatically update in your forked repository. In order to get them into your forked repository you can 

1. Add the original repository ass a remote to this repository
2. Pull from the original repository (probably from the master branch)
3. Git will try to merge the branches
4. You might have to resolve merge conflicts. This is why branching is a good idea in forked repositories.

To add a new remote:

```bash
git remote add ua-carpentries https://github.com/UA-Carpentries-Workshops/2018-12-07-git-workshop.git
```

Now you can pull from the orignial remote

```bash
git pull ua-carpentries master
```

## Review 2

Let's take a break and review.

We learned about GitHub.

We forked a repository.

We used `git clone` to download a copy of the repo.

We added a remote to the original repository on UA Carpentries Workshop.

## Making pull requests

You do not have write access to the ua-carpentries remote, so if you want to contribute changes to it you will need to do something called a Pull Request.

Let's create a new file. It should have a unique name.

```bash
touch FirstName-MiddleName-LastName.md
```

Now open your file and add a few words about yourself and save the file.

Now commit the changes to the file. Do you remember the commands from Basic Git?

(wait for stickies)

Once it is committed

Try pushing it to the ua-carpentries remote

```bash
git push ua-carpentries master
```

Denied.

![Pull requests](http://seanhagen.github.io/git-presentation/img/keep-calm-and-send-a-pull-request.gif)

No biggee. Let's commit to origin instead. Do you remember how to do that?

(wait for stickies)

Refresh the page on GitHub. Do you see your file?

You're awesome. Now let's do the pull request.

On the Github page click `Pull request`. It should be under the Big Green Button. Enter a comment and a title.

Notice the arrow icon. This is telling you that you want to merge your `master` branch with the ua-carpentries `master` branch.

Click Create pull request to ask for this to happen.

I will see it come in on the UA-Carpentries-Workshop repo page.

I can now review it and merge it into master

In practice you would probably work on a branch and ask to merge in your branch.

## README.md

Every GitHub project should have a README that

* describes what the project is about
* with steps on how to use the code, files, data, etc.
* and if you want contributors, how to contribute

README.md files should be written in Markdown. This makes them look nice on the website.

## Licenses

By default your project on GitHub is a restrictive license. This means that they can read your stuff but they can't use it.

You can change the license. The least restrictive is the MIT license that let's anyone do anything they want with it.

## GitHub Organizations

If you will be working with a team, it is often helpful to setup an organization. This is where you will keep all of your main repositories and collaborators will make pull requests to those repositories.

[More on GitHub Organizations](https://help.github.com/articles/about-organizations/)
