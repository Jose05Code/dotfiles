# Contributing to Dotfiles

Thank you for your interest in contributing to this dotfiles repository! This document provides guidelines and instructions for contributing.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Getting Started](#getting-started)
- [Development Process](#development-process)
- [Style Guidelines](#style-guidelines)
- [Testing Your Changes](#testing-your-changes)
- [Submitting Changes](#submitting-changes)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Enhancements](#suggesting-enhancements)

## Code of Conduct

This project and everyone participating in it is governed by basic principles of respect and collaboration:

- Be respectful and inclusive
- Welcome newcomers and help them learn
- Focus on what is best for the community
- Show empathy towards other community members

## How Can I Contribute?

There are many ways to contribute to this project:

### 1. Report Bugs

If you find a bug, please create an issue with:
- A clear, descriptive title
- Detailed steps to reproduce the issue
- Expected behavior vs actual behavior
- Your environment (OS, shell version, terminal emulator)
- Screenshots if applicable

### 2. Suggest Enhancements

Have an idea for improvement? Create an issue with:
- A clear description of the enhancement
- Why it would be useful
- Possible implementation approach (optional)
- Examples from other projects (if relevant)

### 3. Improve Documentation

Documentation improvements are always welcome:
- Fix typos or clarify instructions
- Add missing information
- Create tutorials or guides
- Add screenshots or examples
- Improve README sections

### 4. Add New Features

Want to add new functionality? Consider:
- New aliases or shell functions
- Additional tool configurations
- Support for new platforms
- Integration with new tools
- Theme variations

### 5. Fix Bugs

Browse the [issues](https://github.com/Jose05Code/dotfiles/issues) for bugs to fix.

## Getting Started

### Prerequisites

Before contributing, ensure you have:
- Git installed and configured
- A GitHub account
- Basic knowledge of shell scripting (bash/zsh)
- Familiarity with dotfiles and Unix configuration

### Setting Up Your Development Environment

1. **Fork the repository** on GitHub

2. **Clone your fork:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/dotfiles.git
   cd dotfiles
   ```

3. **Add the upstream repository:**
   ```bash
   git remote add upstream https://github.com/Jose05Code/dotfiles.git
   ```

4. **Initialize submodules:**
   ```bash
   git submodule update --init --recursive
   ```

5. **Create a backup** of your current dotfiles:
   ```bash
   cp ~/.zshrc ~/.zshrc.backup
   cp -r ~/.config/kitty ~/.config/kitty.backup
   ```

6. **Test the configuration** in your environment

## Development Process

### 1. Create a Branch

Always create a new branch for your work:

```bash
git checkout -b feature/your-feature-name
```

Branch naming conventions:
- `feature/feature-name` - For new features
- `fix/bug-description` - For bug fixes
- `docs/what-you-changed` - For documentation updates
- `refactor/what-you-refactored` - For code refactoring

### 2. Make Your Changes

- Make focused, logical changes
- Test each change thoroughly
- Update documentation as needed
- Keep commits small and focused

### 3. Test Your Changes

Before submitting:
- Test on your local system
- Verify all aliases and functions work
- Check for syntax errors
- Test on different platforms if possible (Linux/macOS)

### 4. Commit Your Changes

Write clear, descriptive commit messages:

```bash
git commit -m "Add: fuzzy find alias for git stash"
```

Commit message format:
- `Add:` - Adding new features or files
- `Fix:` - Bug fixes
- `Update:` - Updating existing features
- `Remove:` - Removing features or files
- `Docs:` - Documentation changes
- `Refactor:` - Code refactoring

### 5. Keep Your Fork Updated

```bash
git fetch upstream
git rebase upstream/main
```

### 6. Push Your Changes

```bash
git push origin feature/your-feature-name
```

## Style Guidelines

### Shell Scripts

- Use meaningful variable names
- Add comments for complex logic
- Follow existing code style
- Use proper indentation (2 spaces)
- Add error handling where appropriate

Example:
```bash
# Good
if ! command -v fzf &> /dev/null; then
    echo "fzf is not installed"
    exit 1
fi

# Not so good
if ! command -v fzf &> /dev/null; then
echo "fzf is not installed"
exit 1
fi
```

### Aliases

- Use clear, intuitive names
- Group related aliases together
- Add comments explaining what they do
- Consider common use cases

Example:
```bash
# Good
# Fuzzy find and edit file
alias vf='nvim $(fzf)'

# Less clear
alias fe='nvim $(fzf)'
```

### Configuration Files

- Keep configurations portable when possible
- Add comments for non-obvious settings
- Group related settings together
- Consider cross-platform compatibility

### Documentation

- Use clear, concise language
- Include examples where helpful
- Keep formatting consistent
- Update TOC if you add sections
- Add screenshots for visual changes

## Testing Your Changes

### Manual Testing Checklist

Before submitting, verify:

- [ ] New aliases work as expected
- [ ] No syntax errors in shell scripts
- [ ] Submodules load correctly
- [ ] Configuration doesn't break existing functionality
- [ ] Changes work on your platform
- [ ] Documentation is accurate and clear
- [ ] No sensitive information is included

### Testing Commands

```bash
# Check for syntax errors in zsh files
zsh -n ~/dotfiles/zsh/zshrc
zsh -n ~/dotfiles/zsh/aliases.zsh

# Source the configuration
source ~/dotfiles/zsh/zshrc

# Test specific aliases
ls
ll
tree
vf
```

### Platform Testing

If possible, test on:
- Arch Linux (primary target)
- Ubuntu/Debian
- macOS

Note which platforms you've tested in your pull request.

## Submitting Changes

### Pull Request Process

1. **Ensure your branch is up to date:**
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. **Push your changes:**
   ```bash
   git push origin feature/your-feature-name
   ```

3. **Create a Pull Request** on GitHub

4. **Fill out the PR template** with:
   - Clear description of changes
   - Why the change is needed
   - What testing you've done
   - Related issue numbers (if any)
   - Screenshots (if visual changes)

5. **Wait for review** - Be patient and responsive to feedback

### Pull Request Template

```markdown
## Description
Brief description of what this PR does

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Refactoring

## Testing
Describe how you tested these changes

## Platforms Tested
- [ ] Arch Linux
- [ ] Ubuntu/Debian
- [ ] macOS

## Screenshots (if applicable)
Add screenshots here

## Related Issues
Fixes #(issue number)
```

## Reporting Bugs

### Before Reporting

1. **Check existing issues** - Someone may have already reported it
2. **Try the latest version** - The bug might be fixed
3. **Check your setup** - Ensure all dependencies are installed
4. **Isolate the problem** - Try to identify the specific cause

### Bug Report Template

```markdown
## Bug Description
Clear description of what the bug is

## Steps to Reproduce
1. Step one
2. Step two
3. Step three

## Expected Behavior
What you expected to happen

## Actual Behavior
What actually happened

## Environment
- OS: [e.g., Arch Linux, macOS 13]
- Shell version: [e.g., zsh 5.9]
- Terminal: [e.g., Kitty 0.26.0]
- Relevant tool versions: [e.g., fzf 0.35.0]

## Screenshots
If applicable, add screenshots

## Additional Context
Any other relevant information
```

## Suggesting Enhancements

### Enhancement Request Template

```markdown
## Feature Description
Clear description of the feature

## Use Case
Why would this feature be useful?

## Proposed Implementation
How might this be implemented? (optional)

## Alternatives Considered
What alternatives did you consider?

## Additional Context
Any other relevant information or examples
```

## Questions?

If you have questions about contributing:
- Open an issue with the `question` label
- Check existing documentation
- Look at closed issues and PRs for examples

## Recognition

Contributors will be recognized in:
- The README acknowledgments section
- Git commit history
- GitHub contributors page

Thank you for contributing! 🎉
