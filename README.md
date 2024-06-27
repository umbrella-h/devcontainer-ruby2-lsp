# devcontainer-ruby2-lsp

By default, the VS Code extension for [Ruby LSP requires Ruby 3.0 or newer to run.](https://github.com/Shopify/ruby-lsp/issues/1688#issuecomment-2004580232)

This is a VS Code Devcontainer settings example for:
- Applying Ruby LSP to a project in Ruby < 3.0.
- Running Ruby LSP in a Ruby version different from the project's.
> Currently, it is tested in one of my Ruby 2.7.0 projects.

This repository is originally designed for my colleagues, who prefer not to handle the Ruby environment directly and appreciate the convenience of Devcontainers.

For those comfortable handling the Ruby environment and not inclined to learn about Devcontainers now, it is suggested to follow [this article by Pagorn Phusaisakul](https://nrogap.medium.com/install-ruby-lsp-in-vs-code-128f02571ea0).

## Get Started

1. Place these files into `.devcontainer` directory using **"one of"** the following two methods:
   - METHOD 1: Copying Files (excluding `.git`):
     - a. Download or clone this repository.
     - b. Create a `.devcontainer` directory in your project.
     - c. Copy all files to your project's `.devcontainer` directory:
       ```bash
       cp -r /path/to/downloaded/files/. /path/to/project/.devcontainer
       ```
     - d. Remove the `.git` file:
       ```bash
       rm /path/to/project/.devcontainer/.git
       ```
   - METHOD 2: Using `git submodule`:
     > Recommended for those who wish to fetch updates from this repository.
     - a. Add this repository as a submodule:
       ```bash
       git submodule add https://github.com/umbrella-h/devcontainer-ruby2-lsp.git .devcontainer
       ```
     - b. Commit:
       ```bash
       git add .
       git commit -m "Add Devcontainer submodule"
       ```
     - d. To update the submodule to the latest version:
       ```bash
       cd .devcontainer
       git pull origin main
       cd ..
       git add .devcontainer
       git commit -m "Update devcontainer submodule"
       ```
1. Create a `.devcontainer/docker-compose.override.yml` file:
   > Refer to the `docker-compose.override.*example.yml` files.

   > It is recommended to customize the names of the image, container, and volume to make it easier to discriminate between projects. [See the simple example](./docker-compose.override.simple-example.yml).


1. Follow the steps in [this VS Code official tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial).
1. Ruby LSP should automatically start, and an indexing progress bar will appear at the bottom of your VS Code window.
   > If not, try restarting Ruby LSP using the command `Ruby LSP: Restart` in the VS Code Command Palette (`Ctrl/Command + Shift + P`).
